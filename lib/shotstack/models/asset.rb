=begin
#Shotstack

#Shotstack is a video, image and audio editing service that allows for the automated generation of videos, images and audio using JSON and a RESTful API.  You arrange and configure an edit and POST it to the API which will render your media and provide a file  location when complete.  For more details visit [shotstack.io](https://shotstack.io) or checkout our [getting started](https://shotstack.io/docs/guide/) documentation. There are two main API's, one for editing and generating assets (Edit API) and one for managing hosted assets (Serve API).  The Edit API base URL is: <b>https://api.shotstack.io/{version}</b>  The Serve API base URL is: <b>https://api.shotstack.io/serve/{version}</b>

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.4.0

=end

require 'date'
require 'time'

module Shotstack
  # The type of asset to display for the duration of this Clip. Value     must be one of:       <ul>         <li><a href=\"#tocs_videoasset\">VideoAsset</a></li>         <li><a href=\"#tocs_imageasset\">ImageAsset</a></li>         <li><a href=\"#tocs_titleasset\">TitleAsset</a></li>         <li><a href=\"#tocs_htmlasset\">HtmlAsset</a></li>         <li><a href=\"#tocs_audioasset\">AudioAsset</a></li>         <li><a href=\"#tocs_lumaasset\">LumaAsset</a></li>       </ul>
  module Asset
    class << self
      # List of class defined in oneOf (OpenAPI v3)
      def openapi_one_of
        [
          :'AudioAsset',
          :'HtmlAsset',
          :'ImageAsset',
          :'LumaAsset',
          :'TitleAsset',
          :'VideoAsset'
        ]
      end

      # Discriminator's property name (OpenAPI v3)
      def openapi_discriminator_name
        :'asset'
      end

      # Builds the object
      # @param [Mixed] Data to be matched against the list of oneOf items
      # @return [Object] Returns the model or the data itself
      def build(data)
        discriminator_value = data[openapi_discriminator_name]
        return nil unless discriminator_value
        Shotstack.const_get(discriminator_value).build_from_hash(data)
      end
    end
  end

end
