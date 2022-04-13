class CreateQuestMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_monsters do |t|
      t.string :name, :null => false
      #t.integer :stage
      t.references :quest_stage
      t.string :img_path
      t.integer :hp, :null => false
      t.integer :mp, :null => false
      t.integer :power, :null => false
      t.integer :protect, :null => false
      t.integer :speed, :null => false
      t.integer :wise, :null => false
      t.integer :luck, :null => false

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index [ :name ], unique: true
    end
  end
end
