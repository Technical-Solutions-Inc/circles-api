class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :start_date, :end_date, :users

  has_many :event_members
  has_many :users, through: :event_members
end
