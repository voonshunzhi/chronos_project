class AddLevelColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :level, :string
  end
end
