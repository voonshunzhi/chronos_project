class CreateHypertensions < ActiveRecord::Migration[5.2]
  def change
    create_table :hypertensions do |t|
      t.float :SBP
      t.float :DBP
      t.string :medication
      t.string :notes
      t.belongs_to :health_record
      
      t.timestamps
    end
  end
end
