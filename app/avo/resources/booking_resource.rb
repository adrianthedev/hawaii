class BookingResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  self.show_controls = -> {
    back_button
    delete_button
    actions_list exclude: [MarkVisitedAction]
    action MarkVisitedAction, style: :outline, color: :indigo
    link_to "Turbo magic", "/avo/resources/bookings/4?something_else=visuality❤️❤️❤️", data: {turbo_frame: "something"}
    edit_button
  }

  field :id, as: :id
  # Fields generated from the model
  field :visitor, as: :text
  field :visit_at, as: :date_time
  field :visited_at, as: :date_time
  field :user, as: :belongs_to, disabled: -> { !current_user.is_owner?}, default: -> {current_user.id}
  field :property, as: :belongs_to
  # add fields here

  action MarkVisitedAction

  tool CommentsResourceTool
end
