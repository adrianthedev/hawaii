class AgentFilter < Avo::Filters::SelectFilter
  self.name = "Agent filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query.where(role: value)
  end

  def options
    {
      owner: "Owner",
      agent: "Agent"
    }
  end
end
