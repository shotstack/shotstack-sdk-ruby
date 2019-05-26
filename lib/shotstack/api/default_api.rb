=begin
#shotstack

#The Shotstack API is a video editing service that allows for the programatic creation of videos using JSON. 

OpenAPI spec version: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.0.0-beta3

=end

require 'uri'

module Shotstack
  class DefaultApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get the rendering status and details of a timeline by ID.
    # @param id [String] The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @return [RenderResponse]
    def get_render(id, opts = {})
      data, _status_code, _headers = g_et_render_id_with_http_info(id, opts)
      data
    end

    # Get the rendering status and details of a timeline by ID.
    # @param id [String] The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(RenderResponse, Integer, Hash)>] RenderResponse data, response status code and response headers
    def g_et_render_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DefaultApi.g_et_render_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling DefaultApi.g_et_render_id"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling DefaultApi.get_render, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/render/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['DeveloperKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RenderResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#get_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Render the contents of a timeline as a video file.
    # @param edit [Edit] 
    # @param [Hash] opts the optional parameters
    # @return [QueuedResponse]
    def post_render(edit, opts = {})
      data, _status_code, _headers = p_ost_render_with_http_info(edit, opts)
      data
    end

    # Render the contents of a timeline as a video file.
    # @param edit [Edit] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(QueuedResponse, Integer, Hash)>] QueuedResponse data, response status code and response headers
    def p_ost_render_with_http_info(edit, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DefaultApi.post_render ...'
      end
      # verify the required parameter 'edit' is set
      if @api_client.config.client_side_validation && edit.nil?
        fail ArgumentError, "Missing the required parameter 'edit' when calling DefaultApi.post_render"
      end
      # resource path
      local_var_path = '/render'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(edit)
      auth_names = ['DeveloperKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'QueuedResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#post_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
