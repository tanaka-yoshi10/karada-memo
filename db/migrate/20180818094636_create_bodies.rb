class CreateBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :bodies do |t|
      t.string :nickname, null: false, default: ''
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
