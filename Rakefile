require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)
require './lib/ticket_importer'
require './lib/geocode_all'

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Populate the database with ticket data'
task "db:populate" do
  ActiveRecord::Base.logger.level = 2
  TicketImporter.new.import
end

desc 'Add geocode data to location table'
task 'geocode_all' do
  ActiveRecord::Base.logger.level = 2
  GeocodeAll.new.run
end
