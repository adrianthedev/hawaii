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
Property
  - name
  - address
  - main photo
  - photos
  - belongs_to `Area`
  - belongs_to `Agent`
Booking -
  - visitor
  - visit date & time
  - belongs_to `Agent`
  - belongs_to `Property`