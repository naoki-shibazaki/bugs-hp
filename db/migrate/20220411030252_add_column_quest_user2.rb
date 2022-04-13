class AddColumnQuestUser2 < ActiveRecord::Migration[6.1]
  def change
    add_column :quest_users, :recent_quiz_id, :integer
  end
end
