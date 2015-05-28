class ChangeCountLabel < ActiveRecord::Migration

  def change
    change_table :locations do | t |
      t.remove :count
      t.integer :tickets_count
    end
  end

end
