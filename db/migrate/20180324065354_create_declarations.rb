class CreateDeclarations < ActiveRecord::Migration[5.1]
  def change
    create_table :declarations do |t|
      t.string :ip_address
      t.string :city
      t.string :country_name
      t.string :country_code
      t.string :latitude
      t.string :longitude
      t.string :time_zone
      t.string :image
      t.string :rawemotiondata
      t.string :email

      t.timestamps
    end
  end
end
