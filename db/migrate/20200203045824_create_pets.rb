class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :picture
      t.string :description
      t.string :age
      t.string :sex
      t.string :adoption_status
    end
  end
end
