require 'awesome_print'
require 'tranquility'
c = Tranquility::Crest.root
ap c.regions['11000001'].first.constellations.inspect
