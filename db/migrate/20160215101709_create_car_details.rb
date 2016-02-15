class CreateCarDetails < ActiveRecord::Migration
  def change
    create_table :car_details do |t|
      t.references :car, index: true, foreign_key: true
      t.date :last_servicing_date
      t.text :repair_part

      t.timestamps null: false
    end
  end
end
