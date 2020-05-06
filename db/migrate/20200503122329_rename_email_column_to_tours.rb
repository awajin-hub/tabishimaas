class RenameEmailColumnToTours < ActiveRecord::Migration[5.2]
  def change
      rename_column :tours, :email, :place
  end
end
