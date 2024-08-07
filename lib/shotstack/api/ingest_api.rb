=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'cgi'

module Shotstack
  class IngestApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete Source
    # Delete an ingested source file by its id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/ingest/{version}</a> 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_source(id, opts = {})
      delete_source_with_http_info(id, opts)
      nil
    end

    # Delete Source
    # Delete an ingested source file by its id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/ingest/{version}&lt;/a&gt; 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_source_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IngestApi.delete_source ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling IngestApi.delete_source"
      end
      pattern = Regexp.new(/^[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling IngestApi.delete_source, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/sources/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
        :operation => :"IngestApi.delete_source",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IngestApi#delete_source\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Source
    # Fetch a source file details and status by its id.  **Base URL:** <a href=\"#\">https://api.shotstack.io/ingest/{version}</a> 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [SourceResponse]
    def get_source(id, opts = {})
      data, _status_code, _headers = get_source_with_http_info(id, opts)
      data
    end

    # Get Source
    # Fetch a source file details and status by its id.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/ingest/{version}&lt;/a&gt; 
    # @param id [String] The id of the source file in [KSUID](https://github.com/segmentio/ksuid#what-is-a-ksuid) format.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SourceResponse, Integer, Hash)>] SourceResponse data, response status code and response headers
    def get_source_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IngestApi.get_source ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling IngestApi.get_source"
      end
      pattern = Regexp.new(/^[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12}$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling IngestApi.get_source, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/sources/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'SourceResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"IngestApi.get_source",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IngestApi#get_source\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Sources
    # Retrieve a list of ingested source files stored against a users account and stage.  **Base URL:** <a href=\"#\">https://api.shotstack.io/ingest/{version}</a> 
    # @param [Hash] opts the optional parameters
    # @return [SourceListResponse]
    def get_sources(opts = {})
      data, _status_code, _headers = get_sources_with_http_info(opts)
      data
    end

    # List Sources
    # Retrieve a list of ingested source files stored against a users account and stage.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/ingest/{version}&lt;/a&gt; 
    # @param [Hash] opts the optional parameters
    # @return [Array<(SourceListResponse, Integer, Hash)>] SourceListResponse data, response status code and response headers
    def get_sources_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IngestApi.get_sources ...'
      end
      # resource path
      local_var_path = '/sources'

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
      return_type = opts[:debug_return_type] || 'SourceListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"IngestApi.get_sources",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IngestApi#get_sources\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Direct Upload
    # Request a signed URL to upload a file to. The response returns a signed URL that you use to upload the file to. The signed URL looks similar to:  https://shotstack-ingest-api-stage-sources.s3.ap-southeast-2.amazonaws.com/5ca6hu7s9k/zzytey4v-32km-kq1z-aftr-3kcuqi0brad2/source?AWSAccessKeyId=ASIAWJV7UWDMGTZLHTXP&Expires=1677209777&Signature=PKR4dGDDdOuMTAQmDASzLGmLOeo%3D&x-amz-acl=public-read&x-amz-security-token=IQoJb3JpZ2luX2VjEGMaDmFwLX......56osBGByztm7WZdbmXzO09KR  In a separate API call, use this signed URL to send a PUT request with the binary file. Using  cURL you can use a command like:      `curl -X PUT -T video.mp4 {data.attributes.url}`      Where **video.mp4** is the file you want to upload and **{data.attributes.url}** is the signed URL returned in the response. The request must be a PUT type.  The SDK does not currently support the PUT request. You can use the SDK to make the request for the signed URL and then use cURL to make the PUT request.  **Base URL:** <a href=\"#\">https://api.shotstack.io/ingest/{version}</a> 
    # @param [Hash] opts the optional parameters
    # @return [UploadResponse]
    def get_upload_signed_url(opts = {})
      data, _status_code, _headers = get_upload_signed_url_with_http_info(opts)
      data
    end

    # Direct Upload
    # Request a signed URL to upload a file to. The response returns a signed URL that you use to upload the file to. The signed URL looks similar to:  https://shotstack-ingest-api-stage-sources.s3.ap-southeast-2.amazonaws.com/5ca6hu7s9k/zzytey4v-32km-kq1z-aftr-3kcuqi0brad2/source?AWSAccessKeyId&#x3D;ASIAWJV7UWDMGTZLHTXP&amp;Expires&#x3D;1677209777&amp;Signature&#x3D;PKR4dGDDdOuMTAQmDASzLGmLOeo%3D&amp;x-amz-acl&#x3D;public-read&amp;x-amz-security-token&#x3D;IQoJb3JpZ2luX2VjEGMaDmFwLX......56osBGByztm7WZdbmXzO09KR  In a separate API call, use this signed URL to send a PUT request with the binary file. Using  cURL you can use a command like:      &#x60;curl -X PUT -T video.mp4 {data.attributes.url}&#x60;      Where **video.mp4** is the file you want to upload and **{data.attributes.url}** is the signed URL returned in the response. The request must be a PUT type.  The SDK does not currently support the PUT request. You can use the SDK to make the request for the signed URL and then use cURL to make the PUT request.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/ingest/{version}&lt;/a&gt; 
    # @param [Hash] opts the optional parameters
    # @return [Array<(UploadResponse, Integer, Hash)>] UploadResponse data, response status code and response headers
    def get_upload_signed_url_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IngestApi.get_upload_signed_url ...'
      end
      # resource path
      local_var_path = '/upload'

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
      return_type = opts[:debug_return_type] || 'UploadResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"IngestApi.get_upload_signed_url",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IngestApi#get_upload_signed_url\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Fetch Source
    # Queue a source file to be fetched from a URL and stored by Shotstack. Source files can be videos, images, audio files and fonts. Once ingested, new [output renditions](#tocs_outputs) can be created from the source file.  **Base URL:** <a href=\"#\">https://api.shotstack.io/ingest/{version}</a> 
    # @param source [Source] Ingest a video, image, audio or font file from the provided URL. Optionally provide a list of output renditions.
    # @param [Hash] opts the optional parameters
    # @return [QueuedSourceResponse]
    def post_source(source, opts = {})
      data, _status_code, _headers = post_source_with_http_info(source, opts)
      data
    end

    # Fetch Source
    # Queue a source file to be fetched from a URL and stored by Shotstack. Source files can be videos, images, audio files and fonts. Once ingested, new [output renditions](#tocs_outputs) can be created from the source file.  **Base URL:** &lt;a href&#x3D;\&quot;#\&quot;&gt;https://api.shotstack.io/ingest/{version}&lt;/a&gt; 
    # @param source [Source] Ingest a video, image, audio or font file from the provided URL. Optionally provide a list of output renditions.
    # @param [Hash] opts the optional parameters
    # @return [Array<(QueuedSourceResponse, Integer, Hash)>] QueuedSourceResponse data, response status code and response headers
    def post_source_with_http_info(source, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: IngestApi.post_source ...'
      end
      # verify the required parameter 'source' is set
      if @api_client.config.client_side_validation && source.nil?
        fail ArgumentError, "Missing the required parameter 'source' when calling IngestApi.post_source"
      end
      # resource path
      local_var_path = '/sources'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(source)

      # return_type
      return_type = opts[:debug_return_type] || 'QueuedSourceResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['DeveloperKey']

      new_options = opts.merge(
        :operation => :"IngestApi.post_source",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: IngestApi#post_source\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
