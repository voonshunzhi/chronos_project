class CreateHealthRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :health_records do |t|
      t.belongs_to :patient
	      
      t.timestamps
    end
  end
end
