class AddCountryToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :encrypted_country, :string
    add_column :addresses, :encrypted_country_iv, :string
  end
end
