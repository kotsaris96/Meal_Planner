class CreateMealsDays < ActiveRecord::Migration[8.0]
  def change
    create_join_table :meals, :days, column_options: { null: false, foreign_key: true } do |t|
      t.index [ :meal_id, :day_id ]
    end
  end
end
