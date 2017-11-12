class CreateChristmases < ActiveRecord::Migration[5.1]
  def change
    create_table :christmases do |t|
      t.timestamp :signup_deadline, index: true
    end
  end
end
