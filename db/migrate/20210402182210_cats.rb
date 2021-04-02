class Cats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :gender
      t.string :breed
      t.string :size
    end
  end
end
