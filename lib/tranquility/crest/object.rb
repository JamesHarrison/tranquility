module Tranquility::Crest
  # The Object class represents a JSON response from the CREST API, or
  # a fragment of a response.
  # It provides dynamic access to attributes on the current response.
  # To load linked resources, you can simply call .href to load the next
  # resource, or call attributes on the linked resource to implicitly load
  # the resource.
  class Object
    # Initialize a new instance, optionally with data/headers
    def initialize(uri,data=nil,headers=nil)
      @uri = uri
      if headers
        @response_headers = headers
      end
      if data
        @data = data
        @loaded = true
      else
        do_load
      end
    end
    # Get an attribute
    def method_missing(method, *args, &block)
      # Load this page if we haven't done so already
      # TODO: Would be nice to skip this if we don't need any attribs but want a nested resource?
      do_load unless @loaded
      if method.to_s == "href"
        # "Manual" load of the linked resource
        return Object.new(@data.send(method.to_sym))
      else
        if @data.respond_to?(method.to_sym)
          return Object.new(@uri, @data.send(method.to_sym), @response_headers)
        else
          if @data.respond_to?(:href)
            return self.href.send(method.to_sym)
          end
        end
      end
    end
    # Inspect an Object
    def inspect
      {data: @data, headers: @response_headers}
    end

    private
    def conn
      @conn ||= Faraday.new(url: @uri) do |c|
        c.use FaradayMiddleware::FollowRedirects
        c.adapter Faraday.default_adapter
      end
    end
    def do_load
      return true if @loaded
      resp = conn.get
      ap resp.status
      if resp.status == 200
        @loaded = true
        parsed_data = ::MultiJson.load(resp.body, symbolize_keys: true)
        @data = Hashie::Mash.new parsed_data
        @response_headers = resp.headers
      else
        fail ApiResponseError, "Request to #{@uri} got status #{resp.status}"
      end
    end
  end
end
