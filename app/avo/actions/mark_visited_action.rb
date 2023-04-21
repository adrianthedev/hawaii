class MarkVisitedAction < Avo::BaseAction
  self.name = "Mark visited action"
  # self.visible = -> do
  #   true
  # end

  field :time, as: :date_time

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    visited_at = fields[:time].present? ? fields[:time] : Time.now

    models.each do |model|
      model.update(visited_at: visited_at)
      # Do something with your models.
    end
  end
end
