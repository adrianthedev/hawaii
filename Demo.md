# Demo

1. Install avo with generator

rails app:template LOCATION='https://railsbytes.com/script/zyvsME'

1.5. Set the `current_user`

```ruby
authenticate :user, ->(user) { user.is_admin? } do
  mount Avo::Engine, at: Avo.configuration.root_path
end
```

2. Generate `UserResource`

rails generate avo:resource user

3. Update the `title` to `first_name` and then to `name`

```ruby
def name
  "#{first_name} #{last_name}"
end

# user_resource.rb
field :password, as: :password
field :photo, as: :file, is_image: true
```

4. Add roles to user

`r g migration add_roles_to_users roles:json`

```ruby
field :roles, as: :boolean_group, options: {owner: "Owner", agent: "Agent"}

def is_owner?
  roles["owner"]
end

def is_agent?
  roles["agent"]
end
```

4.5 Add the Avo title property

```ruby
def avo_title
  is_owner? ? "Owner" : "Agent"
end
```

5. Generate `Area`

`r g model area name:string`

## Add `photo` file field

```ruby
has_one_attached :photo

field :photo, as: :file
```
<!--
## Add agent association

```ruby
belongs_to :agent, foreign_key: :user_id, class_name: "User"

field :agent, as: :belongs_to
``` -->

## Add areas and agents pivot table

`r g migration create_area_agents_join_table areas users`

```ruby
# user.rb
has_and_belongs_to_many :areas, inverse_of: :agents

# area.rb
has_and_belongs_to_many :agents, class_name: "User", inverse_of: :areas

# area_resource
field :agents, as: :has_and_belongs_to_many

# user_resource
field :areas, as: :has_and_belongs_to_many
```

6. Add `Property` model

`r g model property name:string address:string area:references user:references`

```ruby
# update property model
has_one_attached :photo
has_many_attached :photos

belongs_to :agent, foreign_key: :user_id, class_name: "User"

# update property_resource.rb
field :agent, as: :belongs_to

field :photo, as: :file, is_image: true
field :photos, as: :files

# user.rb
has_many :properties

# user_resource.rb
field :properties, as: :has_many
```

Demo the user without any areas that they can add properties from outside their area.
Then restrict it using `attach_scope`.

```ruby
field :properties, as: :has_many, attach_scope: -> {
  available_areas = parent.areas.pluck(:id)
  query.where(area_id: available_areas)
}

# add description
description: "You can attach properties from the Agent's assigned areas."
```

6.5. Demo the grid feature for properties

```ruby
grid do
  cover :photo, as: :file
  title :name, as: :text
  body :address, as: :text
end

self.default_view_type = :grid
```

7. Generate `Booking`

`r g model booking visitor:string visit_at:timestamp visited_at:timestamp user:references property:references`

```ruby
# update property to use user
belongs_to :agent, foreign_key: :user_id, class_name: "User"

def title
  "#{visitor} on #{visit_at} for #{property.name}"
end

# user_resource.rb
self.title = :title
```

Speak about how you can create a booking on a property directly.

Then demo the default and disabled options.

9. Has many scope

Create bookings for one property.
Scope the bookings on a property to view only the ones for that agent.

10. Speak about the multitude of customization options

11. Authorization

Uncomment pundit from `Gemfile`

`r g pundit:install`

Convert all methods to `true`

`r g pundit:policy area`

Demonstrate how `edit?` works for just the owner.

- Go to Safari and log in as an agent.
- show that they can't edit any areas
- assign a area to the agent and enable edit for agents that own that area
- generate a policy for `property`
- demonstrate how the file field is tied to that authorization policy

12. Search

Uncomment `ransack` from the gemfile and configure search for users.

Enable `search?` policy method.

Show the resource search and the global search.

Enhance the search results with `as_description` and `as_avatar`.

Show the searchable belongs_to for property->user

14. Sorting

Add sortable somewhere.

15. Filters

Create a name filter attach it to property and update the apply method.

```ruby
query.where("LOWER(name) LIKE ?", "%#{value.downcase}%")
```

Generate a user filter where you can filter agents/owners

`r g avo:filter user_filter --boolean`

```ruby
def apply(request, query, value)
  return query if value["owners"] && value["agents"]

  if value["owners"]
    query = query.owners
  elsif value["agents"]
    query = query.agents
  end

  query
end

def options
  {
    agents: "Agents",
    owners: "Owners",
  }
end
```

16. Actions

`r g avo:action mark_visited_action`

First do visited_at with `Time.now` then add a field to select the time

20. Dashboards

`r g avo:dashboard dashy`

`r g avo:card property_count`

Add range wand use the `ALL` value.

```ruby
if range == "ALL"
  result Property.count
else
  result Property.where(created_at: (Time.now - range.to_i.days)..).count
end
```

`r g avo:card:partial map_card`

make it bigger with cols and rows to `3`

21. Custom content

`r g avo:tool map`

Show what was created.

`r g avo:resource_tool comments`

`r g avo:field dynamic_address`





