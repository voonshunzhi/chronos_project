class CreateObeses < ActiveRecord::Migration[5.2]
  def change
    create_table :obeses do |t|
      t.float :bmi
      t.float :waist_circumference
      t.string :notes
      t.string :medication
      t.references :health_record

      t.timestamps
    end
  end
end
