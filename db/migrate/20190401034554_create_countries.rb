class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :city_name
      t.date :arrival_date
      t.date :departure_date
    end  
  end
end
