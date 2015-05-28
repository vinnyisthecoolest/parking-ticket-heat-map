require 'geocoder'

class Location < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  has_many :tickets
  geocoded_by :full_street_address

  def full_street_address
    address.concat(', Toronto, ON, CA')
  end

end
