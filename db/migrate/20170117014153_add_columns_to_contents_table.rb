class AddColumnsToContentsTable < ActiveRecord::Migration[5.0]
  def change
  	change_table :contents do |t|
  		t.string 	:path
  		t.boolean	:visible, default: true
  	end
  end
end
