class CreateLocationsTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude, :longitude
    end
  end
end
