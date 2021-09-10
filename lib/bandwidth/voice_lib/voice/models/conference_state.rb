# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

require 'date'
module Bandwidth
  # ConferenceState Model.
  class ConferenceState < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :name

    # TODO: Write general description for this method
    # @return [DateTime]
    attr_accessor :created_time

    # TODO: Write general description for this method
    # @return [DateTime]
    attr_accessor :completed_time

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :conference_event_url

    # TODO: Write general description for this method
    # @return [ConferenceEventMethodEnum]
    attr_accessor :conference_event_method

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :tag

    # TODO: Write general description for this method
    # @return [List of ConferenceMemberState]
    attr_accessor :active_members

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['id'] = 'id'
      @_hash['name'] = 'name'
      @_hash['created_time'] = 'createdTime'
      @_hash['completed_time'] = 'completedTime'
      @_hash['conference_event_url'] = 'conferenceEventUrl'
      @_hash['conference_event_method'] = 'conferenceEventMethod'
      @_hash['tag'] = 'tag'
      @_hash['active_members'] = 'activeMembers'
      @_hash
    end

    # An array for optional fields
    def optionals
      %w[
        id
        name
        created_time
        completed_time
        conference_event_url
        conference_event_method
        tag
        active_members
      ]
    end

    # An array for nullable fields
    def nullables
      %w[
        completed_time
        conference_event_url
        conference_event_method
        tag
      ]
    end

    def initialize(id = nil,
                   name = nil,
                   created_time = nil,
                   completed_time = nil,
                   conference_event_url = nil,
                   conference_event_method = nil,
                   tag = nil,
                   active_members = nil)
      @id = id unless id == SKIP
      @name = name unless name == SKIP
      @created_time = created_time unless created_time == SKIP
      @completed_time = completed_time unless completed_time == SKIP
      @conference_event_url = conference_event_url unless conference_event_url == SKIP
      @conference_event_method = conference_event_method unless conference_event_method == SKIP
      @tag = tag unless tag == SKIP
      @active_members = active_members unless active_members == SKIP
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      id = hash.key?('id') ? hash['id'] : SKIP
      name = hash.key?('name') ? hash['name'] : SKIP
      created_time = if hash.key?('createdTime')
                       (DateTimeHelper.from_rfc3339(hash['createdTime']) if hash['createdTime'])
                     else
                       SKIP
                     end
      completed_time = if hash.key?('completedTime')
                         (DateTimeHelper.from_rfc3339(hash['completedTime']) if hash['completedTime'])
                       else
                         SKIP
                       end
      conference_event_url =
        hash.key?('conferenceEventUrl') ? hash['conferenceEventUrl'] : SKIP
      conference_event_method =
        hash.key?('conferenceEventMethod') ? hash['conferenceEventMethod'] : SKIP
      tag = hash.key?('tag') ? hash['tag'] : SKIP
      # Parameter is an array, so we need to iterate through it
      active_members = nil
      unless hash['activeMembers'].nil?
        active_members = []
        hash['activeMembers'].each do |structure|
          active_members << (ConferenceMemberState.from_hash(structure) if structure)
        end
      end

      active_members = SKIP unless hash.key?('activeMembers')

      # Create object from extracted values.
      ConferenceState.new(id,
                          name,
                          created_time,
                          completed_time,
                          conference_event_url,
                          conference_event_method,
                          tag,
                          active_members)
    end

    def to_created_time
      DateTimeHelper.to_rfc3339(created_time)
    end

    def to_completed_time
      DateTimeHelper.to_rfc3339(completed_time)
    end
  end
end
