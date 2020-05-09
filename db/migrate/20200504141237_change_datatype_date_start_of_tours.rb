class ChangeDatatypeDateStartOfTours < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :date_start
    add_column :tours, :date_start, :date
  end
end
