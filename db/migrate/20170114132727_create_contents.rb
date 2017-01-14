class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :page
      t.string :heading
      t.text :text

      t.timestamps
    end
  end
end
