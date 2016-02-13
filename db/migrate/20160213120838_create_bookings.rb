class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :shift, index: true, foreign_key: true
      t.references :editor, index: true, foreign_key: true
      t.references :typist, index: true, foreign_key: true
      t.references :reader, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
