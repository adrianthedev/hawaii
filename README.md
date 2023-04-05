# README

# DB Structure

User - roles [manager, agent]
  Manger - can assign areas to Agents
   - can create `Properties`
  Agent - can book `Visits`
Area
  - name
  - photo
  - has_many `Properties`
  - has_many `Agents`
  - belongs_to `Agency`?
Property
  - name
  - address
  - main photo
  - photos
  - belongs_to `Area`
  - belongs_to `Agency`
  - belongs_to `Agent`
Booking -
  - visitor
  - visit date & time
  - belongs_to `Agent`
  - belongs_to `Property`
Agency -
  - has_many Agents
  - has_many Areas?