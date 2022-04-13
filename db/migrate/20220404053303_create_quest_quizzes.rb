class CreateQuestQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_quizzes do |t|
      #t.integer :stage_id, :null => false
      t.references :quest_stage, :null => false
      #t.integer :monster_id, :null => false
      t.references :quest_monster, :null => false
      t.string :format, :null => false
      t.string :question, :null => false
      t.string :choice, :null => false
      t.string :answer, :null => false
      t.string :tips
      t.string :episode
      t.integer :exp, :null => false

      t.timestamps  null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
