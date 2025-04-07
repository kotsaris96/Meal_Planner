class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :description
      t.integer :meal_type
      t.integer :calories

      t.timestamps
    end
  end
end
