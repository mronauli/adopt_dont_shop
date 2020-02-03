class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :picture
      t.string :name
      t.string :description
      t.string :age
      t.string :adoption_status
    end
  end
end
