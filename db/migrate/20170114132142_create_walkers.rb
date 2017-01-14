class CreateWalkers < ActiveRecord::Migration[5.0]
  def change
    create_table :walkers do |t|
      t.string :fname
      t.string :lname
      t.text :bio
      t.boolean :active

      t.timestamps
    end
  end
end
