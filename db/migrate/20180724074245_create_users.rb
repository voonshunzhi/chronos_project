class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,presence:true
      t.integer :age,presence:true
      t.string :ic,presence:true
      t.string :gender,presence:true
      t.string :phone,presence:true
      t.string :email
      t.integer :role,default:0

      t.timestamps
    end
  end
end
