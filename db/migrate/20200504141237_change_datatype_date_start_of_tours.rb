class ChangeDatatypeDateStartOfTours < ActiveRecord::Migration[5.2]
  def change
    change_column :tours, :date_start, :date
  end
end
