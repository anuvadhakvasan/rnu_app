class CreateTypists < ActiveRecord::Migration
  def change
    create_table :typists do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
