class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :address
      t.string :guest
      t.string :bedroom
      t.string :baths 
      t.string :min_stays
      t.string :city
      t.string :description
      t.integer :price
      t.string :amenities, array: true, default: []


      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
