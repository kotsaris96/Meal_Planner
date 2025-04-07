class CreateWeeks < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks do |t|
      t.string :weekday_start
      t.string :weekday_end

      t.timestamps
    end
  end
end
