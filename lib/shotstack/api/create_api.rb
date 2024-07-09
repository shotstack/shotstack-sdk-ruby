=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'cgi'

module Shotstack
  class CreateApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Generated Asset
    # Get the generated assets status, url and details by ID.  **Base URL:** <a href=\"#\">https://api.shotstack.io/create/{version}</a> 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [GeneratedAssetResponse]
    def get_generated_asset(id, opts = {})
      data, _status_code, _headers = get_generated_asset_with_http_info(id, opts)
      data
    end

    # Get Generated Asset
    # Get the generated assets status, url and details by ID.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/create/{version}&lt;/a&gt; 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GeneratedAssetResponse, Integer, Hash)>] GeneratedAssetResponse data, response status code and response headers
    def get_generated_asset_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CreateApi.get_generated_asset ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CreateApi.get_generated_asset"
      end
      pattern = Regexp.new(/^[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling CreateApi.get_generated_asset, must conform to the pattern #{pattern}."
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
      return_type = opts[:debug_return_type] || 'GeneratedAssetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"CreateApi.get_generated_asset",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CreateApi#get_generated_asset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Generate Asset
    # Generate an asset using a Shotstack or third party provider. Chose the provider, type of asset and provide prompts, inputs and options to generate the asset. Once generated the asset can be used with the [Edit](#tocs_edit) API or downloaded.  **Base URL:** <a href=\"#\">https://api.shotstack.io/create/{version}</a> 
    # @param generated_asset [GeneratedAsset] Generate an asset using the specified provider, type and options.
    # @param [Hash] opts the optional parameters
    # @return [GeneratedAssetResponse]
    def post_generate_asset(generated_asset, opts = {})
      data, _status_code, _headers = post_generate_asset_with_http_info(generated_asset, opts)
      data
    end

    # Generate Asset
    # Generate an asset using a Shotstack or third party provider. Chose the provider, type of asset and provide prompts, inputs and options to generate the asset. Once generated the asset can be used with the [Edit](#tocs_edit) API or downloaded.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/create/{version}&lt;/a&gt; 
    # @param generated_asset [GeneratedAsset] Generate an asset using the specified provider, type and options.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GeneratedAssetResponse, Integer, Hash)>] GeneratedAssetResponse data, response status code and response headers
    def post_generate_asset_with_http_info(generated_asset, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CreateApi.post_generate_asset ...'
      end
      # verify the required parameter 'generated_asset' is set
      if @api_client.config.client_side_validation && generated_asset.nil?
        fail ArgumentError, "Missing the required parameter 'generated_asset' when calling CreateApi.post_generate_asset"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(generated_asset)

      # return_type
      return_type = opts[:debug_return_type] || 'GeneratedAssetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"CreateApi.post_generate_asset",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CreateApi#post_generate_asset\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end