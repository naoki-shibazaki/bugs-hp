class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :quiz, :null => false
      t.boolean :answer, :null => false

      #t.timestamps
    end
    add_index :quizzes, [:quiz], :unique => true
  end
end
