FactoryBot.define do
  factory :message do
    sequence(:content) { |i| "message#{i}" }
    room_id 100
  end
end
