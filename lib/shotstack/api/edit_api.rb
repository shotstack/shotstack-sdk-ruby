=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'cgi'

module Shotstack
  class EditApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete Template
    # Delete a template by its template id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param id [String] The id of the template in UUID format
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_template(id, opts = {})
      delete_template_with_http_info(id, opts)
      nil
    end

    # Delete Template
    # Delete a template by its template id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param id [String] The id of the template in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_template_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.delete_template ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EditApi.delete_template"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling EditApi.delete_template, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/templates/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.delete_template",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#delete_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Render Status
    # Get the rendering status, temporary asset url and details of a render by ID.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
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
    # Get the rendering status, temporary asset url and details of a render by ID.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
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

    # Retrieve Template
    # Retrieve a template by template id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param id [String] The id of the template in UUID format
    # @param [Hash] opts the optional parameters
    # @return [TemplateDataResponse]
    def get_template(id, opts = {})
      data, _status_code, _headers = get_template_with_http_info(id, opts)
      data
    end

    # Retrieve Template
    # Retrieve a template by template id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param id [String] The id of the template in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateDataResponse, Integer, Hash)>] TemplateDataResponse data, response status code and response headers
    def get_template_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.get_template ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EditApi.get_template"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling EditApi.get_template, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/templates/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'TemplateDataResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.get_template",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#get_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Templates
    # Retrieve a list of templates stored against a users account and stage.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param [Hash] opts the optional parameters
    # @return [TemplateListResponse]
    def get_templates(opts = {})
      data, _status_code, _headers = get_templates_with_http_info(opts)
      data
    end

    # List Templates
    # Retrieve a list of templates stored against a users account and stage.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateListResponse, Integer, Hash)>] TemplateListResponse data, response status code and response headers
    def get_templates_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.get_templates ...'
      end
      # resource path
      local_var_path = '/templates'

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
      return_type = opts[:debug_return_type] || 'TemplateListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.get_templates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#get_templates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Render Asset
    # Queue and render the contents of an [Edit](#tocs_edit) as a video, image or audio file.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param edit [Edit] The video, image or audio edit specified using JSON.
    # @param [Hash] opts the optional parameters
    # @return [QueuedResponse]
    def post_render(edit, opts = {})
      data, _status_code, _headers = post_render_with_http_info(edit, opts)
      data
    end

    # Render Asset
    # Queue and render the contents of an [Edit](#tocs_edit) as a video, image or audio file.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
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
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

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

    # Create Template
    # Save an [Edit](#tocs_edit) as a re-usable template. Templates can be retrieved and modified in your application before being rendered. [Merge fields](#tocs_mergefield) can be also used to merge data in to a template and [render](#render-template) it in a single request.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param template [Template] Create a template with a name and [Edit](#tocs_edit).
    # @param [Hash] opts the optional parameters
    # @return [TemplateResponse]
    def post_template(template, opts = {})
      data, _status_code, _headers = post_template_with_http_info(template, opts)
      data
    end

    # Create Template
    # Save an [Edit](#tocs_edit) as a re-usable template. Templates can be retrieved and modified in your application before being rendered. [Merge fields](#tocs_mergefield) can be also used to merge data in to a template and [render](#render-template) it in a single request.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param template [Template] Create a template with a name and [Edit](#tocs_edit).
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateResponse, Integer, Hash)>] TemplateResponse data, response status code and response headers
    def post_template_with_http_info(template, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.post_template ...'
      end
      # verify the required parameter 'template' is set
      if @api_client.config.client_side_validation && template.nil?
        fail ArgumentError, "Missing the required parameter 'template' when calling EditApi.post_template"
      end
      # resource path
      local_var_path = '/templates'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(template)

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.post_template",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#post_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Render Template
    # Render an asset from a template id and optional merge fields. Merge fields can be used to replace placeholder variables within the [Edit](#tocs_edit).  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param template_render [TemplateRender] Render a template by template id.
    # @param [Hash] opts the optional parameters
    # @return [QueuedResponse]
    def post_template_render(template_render, opts = {})
      data, _status_code, _headers = post_template_render_with_http_info(template_render, opts)
      data
    end

    # Render Template
    # Render an asset from a template id and optional merge fields. Merge fields can be used to replace placeholder variables within the [Edit](#tocs_edit).  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param template_render [TemplateRender] Render a template by template id.
    # @param [Hash] opts the optional parameters
    # @return [Array<(QueuedResponse, Integer, Hash)>] QueuedResponse data, response status code and response headers
    def post_template_render_with_http_info(template_render, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.post_template_render ...'
      end
      # verify the required parameter 'template_render' is set
      if @api_client.config.client_side_validation && template_render.nil?
        fail ArgumentError, "Missing the required parameter 'template_render' when calling EditApi.post_template_render"
      end
      # resource path
      local_var_path = '/templates/render'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(template_render)

      # return_type
      return_type = opts[:debug_return_type] || 'QueuedResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.post_template_render",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#post_template_render\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Inspect Media
    # Inspects any media asset (image, video, audio) on the internet using a hosted version of [FFprobe](https://ffmpeg.org/ffprobe.html). The probe endpoint returns useful information about an asset such as width, height, duration, rotation, framerate, etc...  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param url [String] The URL of the media to inspect, must be **URL encoded**.
    # @param [Hash] opts the optional parameters
    # @return [ProbeResponse]
    def probe(url, opts = {})
      data, _status_code, _headers = probe_with_http_info(url, opts)
      data
    end

    # Inspect Media
    # Inspects any media asset (image, video, audio) on the internet using a hosted version of [FFprobe](https://ffmpeg.org/ffprobe.html). The probe endpoint returns useful information about an asset such as width, height, duration, rotation, framerate, etc...  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
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

    # Update Template
    # Update an existing template by template id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/edit/{version}</a> 
    # @param id [String] The id of the template in UUID format
    # @param template [Template] Update an individual templates name and [Edit](#tocs_edit). Both template name and template must be provided. If the template parameter is omitted a blank template will be saved.
    # @param [Hash] opts the optional parameters
    # @return [TemplateResponse]
    def put_template(id, template, opts = {})
      data, _status_code, _headers = put_template_with_http_info(id, template, opts)
      data
    end

    # Update Template
    # Update an existing template by template id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/edit/{version}&lt;/a&gt; 
    # @param id [String] The id of the template in UUID format
    # @param template [Template] Update an individual templates name and [Edit](#tocs_edit). Both template name and template must be provided. If the template parameter is omitted a blank template will be saved.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateResponse, Integer, Hash)>] TemplateResponse data, response status code and response headers
    def put_template_with_http_info(id, template, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EditApi.put_template ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EditApi.put_template"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling EditApi.put_template, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'template' is set
      if @api_client.config.client_side_validation && template.nil?
        fail ArgumentError, "Missing the required parameter 'template' when calling EditApi.put_template"
      end
      # resource path
      local_var_path = '/templates/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(template)

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"EditApi.put_template",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EditApi#put_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
