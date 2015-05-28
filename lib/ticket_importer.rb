require 'csv'
require './app/models/tickets.rb'

class TicketImporter

  def initialize(filename = File.absolute_path('db/data/test.csv'))
    @filename = filename
  end

  def import
    field_names = ['address']
    puts "Importing tickets from '#{@filename}'"
    failure_count = 0
    Ticket.transaction do
      CSV.read(@filename).each do |line|
        begin
          Ticket.create!(address: line[7])
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end


