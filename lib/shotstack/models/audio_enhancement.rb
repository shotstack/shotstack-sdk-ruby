=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'date'
require 'time'

module Shotstack
  # An audio enhancement that can be applied to the audio content of a rendition. The following providers are available: <ul>   <li><a href=\"#tocs_dolbyenhancement\">DolbyEnhancement</a></li> </ul>
  module AudioEnhancement
    class << self
      # List of class defined in oneOf (OpenAPI v3)
      def openapi_one_of
        [
          :'DolbyEnhancement'
        ]
      end

      # Discriminator's property name (OpenAPI v3)
      def openapi_discriminator_name
        :'enhancement'
      end

      # Builds the object
      # @param [Mixed] Data to be matched against the list of oneOf items
      # @return [Object] Returns the model or the data itself
      def build(data)
        discriminator_value = data[openapi_discriminator_name]
        return nil if discriminator_value.nil?
        Shotstack.const_get(discriminator_value).build_from_hash(data)
      end
    end
  end

end
