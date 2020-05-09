class ChangeDatatypeDateEndOfTours < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :date_end
    add_column :tours, :date_end, :date
  end
end
