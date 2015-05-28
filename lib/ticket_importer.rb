require 'csv'
require './app/models/ticket.rb'
require './app/models/location.rb'

class TicketImporter

  def initialize(filename = File.absolute_path('db/data/test.csv'))
    @filename = filename
  end

  def import
    field_names = ['date', 'code', 'category', 'cost', 'time', 'plates']
    puts "Importing students from '#{@filename}'"
    failure_count = 0
    Ticket.transaction do
      CSV.read(@filename).each do | line |
        data = [line[1], line[2], line[3], line[4], line[5], line[-1]]
        attribute_hash = Hash[field_names.zip(data)]
        begin
          Ticket.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
    puts "\nDONE #{failures}\n\n"
  end


    # puts "Importing tickets from '#{@filename}'"
    # failure_count = 0
    # Ticket.transaction do
    #   CSV.read(@filename).each do |line|
    #     begin
    #       Ticket.create!(address: line[7])
    #       print '.'
    #     rescue ActiveRecord::UnknownAttributeError
    #       failure_count += 1
    #       print '!'
    #     end
    #   end
    # end
    # failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
    # puts "\nDONE #{failures}\n\n"

end





# class StudentsImporter

#   def initialize(filename=File.absolute_path('db/data/students.csv'))
#     @filename = filename
#   end

#   def import
#     field_names = ['first_name', 'last_name', 'gender', 'birthday', 'email', 'phone']
#     puts "Importing students from '#{@filename}'"
#     failure_count = 0
#     Student.transaction do
#       File.open(@filename).each do |line|
#         data = line.chomp.split(',')
#         attribute_hash = Hash[field_names.zip(data)]
#         begin
#           Student.create!(attribute_hash)
#           print '.'
#         rescue ActiveRecord::UnknownAttributeError
#           failure_count += 1
#           print '!'
#         ensure
#           STDOUT.flush
#         end
#       end
#     end
#     failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
#     puts "\nDONE #{failures}\n\n"
#   end

# end