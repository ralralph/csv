class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :prefecture_id
      t.string :name
      t.string :kana
      t.string :zipcode
      t.string :city
      t.string :address_other
      t.string :hp_url
      t.string :tel
      t.string :capital
      t.string :employees_num
      t.string :founded_in
      t.string :listed_market

      t.timestamps
    end
  end
end
