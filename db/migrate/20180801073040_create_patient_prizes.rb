class CreatePatientPrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_prizes do |t|
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :prize, foreign_key: true

      t.timestamps
    end
  end
end
