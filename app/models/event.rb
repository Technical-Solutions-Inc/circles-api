class Event < ApplicationRecord
  has_many :event_members
  has_many :users, through: :event_members

  def to_icon(event_number:)
    {
      id: id,
      event_number: event_number,
      start_date: start_date,
      end_date: end_date,
      image_url: image_url,
      name: name,
      members: users.map(&:to_icon)
    }
  end

  def add_members(members:)
    members.each do |member|
      EventMember.create(user_id: member.id, event_id: id)
    end
  end
end