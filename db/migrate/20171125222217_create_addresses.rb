class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :santa, foreign_key: { on_delete: :cascade }
      t.string :encrypted_name
      t.string :encrypted_name_iv
      t.string :encrypted_line_1
      t.string :encrypted_line_1_iv
      t.string :encrypted_line_2
      t.string :encrypted_line_2_iv
      t.string :encrypted_suburb
      t.string :encrypted_suburb_iv
      t.string :encrypted_city
      t.string :encrypted_city_iv
      t.string :encrypted_postcode
      t.string :encrypted_postcode_iv
      t.string :encrypted_postcode
      t.string :encrypted_postcode_iv
      t.timestamps
    end
  end
end
