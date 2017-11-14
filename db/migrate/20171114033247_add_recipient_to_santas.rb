class AddRecipientToSantas < ActiveRecord::Migration[5.1]
  def change
    add_reference :santas, :recipient,
      foreign_key: { to_table: :santas, on_delete: :nullify }
  end
end
