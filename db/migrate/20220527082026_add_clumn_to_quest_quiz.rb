class AddClumnToQuestQuiz < ActiveRecord::Migration[6.1]
  def change
    add_column :quest_quizzes, :open_status, :boolean, default: false, null: false, comment: 'true -> 公開｜false -> 非公開'
  end
end
