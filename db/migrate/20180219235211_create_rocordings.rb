class CreateRocordings < ActiveRecord::Migration[5.1]
  def change
    create_table :rocordings do |t|
      t.references :location
      t.integer :temp
      t.string :status

      t.timestamps
    end
  end
end
