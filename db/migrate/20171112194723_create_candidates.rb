class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.belongs_to :santa, required: true
      t.string :uid, limit: 32, required: true

      t.index %i[uid santa_id]
    end
  end
end
