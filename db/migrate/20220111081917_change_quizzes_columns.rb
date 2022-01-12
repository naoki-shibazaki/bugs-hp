class ChangeQuizzesColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :answer2, :integer
  end
end
