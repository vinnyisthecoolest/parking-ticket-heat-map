class AddReferenceColumnToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.references :location
    end
  end
end
