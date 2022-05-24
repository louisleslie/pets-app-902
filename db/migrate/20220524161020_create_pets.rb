class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :address
      t.date :date_found
      t.boolean :claimed, default: false

      t.timestamps
    end
  end
end
