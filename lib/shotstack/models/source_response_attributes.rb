=begin
#Shotstack

# Official Ruby SDK for the Shotstack Cloud Video Editing API

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
Generator version: 7.4.0

=end

require 'date'
require 'time'

module Shotstack
  # The id and attributes of the source file.
  class SourceResponseAttributes
    # The source id.
    attr_accessor :id

    # The owner id of the source file.
    attr_accessor :owner

    # The original URL of an ingested source file, where it originated. Only displayed for files ingested using the [fetch source](#fetch-source) endpoint. Not displayed for direct uploads.
    attr_accessor :input

    # The URL of the source file hosted by Shotstack. The file at the URL can be used by the Edit API. Source file URL's consist of a base URL (AWS bucket), owner id, source id and a file named source. The extension varies depending on the type of file ingested.
    attr_accessor :source

    # The status of the source file ingestion task. <ul>   <li>`queued` - ingestion task is queued waiting to be fetched</li>   <li>`importing` - the source file is being downloaded</li>   <li>`ready` - the source file has been ingested and stored</li>   <li>`failed` - there was an error ingesting the source file</li>   <li>`deleted` - the source file has been deleted</li> </ul>
    attr_accessor :status

    attr_accessor :outputs

    # The width in pixels of the ingested source file, if a video or image.
    attr_accessor :width

    # The height in pixels of the ingested source file, if a video or image.
    attr_accessor :height

    # The duration in seconds of the ingested source file, if a video or audio file.
    attr_accessor :duration

    # The frame rate in frames per second of the source file, if a video file.
    attr_accessor :fps

    # The time the ingestion task was initially queued.
    attr_accessor :created

    # The time the ingestion status was last updated.
    attr_accessor :updated

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'owner' => :'owner',
        :'input' => :'input',
        :'source' => :'source',
        :'status' => :'status',
        :'outputs' => :'outputs',
        :'width' => :'width',
        :'height' => :'height',
        :'duration' => :'duration',
        :'fps' => :'fps',
        :'created' => :'created',
        :'updated' => :'updated'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'owner' => :'String',
        :'input' => :'String',
        :'source' => :'String',
        :'status' => :'String',
        :'outputs' => :'OutputsResponse',
        :'width' => :'Integer',
        :'height' => :'String',
        :'duration' => :'Float',
        :'fps' => :'Float',
        :'created' => :'String',
        :'updated' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Shotstack::SourceResponseAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Shotstack::SourceResponseAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'owner')
        self.owner = attributes[:'owner']
      else
        self.owner = nil
      end

      if attributes.key?(:'input')
        self.input = attributes[:'input']
      end

      if attributes.key?(:'source')
        self.source = attributes[:'source']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'outputs')
        self.outputs = attributes[:'outputs']
      end

      if attributes.key?(:'width')
        self.width = attributes[:'width']
      end

      if attributes.key?(:'height')
        self.height = attributes[:'height']
      end

      if attributes.key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.key?(:'fps')
        self.fps = attributes[:'fps']
      end

      if attributes.key?(:'created')
        self.created = attributes[:'created']
      end

      if attributes.key?(:'updated')
        self.updated = attributes[:'updated']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @owner.nil?
        invalid_properties.push('invalid value for "owner", owner cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id.nil?
      return false if @owner.nil?
      status_validator = EnumAttributeValidator.new('String', ["queued", "importing", "ready", "failed", "deleted", "overwritten"])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["queued", "importing", "ready", "failed", "deleted", "overwritten"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          owner == o.owner &&
          input == o.input &&
          source == o.source &&
          status == o.status &&
          outputs == o.outputs &&
          width == o.width &&
          height == o.height &&
          duration == o.duration &&
          fps == o.fps &&
          created == o.created &&
          updated == o.updated
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, owner, input, source, status, outputs, width, height, duration, fps, created, updated].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Shotstack.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
