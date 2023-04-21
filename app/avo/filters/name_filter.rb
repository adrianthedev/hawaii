class NameFilter < Avo::Filters::TextFilter
  self.name = "Name filter"
  self.button_label = 'Filter by name'
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query.where("LOWER(name) LIKE ?", "%#{value.downcase}%")
  end
end
