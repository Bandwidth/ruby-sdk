# bandwidth
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Bandwidth
  # ConferenceMemberDetail Model.
  class ConferenceMemberDetail < BaseModel
    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :call_id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :conference_id

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :member_url

    # TODO: Write general description for this method
    # @return [Boolean]
    attr_accessor :mute

    # TODO: Write general description for this method
    # @return [Boolean]
    attr_accessor :hold

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :call_ids_to_coach

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['call_id'] = 'callId'
      @_hash['conference_id'] = 'conferenceId'
      @_hash['member_url'] = 'memberUrl'
      @_hash['mute'] = 'mute'
      @_hash['hold'] = 'hold'
      @_hash['call_ids_to_coach'] = 'callIdsToCoach'
      @_hash
    end

    def initialize(call_id = nil,
                   conference_id = nil,
                   member_url = nil,
                   mute = nil,
                   hold = nil,
                   call_ids_to_coach = nil)
      @call_id = call_id
      @conference_id = conference_id
      @member_url = member_url
      @mute = mute
      @hold = hold
      @call_ids_to_coach = call_ids_to_coach
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      call_id = hash['callId']
      conference_id = hash['conferenceId']
      member_url = hash['memberUrl']
      mute = hash['mute']
      hold = hash['hold']
      call_ids_to_coach = hash['callIdsToCoach']

      # Create object from extracted values.
      ConferenceMemberDetail.new(call_id,
                                 conference_id,
                                 member_url,
                                 mute,
                                 hold,
                                 call_ids_to_coach)
    end
  end
end