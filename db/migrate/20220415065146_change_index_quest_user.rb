class ChangeIndexQuestUser < ActiveRecord::Migration[6.1]
  def change
    remove_index :quest_users, name: :index_quest_users_on_quiz_id
  end
end
