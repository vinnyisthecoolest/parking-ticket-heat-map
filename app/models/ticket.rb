class Ticket < ActiveRecord::Base
  belongs_to :location, counter_cache: true
end
