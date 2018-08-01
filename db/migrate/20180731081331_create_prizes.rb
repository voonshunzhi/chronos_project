class CreatePrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :prizes do |t|
    	t.string :name
    	t.string :description
    	t.integer :cost
    	t.string :image

      t.timestamps
    end
  end
end
