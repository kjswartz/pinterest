class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user, index: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :boards, :users
  end
end
