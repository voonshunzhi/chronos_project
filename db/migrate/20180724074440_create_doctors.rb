class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :code
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
