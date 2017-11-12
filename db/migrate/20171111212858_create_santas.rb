class CreateSantas < ActiveRecord::Migration[5.1]
  def change
    create_table :santas do |t|
      t.belongs_to :christmas, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps

      t.index %i[christmas_id user_id], unique: true
    end
  end
end
