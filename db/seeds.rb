require "faker"

ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
Booking.delete_all
Property.delete_all
Island.delete_all
User.delete_all

users = []
islands = []
properties = []

[
  {
    first_name: "James",
    last_name: "Blake",
    email: "james@hawaii.com",
    role: "owner"
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
  user = User.create(password: "secret", role: "agent", **user_obj)
  filename = user_obj[:first_name].downcase
  # user.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/agents/#{filename}.jpg"), filename: "#{filename}.jpg")
  users.push user
end
puts ["Created users->"].inspect

["kauai", "oahu", "maui", "big_island"].each do |island_name|
  island = Island.create name: island_name.humanize
  # island.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/islands/#{island_name}.jpg"), filename: "#{island_name}.jpg")
  islands.push island
end
puts ["Created islands->"].inspect

coordinates = [
  [21.997466, -159.342403],
  [22.228974, -159.403494],
  [21.965557, -159.705923],
  [21.542427, -157.843386],
  [21.579155, -158.184845],
  [21.180386, -156.949756],
  [20.652122, -156.093849],
  [19.407567, -154.928544]
]

["vacay", "overlook", "hidden_gem", "family_home", "dreamy", "cottage", "church", "camp"].each_with_index do |property_name, index|
  property = Property.create! name: property_name.humanize, user: users.sample, island: islands.sample, address: "#{property_name} #{["street", "beach", "cove"].sample}", coordinates: coordinates[index].join(',')
  # property.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/properties/#{property_name}.jpg"), filename: "#{property_name}.jpg")
  # 5.times do |index|
  #   property.photos.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/property_photos/#{property_name}_#{index+1}.jpg"), filename: "#{property_name}_#{index+1}.jpg")
  # end
  properties.push property
end
puts ["Created locations->"].inspect
