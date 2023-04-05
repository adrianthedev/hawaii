require 'faker'

User.delete_all

users = []

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

