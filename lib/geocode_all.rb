require './app/models/location.rb'

class GeocodeAll

  def run
    Location.find_each do | l |
      l.geocode
      l.save
    end
  end

end