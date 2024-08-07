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
  # Generate assets using the native Shotstack provider AI services.  The following AI generation services are available: <ul>   <li><a href=\"#tocs_shotstacktexttospeechoptions\">ShotstackTextToSpeechOptions</a></li>   <li><a href=\"#tocs_shotstacktexttoimageoptions\">ShotstackTextToImageOptions</a></li>   <li><a href=\"#tocs_shotstackimagetovideooptions\">ShotstackImageToVideoOptions</a></li>   <li><a href=\"#tocs_shotstacktextgeneratoroptions\">ShotstackTextGeneratorOptions</a></li> </ul>
  module ShotstackGeneratedAssetOptions
    class << self
      # List of class defined in oneOf (OpenAPI v3)
      def openapi_one_of
        [
          :'ShotstackImageToVideoOptions',
          :'ShotstackTextGeneratorOptions',
          :'ShotstackTextToImageOptions',
          :'ShotstackTextToSpeechOptions'
        ]
      end

      # Discriminator's property name (OpenAPI v3)
      def openapi_discriminator_name
        :'type'
      end

      # Discriminator's mapping (OpenAPI v3)
      def openapi_discriminator_mapping
        {
          :'image-to-video' => :'ShotstackImageToVideoOptions',
          :'text-generator' => :'ShotstackTextToImageOptions',
          :'text-to-image' => :'ShotstackTextToImageOptions',
          :'text-to-speech' => :'ShotstackTextToSpeechOptions'
        }
      end

      # Builds the object
      # @param [Mixed] Data to be matched against the list of oneOf items
      # @return [Object] Returns the model or the data itself
      def build(data)
        discriminator_value = data[openapi_discriminator_name]
        return nil if discriminator_value.nil?

        klass = openapi_discriminator_mapping[discriminator_value.to_s.to_sym]
        return nil unless klass

        Shotstack.const_get(klass).build_from_hash(data)
      end
    end
  end

end
