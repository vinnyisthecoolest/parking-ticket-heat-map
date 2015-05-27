class CreateTicketsTable < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :address
    end
  end
end
