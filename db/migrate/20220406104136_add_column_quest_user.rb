class AddColumnQuestUser < ActiveRecord::Migration[6.1]
  def change
    add_column :quest_users, :change_token_digest, :string
    add_index :quest_users, :change_token_digest, unique: true
  end
end
