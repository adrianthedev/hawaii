class PropertyResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end
  self.default_view_type = :grid

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :address, as: DynamicAddressField
  field :island, as: :belongs_to
  field :user, as: :belongs_to
  field :coordinates, as: :text
  field :photo, as: :file
  field :photos, as: :files
  field :bookings, as: :has_many, scope: -> {
    if current_user.is_owner?
      query
    else
      query.where(user_id: current_user.id)
    end
  }

  grid do
    title :name, as: :text
    cover :photo, as: :file, link_to_resource: true
  end
  # add fields here
end
