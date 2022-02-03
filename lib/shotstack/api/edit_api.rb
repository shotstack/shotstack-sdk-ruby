=begin
#Shotstack

#Shotstack is a video, image and audio editing service that allows for the automated generation of videos, images and audio using JSON and a RESTful API.  You arrange and configure an edit and POST it to the API which will render your media and provide a file  location when complete.  For more details visit [shotstack.io](https://shotstack.io) or checkout our [getting started](https://shotstack.gitbook.io/docs/guides/getting-started) documentation. There are two main API's, one for editing and generating assets (Edit API) and one for managing hosted assets (Serve API).  The Edit API base URL is: <b>https://api.shotstack.io/{version}</b>  The Serve API base URL is: <b>https://api.shotstack.io/serve/{version}</b>

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0

=end

require 'cgi'

module Shotstack
  class EditApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Render Status
    # Get the rendering status, temporary asset url and details of a render by ID.  **Base URL:** https://api.shotstack.io/{version}
    # @param id [String] The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :data Include the data parameter in the response. The data parameter includes the original timeline, output and other settings sent to the API.&lt;br&gt;&lt;br&gt;&lt;b&gt;Note:&lt;/b&gt; the default is currently &#x60;true&#x60;, this is deprecated and the default will soon be &#x60;false&#x60;. If you rely on the data being returned in the response you should explicitly set the parameter to &#x60;true&#x60;.
    # @option opts [Boolean] :merged Used when data is set to true, it will show the [merge fields](#tocs_mergefield) merged in to the data response.
    # @return [RenderResponse]
    def get_render(id, opts = {})
      data, _status_code, _headers = get_render_with_http_info(id, opts)
      data
    end

    # Get Render Status
    # Get the rendering status, temporary asset url and details of a render by ID.  **Base URL:** https://api.shotstack.io/{version}
    # @param id [String] The id of the timeline render task in UUID format
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :data Include the data parameter in the response. The data parameter includes the original timeline, output and other settings sent to the API.&lt;br&gt;&lt;br&gt;&lt;b&gt;Note:&lt;/b&gt; the default is currently &#x60;true&#x60;, this is deprecated and the default will soon be &#x60;false&#x60;. If you rely on the data being returned in the response you should explicitly set the parameter to &#x60;true&#x60;.
    # @option opts [Boolean] :merged Used when data is set to true, it will show the [merge fields](#tocs_mergefield) merged in to the data response.
    # @return [Array<(RenderResponse, Integer, Hash)>] RenderResponse data, response status code and response headers
    def get_render_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.get_render ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EditApi.get_render"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling EditApi.get_render, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/render/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'data'] = opts[:'data'] if !opts[:'data'].nil?
      query_params[:'merged'] = opts[:'merged'] if !opts[:'merged'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'RenderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.get_render",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#get_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Render Asset
    # Queue and render the contents of a timeline as a video, image or audio file.  **Base URL:** https://api.shotstack.io/{version}
    # @param edit [Edit] The video, image or audio edit specified using JSON.
    # @param [Hash] opts the optional parameters
    # @return [QueuedResponse]
    def post_render(edit, opts = {})
      data, _status_code, _headers = post_render_with_http_info(edit, opts)
      data
    end

    # Render Asset
    # Queue and render the contents of a timeline as a video, image or audio file.  **Base URL:** https://api.shotstack.io/{version}
    # @param edit [Edit] The video, image or audio edit specified using JSON.
    # @param [Hash] opts the optional parameters
    # @return [Array<(QueuedResponse, Integer, Hash)>] QueuedResponse data, response status code and response headers
    def post_render_with_http_info(edit, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.post_render ...'
      end
      # verify the required parameter 'edit' is set
      if @api_client.config.client_side_validation && edit.nil?
        fail ArgumentError, "Missing the required parameter 'edit' when calling EditApi.post_render"
      end
      # resource path
      local_var_path = '/render'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(edit)

      # return_type
      return_type = opts[:debug_return_type] || 'QueuedResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.post_render",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#post_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Inspect Media
    # Inspects any media asset (image, video, audio) on the internet using a hosted version of [FFprobe](https://ffmpeg.org/ffprobe.html). The probe endpoint returns useful information about an asset such as width, height, duration, rotation, framerate, etc...  **Base URL:** https://api.shotstack.io/{version}
    # @param url [String] The URL of the media to inspect, must be **URL encoded**.
    # @param [Hash] opts the optional parameters
    # @return [ProbeResponse]
    def probe(url, opts = {})
      data, _status_code, _headers = probe_with_http_info(url, opts)
      data
    end

    # Inspect Media
    # Inspects any media asset (image, video, audio) on the internet using a hosted version of [FFprobe](https://ffmpeg.org/ffprobe.html). The probe endpoint returns useful information about an asset such as width, height, duration, rotation, framerate, etc...  **Base URL:** https://api.shotstack.io/{version}
    # @param url [String] The URL of the media to inspect, must be **URL encoded**.
    # @param [Hash] opts the optional parameters
    # @return [Array<(ProbeResponse, Integer, Hash)>] ProbeResponse data, response status code and response headers
    def probe_with_http_info(url, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.probe ...'
      end
      # verify the required parameter 'url' is set
      if @api_client.config.client_side_validation && url.nil?
        fail ArgumentError, "Missing the required parameter 'url' when calling EditApi.probe"
      end
      # resource path
      local_var_path = '/probe/{url}'.sub('{' + 'url' + '}', CGI.escape(url.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ProbeResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.probe",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#probe\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end