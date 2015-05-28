class ChangeTimeTypeAgain < ActiveRecord::Migration

  def change
    change_table :tickets do | t |
      t.remove :time
      t.string :time
    end
  end

end
