class Event < ApplicationRecord
  has_many :event_members
  has_many :users, through: :event_members

  def add_members(members:)
    members.each do |member|
      EventMember.create(user_id: member.id, event_id: id)
    end
  end
end