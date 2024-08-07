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
  # A rendition is a new output file that is generated from the source. The rendition can be encoded to a different format and have transformations applied to it such as resizing, cropping, etc...
  class Rendition
    # The output format to encode the file to. You can only encode a file to the same type, i.e. a video to a video or an image to an image. You can't encode a video as an image. The following formats are available: <ul>   <li>`mp4` - mp4 video file (video only)</li>   <li>`webm` - webm video file (video only)</li>   <li>`mov` - mov video file (video only)</li>   <li>`avi` - avi video file (video only)</li>   <li>`mkv` - mkv video file (video only)</li>   <li>`ogv` - ogv video file (video only)</li>   <li>`wmv` - wmv video file (video only)</li>   <li>`avif` - avif video file (video only)</li>   <li>`gif` - animated gif file (video only)</li>   <li>`jpg` - jpg image file (image only)</li>   <li>`png` - png image file (image only)</li>   <li>`webp` - webp image file (image only)</li>   <li>`tif` - tif image file (image only)</li>   <li>`mp3` - mp3 audio file (audio only)</li>   <li>`wav` - wav audio file (audio only)</li> </ul>
    attr_accessor :format

    attr_accessor :size

    # Set how the rendition should be scaled and cropped when using a size with an aspect ratio that is different from the source. Fit applies to both videos and images. <ul>   <li>`crop` <b>(default)</b> - scale the rendition to fill the output area while maintaining the aspect ratio. The rendition will be cropped if it exceeds the bounds of the output.</li>   <li>`cover` - stretch the rendition to fill the output without maintaining the aspect ratio.</li>   <li>`contain` - fit the entire rendition within the output while maintaining the original aspect ratio.</li> </ul>
    attr_accessor :fit

    # The preset output resolution of the video or image. This is a convenience property that sets the width and height based on industry standard resolutions. The following resolutions are available: <ul>   <li>`preview` - 512px x 288px</li>   <li>`mobile` - 640px x 360px</li>   <li>`sd` - 1024px x 576px</li>   <li>`hd` - 1280px x 720px</li>   <li>`fhd` - 1920px x 1080px</li> </ul>
    attr_accessor :resolution

    # Adjust the visual quality of the video or image. The higher the value, the sharper the image quality but the larger file size and slower the encoding process. When specifying quality, the goal is to balance file size vs visual quality. Quality is a value between 1 and 100 where 1 is fully compressed with low image quality and 100 is close to lossless with high image quality and large file size. Sane values are between 50 and 75. Omitting the quality parameter will result in an asset optimised for encoding speed, file size and visual quality.
    attr_accessor :quality

    # Change the frame rate of a video asset. <ul>   <li>`12` - 12fps</li>   <li>`15` - 15fps</li>   <li>`24` - 24fps</li>   <li>`23.976` - 23.976fps</li>   <li>`25` (default) - 25fps</li>   <li>`29.97` - 29.97fps</li>   <li>`30` - 30fps</li>   <li>`48` - 48fps</li>   <li>`50` - 50fps</li>   <li>`59.94` - 59.94fps</li>   <li>`60` - 60fps</li> </ul>
    attr_accessor :fps

    attr_accessor :speed

    # The keyframe interval is useful to optimize playback, seeking and smoother scrubbing in browsers. The value sets the number of frames between a keyframe. The lower the number, the larger the file. Try a value between 10 and 25 for smooth scrubbing.
    attr_accessor :keyframe_interval

    attr_accessor :enhance

    # A custom name for the generated rendition file. The file extension will be automatically added based on the format of the rendition. If no filename is provided, the rendition ID will be used.
    attr_accessor :filename

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
        :'format' => :'format',
        :'size' => :'size',
        :'fit' => :'fit',
        :'resolution' => :'resolution',
        :'quality' => :'quality',
        :'fps' => :'fps',
        :'speed' => :'speed',
        :'keyframe_interval' => :'keyframeInterval',
        :'enhance' => :'enhance',
        :'filename' => :'filename'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'format' => :'String',
        :'size' => :'Size',
        :'fit' => :'String',
        :'resolution' => :'String',
        :'quality' => :'Integer',
        :'fps' => :'Float',
        :'speed' => :'Speed',
        :'keyframe_interval' => :'Integer',
        :'enhance' => :'Enhancements',
        :'filename' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Shotstack::Rendition` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Shotstack::Rendition`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'format')
        self.format = attributes[:'format']
      end

      if attributes.key?(:'size')
        self.size = attributes[:'size']
      end

      if attributes.key?(:'fit')
        self.fit = attributes[:'fit']
      end

      if attributes.key?(:'resolution')
        self.resolution = attributes[:'resolution']
      end

      if attributes.key?(:'quality')
        self.quality = attributes[:'quality']
      end

      if attributes.key?(:'fps')
        self.fps = attributes[:'fps']
      end

      if attributes.key?(:'speed')
        self.speed = attributes[:'speed']
      end

      if attributes.key?(:'keyframe_interval')
        self.keyframe_interval = attributes[:'keyframe_interval']
      end

      if attributes.key?(:'enhance')
        self.enhance = attributes[:'enhance']
      end

      if attributes.key?(:'filename')
        self.filename = attributes[:'filename']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@quality.nil? && @quality > 100
        invalid_properties.push('invalid value for "quality", must be smaller than or equal to 100.')
      end

      if !@quality.nil? && @quality < 1
        invalid_properties.push('invalid value for "quality", must be greater than or equal to 1.')
      end

      if !@keyframe_interval.nil? && @keyframe_interval > 300
        invalid_properties.push('invalid value for "keyframe_interval", must be smaller than or equal to 300.')
      end

      if !@keyframe_interval.nil? && @keyframe_interval < 1
        invalid_properties.push('invalid value for "keyframe_interval", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      format_validator = EnumAttributeValidator.new('String', ["mp4", "webm", "mov", "avi", "mkv", "ogv", "wmv", "avif", "gif", "mp3", "wav", "jpg", "png", "webp", "tif"])
      return false unless format_validator.valid?(@format)
      fit_validator = EnumAttributeValidator.new('String', ["cover", "contain", "crop"])
      return false unless fit_validator.valid?(@fit)
      resolution_validator = EnumAttributeValidator.new('String', ["preview", "mobile", "sd", "hd", "fhd"])
      return false unless resolution_validator.valid?(@resolution)
      return false if !@quality.nil? && @quality > 100
      return false if !@quality.nil? && @quality < 1
      fps_validator = EnumAttributeValidator.new('Float', [12, 15, 23.976, 24, 25, 29.97, 30, 48, 50, 59.94, 60])
      return false unless fps_validator.valid?(@fps)
      return false if !@keyframe_interval.nil? && @keyframe_interval > 300
      return false if !@keyframe_interval.nil? && @keyframe_interval < 1
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] format Object to be assigned
    def format=(format)
      validator = EnumAttributeValidator.new('String', ["mp4", "webm", "mov", "avi", "mkv", "ogv", "wmv", "avif", "gif", "mp3", "wav", "jpg", "png", "webp", "tif"])
      unless validator.valid?(format)
        fail ArgumentError, "invalid value for \"format\", must be one of #{validator.allowable_values}."
      end
      @format = format
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] fit Object to be assigned
    def fit=(fit)
      validator = EnumAttributeValidator.new('String', ["cover", "contain", "crop"])
      unless validator.valid?(fit)
        fail ArgumentError, "invalid value for \"fit\", must be one of #{validator.allowable_values}."
      end
      @fit = fit
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resolution Object to be assigned
    def resolution=(resolution)
      validator = EnumAttributeValidator.new('String', ["preview", "mobile", "sd", "hd", "fhd"])
      unless validator.valid?(resolution)
        fail ArgumentError, "invalid value for \"resolution\", must be one of #{validator.allowable_values}."
      end
      @resolution = resolution
    end

    # Custom attribute writer method with validation
    # @param [Object] quality Value to be assigned
    def quality=(quality)
      if quality.nil?
        fail ArgumentError, 'quality cannot be nil'
      end

      if quality > 100
        fail ArgumentError, 'invalid value for "quality", must be smaller than or equal to 100.'
      end

      if quality < 1
        fail ArgumentError, 'invalid value for "quality", must be greater than or equal to 1.'
      end

      @quality = quality
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] fps Object to be assigned
    def fps=(fps)
      validator = EnumAttributeValidator.new('Float', [12, 15, 23.976, 24, 25, 29.97, 30, 48, 50, 59.94, 60])
      unless validator.valid?(fps)
        fail ArgumentError, "invalid value for \"fps\", must be one of #{validator.allowable_values}."
      end
      @fps = fps
    end

    # Custom attribute writer method with validation
    # @param [Object] keyframe_interval Value to be assigned
    def keyframe_interval=(keyframe_interval)
      if keyframe_interval.nil?
        fail ArgumentError, 'keyframe_interval cannot be nil'
      end

      if keyframe_interval > 300
        fail ArgumentError, 'invalid value for "keyframe_interval", must be smaller than or equal to 300.'
      end

      if keyframe_interval < 1
        fail ArgumentError, 'invalid value for "keyframe_interval", must be greater than or equal to 1.'
      end

      @keyframe_interval = keyframe_interval
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          format == o.format &&
          size == o.size &&
          fit == o.fit &&
          resolution == o.resolution &&
          quality == o.quality &&
          fps == o.fps &&
          speed == o.speed &&
          keyframe_interval == o.keyframe_interval &&
          enhance == o.enhance &&
          filename == o.filename
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [format, size, fit, resolution, quality, fps, speed, keyframe_interval, enhance, filename].hash
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
