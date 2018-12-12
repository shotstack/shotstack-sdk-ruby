require "uri"

module Shotstack
  class RenderApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # 
    # Render the contents of a timeline as a video file.
    # @param edit Edit
    # @param [Hash] opts the optional parameters
    # @return [QueuedResponse]
    def post_render(edit, opts = {})
      data, status_code, headers = post_render_with_http_info(edit, opts)
      return data
    end

    # 
    # Render the contents of a timeline as a video file.
    # @param edit Edit
    # @param [Hash] opts the optional parameters
    # @return [Array<(QueuedResponse, Fixnum, Hash)>] QueuedResponse data, response status code and response headers
    def post_render_with_http_info(edit, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RenderApi#post_render ..."
      end
      
      # verify the required parameter 'edit' is set
      fail "Missing the required parameter 'edit' when calling post_render" if edit.nil?
      
      # resource path
      path = "/render".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(edit)
      

      auth_names = ['DeveloperKey']
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'QueuedResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RenderApi#post_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 
    # Get the rendering status and details of a timeline by ID.
    # @param id The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @return [RenderResponse]
    def get_render(id, opts = {})
      data, status_code, headers = get_render_with_http_info(id, opts)
      return data
    end

    # 
    # Get the rendering status and details of a timeline by ID.
    # @param id The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(RenderResponse, Fixnum, Hash)>] RenderResponse data, response status code and response headers
    def get_render_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RenderApi#get_render ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling get_render" if id.nil?
      
      # resource path
      path = "/render/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['DeveloperKey']
      data, status_code, headers = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RenderResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RenderApi#get_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




