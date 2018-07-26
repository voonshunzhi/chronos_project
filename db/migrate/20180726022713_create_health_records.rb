class CreateHealthRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :health_records do |t|
      t.belongs_to :patient, foreign_key: true
      t.boolean :obese,default:false
      t.boolean :diabete,default:false
      t.boolean :hypertension,default:false

      t.timestamps
    end
  end
end
