class ImportProperties < Avo::BaseAction
  self.name = "Import properties"
  # self.visible = -> do
  #   true
  # end
  self.standalone = true

  field :csv, as: :file

  def handle(**args)
    fields, current_user, resource = args.values_at(:fields, :current_user, :resource)

    # puts ["field[:csv].read->", fields[:csv].read].inspect
    if fields[:csv].present?
      succeed "thanks for the file"
    else
      warn "no fiel here"
    end

    # redirect_to "http://openai.com", allow_other_host: true
    # download


  end
end
