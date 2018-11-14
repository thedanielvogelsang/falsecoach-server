class AddResultsToWorkoutItems < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_items, :results, :string, null: true
  end
end
