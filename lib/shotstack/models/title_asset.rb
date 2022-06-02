=begin
#Shotstack

#Shotstack is a video, image and audio editing service that allows for the automated generation of videos, images and audio using JSON and a RESTful API.  You arrange and configure an edit and POST it to the API which will render your media and provide a file  location when complete.  For more details visit [shotstack.io](https://shotstack.io) or checkout our [getting started](https://shotstack.io/docs/guide/) documentation. There are two main API's, one for editing and generating assets (Edit API) and one for managing hosted assets (Serve API).  The Edit API base URL is: <b>https://api.shotstack.io/{version}</b>  The Serve API base URL is: <b>https://api.shotstack.io/serve/{version}</b>

The version of the OpenAPI document: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.4.0

=end

require 'date'
require 'time'

module Shotstack
  # The TitleAsset clip type lets you create video titles from a text string and apply styling and positioning.
  class TitleAsset
    # The type of asset - set to `title` for titles.
    attr_accessor :type

    # The title text string - i.e. \"My Title\".
    attr_accessor :text

    # Uses a preset to apply font properties and styling to the title. <ul>   <li>`minimal`</li>   <li>`blockbuster`</li>   <li>`vogue`</li>   <li>`sketchy`</li>   <li>`skinny`</li>   <li>`chunk`</li>   <li>`chunkLight`</li>   <li>`marker`</li>   <li>`future`</li>   <li>`subtitle`</li> </ul>
    attr_accessor :style

    # Set the text color using hexadecimal color notation. Transparency is supported by setting the first two characters of the hex string (opposite to HTML),  i.e. #80ffffff will be white with  50% transparency.
    attr_accessor :color

    # Set the relative size of the text using predefined sizes from xx-small to xx-large. <ul>   <li>`xx-small`</li>   <li>`x-small`</li>   <li>`small`</li>   <li>`medium`</li>   <li>`large`</li>   <li>`x-large`</li>   <li>`xx-large`</li> </ul>
    attr_accessor :size

    # Apply a background color behind the text. Set the text color using hexadecimal color notation. Transparency is supported by setting the first two characters of the hex string (opposite to HTML),  i.e. #80ffffff will be white with 50% transparency. Omit to use transparent background.
    attr_accessor :background

    # Place the title in one of nine predefined positions of the viewport. <ul>   <li>`top` - top (center)</li>   <li>`topRight` - top right</li>   <li>`right` - right (center)</li>   <li>`bottomRight` - bottom right</li>   <li>`bottom` - bottom (center)</li>   <li>`bottomLeft` - bottom left</li>   <li>`left` - left (center)</li>   <li>`topLeft` - top left</li>   <li>`center` - center</li> </ul>
    attr_accessor :position

    attr_accessor :offset

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
        :'type' => :'type',
        :'text' => :'text',
        :'style' => :'style',
        :'color' => :'color',
        :'size' => :'size',
        :'background' => :'background',
        :'position' => :'position',
        :'offset' => :'offset'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'type' => :'String',
        :'text' => :'String',
        :'style' => :'String',
        :'color' => :'String',
        :'size' => :'String',
        :'background' => :'String',
        :'position' => :'String',
        :'offset' => :'Offset'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Shotstack::TitleAsset` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Shotstack::TitleAsset`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      else
        self.type = 'title'
      end

      if attributes.key?(:'text')
        self.text = attributes[:'text']
      end

      if attributes.key?(:'style')
        self.style = attributes[:'style']
      end

      if attributes.key?(:'color')
        self.color = attributes[:'color']
      else
        self.color = '#ffffff'
      end

      if attributes.key?(:'size')
        self.size = attributes[:'size']
      else
        self.size = 'medium'
      end

      if attributes.key?(:'background')
        self.background = attributes[:'background']
      end

      if attributes.key?(:'position')
        self.position = attributes[:'position']
      else
        self.position = 'center'
      end

      if attributes.key?(:'offset')
        self.offset = attributes[:'offset']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @text.nil?
        invalid_properties.push('invalid value for "text", text cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @type.nil?
      return false if @text.nil?
      style_validator = EnumAttributeValidator.new('String', ["minimal", "blockbuster", "vogue", "sketchy", "skinny", "chunk", "chunkLight", "marker", "future", "subtitle"])
      return false unless style_validator.valid?(@style)
      size_validator = EnumAttributeValidator.new('String', ["xx-small", "x-small", "small", "medium", "large", "x-large", "xx-large"])
      return false unless size_validator.valid?(@size)
      position_validator = EnumAttributeValidator.new('String', ["top", "topRight", "right", "bottomRight", "bottom", "bottomLeft", "left", "topLeft", "center"])
      return false unless position_validator.valid?(@position)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] style Object to be assigned
    def style=(style)
      validator = EnumAttributeValidator.new('String', ["minimal", "blockbuster", "vogue", "sketchy", "skinny", "chunk", "chunkLight", "marker", "future", "subtitle"])
      unless validator.valid?(style)
        fail ArgumentError, "invalid value for \"style\", must be one of #{validator.allowable_values}."
      end
      @style = style
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] size Object to be assigned
    def size=(size)
      validator = EnumAttributeValidator.new('String', ["xx-small", "x-small", "small", "medium", "large", "x-large", "xx-large"])
      unless validator.valid?(size)
        fail ArgumentError, "invalid value for \"size\", must be one of #{validator.allowable_values}."
      end
      @size = size
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] position Object to be assigned
    def position=(position)
      validator = EnumAttributeValidator.new('String', ["top", "topRight", "right", "bottomRight", "bottom", "bottomLeft", "left", "topLeft", "center"])
      unless validator.valid?(position)
        fail ArgumentError, "invalid value for \"position\", must be one of #{validator.allowable_values}."
      end
      @position = position
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          type == o.type &&
          text == o.text &&
          style == o.style &&
          color == o.color &&
          size == o.size &&
          background == o.background &&
          position == o.position &&
          offset == o.offset
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [type, text, style, color, size, background, position, offset].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
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
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
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
