# frozen_string_literal: true

require 'securerandom'

FactoryBot.define do
  factory :visit do
    guid { SecureRandom.uuid }
    url { '/home' }
    timestamp { Time.now.to_i }
  end
end
