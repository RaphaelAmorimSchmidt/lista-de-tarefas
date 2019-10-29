class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :visibility

      t.timestamps
    end
  end
end
