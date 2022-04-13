class CreateQuestUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_users do |t|
      #t.references :users, foreign_key: true, index: true, unique: true
      t.references :users, :null => false, foreign_key: true, index: {unique: true}
      t.string :name, :null => false, limit: 255
      t.integer :lv, :null => false, :default => 1
      t.integer :exp, :null => false, :default => 0
      t.string :sex, :null => false, :default => '？'
      t.string :job
      t.integer :quiz_id, :null => false, :default => 1

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index [ :quiz_id ], unique: true
    end
    #add_index :quest_users, [:users], unique: true
  end
end
