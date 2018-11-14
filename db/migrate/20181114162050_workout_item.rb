class WorkoutItem < ActiveRecord::Migration[5.2]
  def change
    create_table(:workout_items) do |t|
      t.references :workout, null: false

      t.string :title, null: false

      t.timestamps
    end
  end
end
