require './app/models/test.rb'
require './app/models/ticket.rb'
require './app/models/location.rb'

class ParseTest

  def import
    field_names = %w(date code category cost time plates)
    puts "Importing tickets from 'test' table"
    failure_count  = 0
    Ticket.transaction do
      Test.all.each do | line |
        begin
          location = Location.find_or_create_by!(address: line.address)
        rescue ActiveRecord::RecordInvalid
          failure_count += 1
        ensure
          STDOUT.flush
        end
        data = [line.date, line.code, line.category, line.cost, line.time, line.plates]
        attribute_hash = Hash[field_names.zip(data)]
        location.tickets.create!(attribute_hash) if location
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} tickets)" : ''
    puts "\nDONE #{failures}\n\n"
    end_time = Time.now
    p end_time - start_time
  end

end
