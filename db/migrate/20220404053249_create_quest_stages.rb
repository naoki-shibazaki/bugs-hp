class CreateQuestStages < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_stages do |t|
      t.integer :num, :null => false
      t.string :name, :null => false
      t.text :episode, :null => false

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index [ :num, :name ], unique: true
    end
  end
end
