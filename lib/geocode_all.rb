require './app/models/location.rb'

class GeocodeAll

  def run
    Geocoder.configure(
      :lookup => :yandex
      # :lookup => :bing,
      # :api_key => "...",
      # geocoding service request timeout, in seconds (default 3):
      # :timeout => 5,
    )
    Location.find_each do | l |
      l.geocode unless l.latitude && l.longitude 
      l.save
    end
  end

end