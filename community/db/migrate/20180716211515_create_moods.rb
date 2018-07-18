class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.integer :user_id
      t.datetime :time
      t.string :category
      t.string :intensity
      t.string :location
      t.string :impact

      t.timestamps
    end
  end
end
