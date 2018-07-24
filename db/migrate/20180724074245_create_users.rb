class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :ic
      t.string :gender
      t.string :phone
      t.string :email
      t.integer :role

      t.timestamps
    end
  end
end
