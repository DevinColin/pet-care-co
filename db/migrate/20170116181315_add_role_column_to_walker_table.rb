class AddRoleColumnToWalkerTable < ActiveRecord::Migration[5.0]
  def change
  	change_table :walkers do |t|
  		t.string :role, default: "Caregiver"
  	end
  end
end
