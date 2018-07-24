class CreateDiabetes < ActiveRecord::Migration[5.2]
  def change
    create_table :diabetes do |t|
      t.float :fasting_blood_glucose
      t.float :hg1ac
      t.integer :meal
      t.float :blood_glucose_level
      t.string :medication
      t.string :notes
      t.belongs_to :health_record
      
      t.timestamps
    end
  end
end
