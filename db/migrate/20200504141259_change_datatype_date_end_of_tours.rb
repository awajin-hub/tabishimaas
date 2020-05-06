class ChangeDatatypeDateEndOfTours < ActiveRecord::Migration[5.2]
  def change
    change_column :tours, :date_end, :date
  end
end
