class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.integer :user_id
      t.datetime :time
      t.text :text
      t.string :mood
      t.integer :intensity
      t.string :language
      t.string :mode   

      t.timestamps
    end
  end
end
