class CreateRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :room_types do |t|
      t.string :name
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
