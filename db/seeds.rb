require 'faker'

User.delete_all

users = []
agents = []
areas = []
properties = []

famous_users = [
  {
    first_name: 'David Heinemeier',
    last_name: 'Hansson',
    email: 'david@hey.com'
  },
  {
    first_name: 'Chris',
    last_name: 'Oliver',
    email: 'chris@gorails.com'
  },
  {
    first_name: 'Jason',
    last_name: 'Charnes',
    email: 'jason@jasoncharnes.com'
  },
  {
    first_name: 'Jason',
    last_name: 'Swett',
    email: 'jason@benfranklinlabs.com'
  },
  {
    first_name: 'Yukihiro "Matz"',
    last_name: 'Matsumoto',
    email: 'matz@ruby.or.jp'
  },
  {
    first_name: 'Joe',
    last_name: 'Masilotti',
    email: 'joe@masilotti.com'
  },
  {
    first_name: 'Lucian',
    last_name: 'Ghinda',
    email: 'lucian@ghinda.com'
  },
  {
    first_name: 'Mike',
    last_name: 'Perham',
    email: 'mperham@gmail.com'
  },
  {
    first_name: 'Taylor',
    last_name: 'Otwell',
    email: 'taylor@laravel.com'
  },
  {
    first_name: 'Adam',
    last_name: 'Watham',
    email: 'adam@adamwathan.me'
  },
  {
    first_name: 'Jeffery',
    last_name: 'Way',
    email: 'jeffrey@laracasts.com'
  },
  {
    first_name: 'Adrian',
    last_name: 'Marin',
    email: 'adrian@adrianthedev.com',
    password: "secret"
  },
]

famous_users.reverse.each do |user|
  users.push(FactoryBot.create(:user, **user))
end

["ryan", "pedro", "james", "beatrice"].each do |agent_name|
  agent = Agent.create name: agent_name
  agent.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/agents/#{agent_name}.jpg"), filename: "#{agent_name}.jpg")
  agents.push agent
end

["kauai", "oahu", "maui", "big_island"].each do |island_name|
  area = Area.create name: island_name.humanize
  area.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/islands/#{island_name}.jpg"), filename: "#{island_name}.jpg")
  areas.push area
end

["vacay", "overlook", "hidden_gem", "family_home", "dreamy", "cottage", "churchy", "camp"].each do |property_name|
  property = Property.create name: property_name.humanize
  property.photo.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/properties/#{property_name}.jpg"), filename: "#{property_name}.jpg")
  5.times do |index|
    property.photos.attach(io: URI.open("/Users/adrian/work/talks/dummy_apps/hawaii_files/property_photos/#{property_name}_#{index}.jpg"), filename: "#{property_name}_#{index}.jpg")
  end
  properties.push property
end
