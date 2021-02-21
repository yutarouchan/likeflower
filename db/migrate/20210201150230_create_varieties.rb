class CreateVarieties < ActiveRecord::Migration[6.1]
  def change
    create_table :varieties do |t|
      t.string :title
      t.text :about
      t.string :date
      t.string :image
      t.string :cast

      t.timestamps
    end
  end
end
