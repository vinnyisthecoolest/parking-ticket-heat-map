class UpdateTables < ActiveRecord::Migration

  def change
    change_table :locations do | t |
      t.string :address
      t.integer :count
    end

    change_table :tickets do | t |
      t.date :date
      t.integer :code
      t.string :category
      t.integer :cost
      t.time :time
      t.string :plates
      t.remove :address
    end
  end

end
