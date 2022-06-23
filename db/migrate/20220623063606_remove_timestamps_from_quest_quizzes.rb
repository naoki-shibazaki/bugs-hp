# 参考：https://railsdoc.com/page/remove_timestamps
class RemoveTimestampsFromQuestQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_timestamps(:quest_quizzes)
  end
end
