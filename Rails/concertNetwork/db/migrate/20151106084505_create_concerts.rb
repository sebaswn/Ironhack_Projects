class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
    	t.string :band
    	t.string :venue
    	t.string :city
    	t.date :date
    	t.integer :price
    	t.string :description 
      t.string :image
      t.timestamps null: false
    end
  end
end
