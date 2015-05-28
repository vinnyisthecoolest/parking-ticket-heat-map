class ChangeTimeType < ActiveRecord::Migration

  def change
    change_table :tickets do | t |
      t.remove :time
      t.integer :time
    end
  end

end
