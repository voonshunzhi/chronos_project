class AddColumnsToObese < ActiveRecord::Migration[5.2]
  def change
    add_column :obeses,:weight,:float
    add_column :obeses,:height,:float
  end
end
