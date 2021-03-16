class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, limit: 50
      t.text :addres
      t.integer :age

      t.timestamps
    end
  end
end
