module ApplicationHelper
    # クイズ取得[ゲスト用]
    def get_quiz
        quin_num_all = 5
        quin_num_false = 4
        quin_num_true = quin_num_all - quin_num_false

        get_quiz_true = Quiz.where(answer2: 1).order('RANDOM()').limit(1)
        get_quizzes_false = Quiz.where(answer2: 0).order('RANDOM()').limit(quin_num_false)

        #quiz = []
        quiz = {}
        for num in 1..quin_num_false do
        #quiz[num] = get_quizzes_false[num].quiz
        quiz[get_quizzes_false[num-1].quiz] = 0

        end
        #quiz[3] = get_quiz_true[0].quiz
        quiz[get_quiz_true[0].quiz] = 1

        #@quizzes = quiz.sort_by! {rand}
        return quiz.sort.to_h
    end
end
