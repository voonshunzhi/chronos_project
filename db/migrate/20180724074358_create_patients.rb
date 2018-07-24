class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.float :height
      t.float :weight
      t.string :blood_type
      t.belongs_to :user
      t.belongs_to :doctor
      t.integer :points
      t.timestamps
    end
  end
end
