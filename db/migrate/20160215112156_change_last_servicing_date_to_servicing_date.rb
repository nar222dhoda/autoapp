class ChangeLastServicingDateToServicingDate < ActiveRecord::Migration
  def change
    rename_column :car_details, :last_servicing_date, :servicing_date
  end
end
