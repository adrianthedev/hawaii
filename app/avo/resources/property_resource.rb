class PropertyResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end
  self.default_view_type = :table

  self.resolve_query_scope = -> (model_class: ) {
    model_class.order(position: :asc)
  }

  self.ordering = {
    display_inline: true,
    visible_on: :index,
    actions: {
      higher: -> { record.move_higher },
      lower: -> { record.move_lower },
      to_top: -> { record.move_to_top },
      to_bottom: -> { record.move_to_bottom },
    }
  }

  self.stimulus_controllers = "visuality"

  # Fields generated from the model
  field :name, as: :text
  field :address, as: DynamicAddressField, as_description: true
  field :island, as: :belongs_to
  field :user, as: :belongs_to, searchable: true
  field :coordinates, as: :text
  field :photos, as: :files
  field :bookings, as: :has_many, scope: -> {
    if current_user.is_owner?
      query
    else
      query.where(user_id: current_user.id)
    end
  }

  sidebar do
    field :id, as: :id
    field :photo, as: :file, as_avatar: :square

  end

  grid do
    title :name, as: :text
    cover :photo, as: :file, link_to_resource: true
  end

  action ImportProperties

  filter NameFilter
  # add fields here
end
