class User < ApplicationRecord
  has_many :event_members
  has_many :events, through: :event_members

  def to_icon
    {
      profile_image: image_url,
      name: name
    }
  end
end