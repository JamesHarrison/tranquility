# Classes and methods relating to CREST APIs
module Tranquility::Crest
  # The root URI for CREST requests
  ROOT_URI = "http://public-crest.eveonline.com/"
  # Return an object describing the root of the CREST API
  def self.root
    Tranquility::Crest::Object.new(ROOT_URI)
  end
  # If something goes wrong while accessing the API we'll throw this
  class ApiResponseError < RuntimeError; end
end
