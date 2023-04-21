class Avo::ToolsController < Avo::ApplicationController
  def big_map
    @page_title = "Big map"
    add_breadcrumb "Big map"

    @coordinates = Property.all.map do |property|
      lat, long = property.coordinates.split(',')
      {
        latitude: lat,
        longitude: long,
      }
    end
  end
end
