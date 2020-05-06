class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.time :depart_time
      t.string :depart_place
      t.string :moving_way
      t.text :todo
      t.text :note
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
