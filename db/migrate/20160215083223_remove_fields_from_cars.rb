class RemoveFieldsFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :last_servicing_date, :string
    remove_column :cars, :date, :string
    remove_column :cars, :repair_part, :string
    remove_column :cars, :text, :string
  end
end
