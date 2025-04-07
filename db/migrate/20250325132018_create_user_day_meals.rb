class CreateUserDayMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :user_day_meals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.boolean :is_selected, null: false, default: false

      t.timestamps
    end
  end
end
