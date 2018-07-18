class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.date :check_in
    	t.date :check_out
    	t.integer :price
      t.integer :payment
    	t.references :user, foreign_key:true
    	t.references :listing, foreign_key:true

      t.timestamps
    end
  end
end
