class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :tourname
      t.string :email
      t.time :date_start
      t.time :date_end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
