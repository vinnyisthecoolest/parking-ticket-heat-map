require 'csv'
require './app/models/ticket.rb'
require './app/models/location.rb'

class TicketImporter

  def initialize(filename = File.absolute_path('db/data/test_50k.csv'))
    @filename = filename
  end

  def import
    field_names = %w(date code category cost time plates)
    puts "Importing tickets from '#{@filename}'"
    failure_count  = 0
    Ticket.transaction do
      CSV.read(@filename).each do | line |
        begin
          location = Location.find_or_create_by!(address: line[7])
        rescue ActiveRecord::RecordInvalid
          failure_count += 1
        ensure
          STDOUT.flush
        end
        data = [line[1], line[2], line[3], line[4], line[5], line[-1]]
        attribute_hash = Hash[field_names.zip(data)]
        location.tickets.create!(attribute_hash) if location
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} tickets)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end
