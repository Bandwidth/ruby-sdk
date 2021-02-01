# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # Media Model.
  class Media < BaseModel
    # TODO: Write general description for this method
    # @return [Object]
    attr_accessor :input_stream

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :content

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :url

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :content_length

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :content_type

    # TODO: Write general description for this method
    # @return [List of Tag]
    attr_accessor :tags

    # User's account ID
    # @return [String]
    attr_accessor :user_id

    # User's account ID
    # @return [String]
    attr_accessor :media_name

    # User's account ID
    # @return [String]
    attr_accessor :media_id

    # User's account ID
    # @return [String]
    attr_accessor :cache_control

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['input_stream'] = 'inputStream'
      @_hash['content'] = 'content'
      @_hash['url'] = 'url'
      @_hash['content_length'] = 'contentLength'
      @_hash['content_type'] = 'contentType'
      @_hash['tags'] = 'tags'
      @_hash['user_id'] = 'userId'
      @_hash['media_name'] = 'mediaName'
      @_hash['media_id'] = 'mediaId'
      @_hash['cache_control'] = 'cacheControl'
      @_hash
    end

    def initialize(input_stream = nil,
                   content = nil,
                   url = nil,
                   content_length = nil,
                   content_type = nil,
                   tags = nil,
                   user_id = nil,
                   media_name = nil,
                   media_id = nil,
                   cache_control = nil)
      @input_stream = input_stream
      @content = content
      @url = url
      @content_length = content_length
      @content_type = content_type
      @tags = tags
      @user_id = user_id
      @media_name = media_name
      @media_id = media_id
      @cache_control = cache_control
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      input_stream = hash['inputStream']
      content = hash['content']
      url = hash['url']
      content_length = hash['contentLength']
      content_type = hash['contentType']
      # Parameter is an array, so we need to iterate through it
      tags = nil
      unless hash['tags'].nil?
        tags = []
        hash['tags'].each do |structure|
          tags << (Tag.from_hash(structure) if structure)
        end
      end
      user_id = hash['userId']
      media_name = hash['mediaName']
      media_id = hash['mediaId']
      cache_control = hash['cacheControl']

      # Create object from extracted values.
      Media.new(input_stream,
                content,
                url,
                content_length,
                content_type,
                tags,
                user_id,
                media_name,
                media_id,
                cache_control)
    end
  end
end
