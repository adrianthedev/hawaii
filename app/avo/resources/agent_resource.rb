class AgentResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  self.model_class = "User"

  self.resolve_query_scope = -> (model_class: ) {
    model_class.where(role: :agent)
  }

  field :id, as: :id
  field :email, as: :text
  field :first_name, as: :text, sortable: true
  field :last_name, as: :text
  # add fields here
end
