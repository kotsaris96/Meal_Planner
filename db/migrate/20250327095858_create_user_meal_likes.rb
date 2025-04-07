class CreateUserMealLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :user_meal_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.boolean :is_like

      t.timestamps
    end
  end
end
