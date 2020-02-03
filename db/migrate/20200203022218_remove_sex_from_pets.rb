class RemoveSexFromPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :sex, :text
  end
end
