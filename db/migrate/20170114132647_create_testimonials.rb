class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.string :cust_name
      t.string :cust_desc
      t.integer :stars
      t.text :content
      t.boolean :visible

      t.timestamps
    end
  end
end
