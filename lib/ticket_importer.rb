require 'csv'
require './app/models/ticket.rb'
require './app/models/location.rb'

class TicketImporter

  def initialize(filename = File.absolute_path('db/data/test_10.csv'))
    @filename = filename
  end

  def import
    field_names = ['date', 'code', 'category', 'cost', 'time', 'plates']
    puts "Importing students from '#{@filename}'"
    Ticket.transaction do
      CSV.read(@filename).each do | line |
        location = Location.find_or_create_by!(address: line[7])
        data = [line[1], line[2], line[3], line[4], line[5], line[-1]]
        attribute_hash = Hash[field_names.zip(data)]
        location.tickets.create!(attribute_hash)
      end
    end
    puts "\nDONE\n\n"
  end

end
