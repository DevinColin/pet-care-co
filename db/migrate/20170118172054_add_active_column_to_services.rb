class AddActiveColumnToServices < ActiveRecord::Migration[5.0]
  def change
  	change_table :services do |t|
  		t.boolean :active, default: true
  	end
  end
end
