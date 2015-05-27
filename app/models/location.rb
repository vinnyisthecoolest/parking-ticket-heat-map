class Location < ActiveRecord::Base
  has_many :tickets
end
