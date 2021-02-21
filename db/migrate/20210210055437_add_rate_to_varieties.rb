class AddRateToVarieties < ActiveRecord::Migration[6.1]
  def change
    add_column :varieties, :rate, :float
  end
end
