class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :board, index: true
      t.string :title
      t.text :description
      t.string :url
      t.string :image

      t.timestamps null: false
    end
    add_foreign_key :pins, :boards
  end
end
