=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

# Common files
require 'shotstack/api_client'
require 'shotstack/api_error'
require 'shotstack/version'
require 'shotstack/configuration'

# Models
require 'shotstack/models/asset'
require 'shotstack/models/asset_render_response'
require 'shotstack/models/asset_response'
require 'shotstack/models/asset_response_attributes'
require 'shotstack/models/asset_response_data'
require 'shotstack/models/audio_asset'
require 'shotstack/models/audio_enhancement'
require 'shotstack/models/clip'
require 'shotstack/models/crop'
require 'shotstack/models/did_generated_asset'
require 'shotstack/models/did_generated_asset_options'
require 'shotstack/models/did_text_to_avatar_options'
require 'shotstack/models/destinations'
require 'shotstack/models/dolby_enhancement'
require 'shotstack/models/dolby_enhancement_options'
require 'shotstack/models/edit'
require 'shotstack/models/eleven_labs_generated_asset'
require 'shotstack/models/eleven_labs_generated_asset_options'
require 'shotstack/models/eleven_labs_text_to_speech_options'
require 'shotstack/models/enhancements'
require 'shotstack/models/flip_transformation'
require 'shotstack/models/font'
require 'shotstack/models/generated_asset'
require 'shotstack/models/generated_asset_error_response'
require 'shotstack/models/generated_asset_error_response_data'
require 'shotstack/models/generated_asset_response'
require 'shotstack/models/generated_asset_response_attributes'
require 'shotstack/models/generated_asset_response_data'
require 'shotstack/models/google_cloud_storage_destination'
require 'shotstack/models/google_cloud_storage_destination_options'
require 'shotstack/models/google_drive_destination'
require 'shotstack/models/google_drive_destination_options'
require 'shotstack/models/hey_gen_generated_asset'
require 'shotstack/models/hey_gen_generated_asset_options'
require 'shotstack/models/hey_gen_text_to_avatar_options'
require 'shotstack/models/html_asset'
require 'shotstack/models/image_asset'
require 'shotstack/models/ingest_error_response'
require 'shotstack/models/ingest_error_response_data'
require 'shotstack/models/luma_asset'
require 'shotstack/models/merge_field'
require 'shotstack/models/mux_destination'
require 'shotstack/models/mux_destination_options'
require 'shotstack/models/offset'
require 'shotstack/models/open_ai_generated_asset'
require 'shotstack/models/open_ai_generated_asset_options'
require 'shotstack/models/open_ai_text_generator_options'
require 'shotstack/models/output'
require 'shotstack/models/outputs'
require 'shotstack/models/outputs_response'
require 'shotstack/models/poster'
require 'shotstack/models/probe_response'
require 'shotstack/models/queued_response'
require 'shotstack/models/queued_response_data'
require 'shotstack/models/queued_source_response'
require 'shotstack/models/queued_source_response_data'
require 'shotstack/models/range'
require 'shotstack/models/render_response'
require 'shotstack/models/render_response_data'
require 'shotstack/models/rendition'
require 'shotstack/models/rendition_response_attributes'
require 'shotstack/models/rotate_transformation'
require 'shotstack/models/s3_destination'
require 'shotstack/models/s3_destination_options'
require 'shotstack/models/shotstack_destination'
require 'shotstack/models/shotstack_generated_asset'
require 'shotstack/models/shotstack_generated_asset_options'
require 'shotstack/models/shotstack_image_to_video_options'
require 'shotstack/models/shotstack_text_generator_options'
require 'shotstack/models/shotstack_text_to_image_options'
require 'shotstack/models/shotstack_text_to_speech_options'
require 'shotstack/models/size'
require 'shotstack/models/skew_transformation'
require 'shotstack/models/soundtrack'
require 'shotstack/models/source'
require 'shotstack/models/source_list_response'
require 'shotstack/models/source_response'
require 'shotstack/models/source_response_attributes'
require 'shotstack/models/source_response_data'
require 'shotstack/models/speed'
require 'shotstack/models/stability_ai_generated_asset'
require 'shotstack/models/stability_ai_generated_asset_options'
require 'shotstack/models/stability_ai_text_to_image_options'
require 'shotstack/models/template'
require 'shotstack/models/template_data_response'
require 'shotstack/models/template_data_response_data'
require 'shotstack/models/template_list_response'
require 'shotstack/models/template_list_response_data'
require 'shotstack/models/template_list_response_item'
require 'shotstack/models/template_render'
require 'shotstack/models/template_response'
require 'shotstack/models/template_response_data'
require 'shotstack/models/thumbnail'
require 'shotstack/models/timeline'
require 'shotstack/models/title_asset'
require 'shotstack/models/track'
require 'shotstack/models/transcription'
require 'shotstack/models/transfer'
require 'shotstack/models/transfer_response'
require 'shotstack/models/transfer_response_attributes'
require 'shotstack/models/transfer_response_data'
require 'shotstack/models/transformation'
require 'shotstack/models/transition'
require 'shotstack/models/upload_response'
require 'shotstack/models/upload_response_attributes'
require 'shotstack/models/upload_response_data'
require 'shotstack/models/video_asset'

# APIs
require 'shotstack/api/create_api'
require 'shotstack/api/edit_api'
require 'shotstack/api/ingest_api'
require 'shotstack/api/serve_api'

module Shotstack
  class << self
    # Customize default settings for the SDK using block.
    #   Shotstack.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
