class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.integer :user_id
      t.datetime :time
      t.json :mood
      t.integer :intensity

      t.timestamps
    end
  end
end
