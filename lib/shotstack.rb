# Common files
require 'shotstack/api_client'
require 'shotstack/api_error'
require 'shotstack/version'
require 'shotstack/configuration'

# Models
require 'shotstack/models/render_response_data'
require 'shotstack/models/render_response'
require 'shotstack/models/queued_response_data'
require 'shotstack/models/queued_response'
require 'shotstack/models/output'
require 'shotstack/models/transition'
require 'shotstack/models/video_clip_options'
require 'shotstack/models/video_clip'
require 'shotstack/models/image_clip_options'
require 'shotstack/models/image_clip'
require 'shotstack/models/title_clip_options'
require 'shotstack/models/title_clip'
require 'shotstack/models/track'
require 'shotstack/models/clips'
require 'shotstack/models/soundtrack'
require 'shotstack/models/timeline'
require 'shotstack/models/edit'

# APIs
require 'shotstack/api/render_api'

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
