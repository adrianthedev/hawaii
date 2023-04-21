class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], first_name_cont: params[:q], last_name_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :role, as: :select, options: [:owner, :agent]
  # add fields here

  sidebar do
    field :photo, as: :file, is_image: true

  end

  panel do
    field :first_name, as: :text, sortable: true
    field :last_name, as: :text

  end

  tabs do
    field :islands, as: :has_and_belongs_to_many
    field :properties, as: :has_many, attach_scope: -> {
      island_ids = parent.islands.pluck(:id)
      query.where(island_id: island_ids)
    }, description: "This listing will have only the properties from the users islands"

  end

  filter AgentFilter
end
