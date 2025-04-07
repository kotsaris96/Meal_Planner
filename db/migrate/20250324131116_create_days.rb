class CreateDays < ActiveRecord::Migration[8.0]
  def change
    create_table :days do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
