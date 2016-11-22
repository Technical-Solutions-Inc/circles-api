json.events events do |event|
  json.id event.id
  json.name event.name
  json.startDate event.start_date
  json.endDate event.end_date
  json.imageUrl event.image_url

  json.members event.users do |user|
    json.id user.id
    json.name user.name
    json.imageUrl user.image_url
  end
end