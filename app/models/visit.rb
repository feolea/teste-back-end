# frozen_string_literal: true

class Visit
  include Mongoid::Document
  field :guid, type: String
  field :timestamp, type: Integer
  field :url, type: String

  validates :guid, :timestamp, :url, presence: true

  index(timestamp: -1)
  index({ timestamp: -1, guid: 1 }, unique: true)
end
