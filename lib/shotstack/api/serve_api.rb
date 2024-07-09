=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'cgi'

module Shotstack
  class ServeApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete Asset
    # Delete an asset by its asset id. If a render creates multiple assets, such as thumbnail and poster images, each asset must be deleted individually by the asset id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/serve/{version}</a> 
    # @param id [String] The id of the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_asset(id, opts = {})
      delete_asset_with_http_info(id, opts)
      nil
    end

    # Delete Asset
    # Delete an asset by its asset id. If a render creates multiple assets, such as thumbnail and poster images, each asset must be deleted individually by the asset id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/serve/{version}&lt;/a&gt; 
    # @param id [String] The id of the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_asset_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServeApi.delete_asset ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ServeApi.delete_asset"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling ServeApi.delete_asset, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/assets/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
        :operation => :"ServeApi.delete_asset",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServeApi#delete_asset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Asset
    # The Serve API is used to interact with, and delete hosted assets including videos, images, audio files,  thumbnails and poster images. Use this endpoint to fetch an asset by asset id. Note that an asset id is unique for each asset and different from the render id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/serve/{version}</a> 
    # @param id [String] The id of the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [AssetResponse]
    def get_asset(id, opts = {})
      data, _status_code, _headers = get_asset_with_http_info(id, opts)
      data
    end

    # Get Asset
    # The Serve API is used to interact with, and delete hosted assets including videos, images, audio files,  thumbnails and poster images. Use this endpoint to fetch an asset by asset id. Note that an asset id is unique for each asset and different from the render id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/serve/{version}&lt;/a&gt; 
    # @param id [String] The id of the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(AssetResponse, Integer, Hash)>] AssetResponse data, response status code and response headers
    def get_asset_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServeApi.get_asset ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ServeApi.get_asset"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling ServeApi.get_asset, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/assets/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'AssetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"ServeApi.get_asset",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServeApi#get_asset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Asset by Render ID
    # A render may generate more than one file, such as a video, thumbnail and poster image. When the assets are created the only known id is the render id returned by the original [render request](#render-video), status  request or webhook. This endpoint lets you look up one or more assets by the render id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/serve/{version}</a> 
    # @param id [String] The render id associated with the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [AssetRenderResponse]
    def get_asset_by_render_id(id, opts = {})
      data, _status_code, _headers = get_asset_by_render_id_with_http_info(id, opts)
      data
    end

    # Get Asset by Render ID
    # A render may generate more than one file, such as a video, thumbnail and poster image. When the assets are created the only known id is the render id returned by the original [render request](#render-video), status  request or webhook. This endpoint lets you look up one or more assets by the render id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/serve/{version}&lt;/a&gt; 
    # @param id [String] The render id associated with the asset in UUID format
    # @param [Hash] opts the optional parameters
    # @return [Array<(AssetRenderResponse, Integer, Hash)>] AssetRenderResponse data, response status code and response headers
    def get_asset_by_render_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServeApi.get_asset_by_render_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ServeApi.get_asset_by_render_id"
      end
      pattern = Regexp.new(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling ServeApi.get_asset_by_render_id, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/assets/render/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'AssetRenderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"ServeApi.get_asset_by_render_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServeApi#get_asset_by_render_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Transfer Asset
    # Transfer a file from any publicly available URL to one or more Serve API [destinations](#tocs_destinations).  **Base URL:** <a href=\"#\">https://api.shotstack.io/serve/{version}</a> 
    # @param transfer [Transfer] Fetch an asset from a URL and send it to one or more destinations.
    # @param [Hash] opts the optional parameters
    # @return [TransferResponse]
    def post_serve_asset(transfer, opts = {})
      data, _status_code, _headers = post_serve_asset_with_http_info(transfer, opts)
      data
    end

    # Transfer Asset
    # Transfer a file from any publicly available URL to one or more Serve API [destinations](#tocs_destinations).  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/serve/{version}&lt;/a&gt; 
    # @param transfer [Transfer] Fetch an asset from a URL and send it to one or more destinations.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TransferResponse, Integer, Hash)>] TransferResponse data, response status code and response headers
    def post_serve_asset_with_http_info(transfer, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServeApi.post_serve_asset ...'
      end
      # verify the required parameter 'transfer' is set
      if @api_client.config.client_side_validation && transfer.nil?
        fail ArgumentError, "Missing the required parameter 'transfer' when calling ServeApi.post_serve_asset"
      end
      # resource path
      local_var_path = '/assets'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(transfer)

      # return_type
      return_type = opts[:debug_return_type] || 'TransferResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"ServeApi.post_serve_asset",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServeApi#post_serve_asset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
