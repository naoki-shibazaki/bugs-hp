class CreateQuestExtras < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_extras do |t|
      t.integer :extra_num, :null => false
      t.string :kind, :null => false, limit: 50
      t.string :title, :null => false, limit: 50
      #t.integer :quest_monster_id
      t.references :quest_monster, :null => false
      t.string :format, :null => false, limit: 50
      t.string :question, :null => false, limit: 500
      t.string :choice, :null => false, limit: 500
      t.string :answer, :null => false, limit: 500
      t.string :tips, limit: 500
      t.integer :exp, :null => false
      t.boolean :open_status, :null => false, default: false, comment: 'true -> 公開｜false -> 非公開'
      #t.timestamps
    end
  end
end
