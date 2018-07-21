class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.integer :user_id
      t.datetime :time
      t.text :input
      t.string :category
      t.string :intensity
      t.float :anger
      t.float :calmness
      t.float :fear
      t.float :happiness
      t.float :liking
      t.float :shame
      t.float :certainty
      t.float :surprise

    
      

      t.timestamps
    end
  end
end
