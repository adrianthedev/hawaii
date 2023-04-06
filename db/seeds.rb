require "faker"

ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
Booking.delete_all
Property.delete_all
Area.delete_all
User.delete_all

users = []
areas = []
properties = []

[
  {
    first_name: "James",
    last_name: "Blake",
    email: "james@hawaii.com",
    roles: {owner: true, agent: true}
  },
  {
    first_name: "Pedro",
    last_name: "Oliver",
    email: "pedro@hawaii.com"
  },
  {
    first_name: "Beatrice",
    last_name: "Campbell",
    email: "beatrice@hawaii.com"
  },
  {
    first_name: "Ryan",
    last_name: "Clark",
    email: "ryan@hawaii.com"
  }
].reverse_each do |user_obj|
  user = User.create(password: "secret", roles: {owner: false, agent: true}, **user_obj)
  filename = user_obj[:first_name].downcase
  puts ["filename->", filename].inspect
  user.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/agents/#{filename}.jpg"), filename: "#{filename}.jpg")
  users.push user
end

["kauai", "oahu", "maui", "big_island"].each do |island_name|
  area = Area.create name: island_name.humanize
  area.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/islands/#{island_name}.jpg"), filename: "#{island_name}.jpg")
  areas.push area
end

["vacay", "overlook", "hidden_gem", "family_home", "dreamy", "cottage", "church", "camp"].each do |property_name|
  property = Property.create! name: property_name.humanize, agent: users.sample, area: areas.sample, address: "#{property_name} #{["street", "beach", "cove"].sample}"
  property.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/properties/#{property_name}.jpg"), filename: "#{property_name}.jpg")
  5.times do |index|
    property.photos.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/property_photos/#{property_name}_#{index+1}.jpg"), filename: "#{property_name}_#{index+1}.jpg")
  end
  properties.push property
end
