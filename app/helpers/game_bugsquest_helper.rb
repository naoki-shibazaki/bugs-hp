module GameBugsquestHelper
    include SessionsHelper

    # ゲストユーザー用のリンクパラメータ生成
    def make_bugsquest_pram
        unless logged_in?
            return '?mode=guest'
        end
    end

    # バグズクエスト：アカウント作成
    def create_bugsquest_account(user_id)
        user = User.find(user_id)
        # ゲームアカウントが存在してなければ作成する
        if QuestUser.find_by(users_id: user_id).nil?
            questUser = QuestUser.new
            questUser.users_id = user.id
            questUser.name = user.name
            questUser.lv = 1
            questUser.exp = 0
            questUser.save
        end
    end

    # バグズクエスト：ユーザーデータ取得
    def get_bugsquest_game_data
        ret = {}
        ret[:questUser] = QuestUser.new
        ret[:questQuiz] = QuestQuiz.new
        ret[:questStage] = QuestStage.new
        ret[:questStatus] = QuestStatus.new
        ret[:questMonster] = QuestMonster.new
        unless current_user.nil?
            ret[:questUser] = QuestUser.find_by(users_id: current_user.id)
            ret[:questQuiz] = QuestQuiz.find(ret[:questUser].quiz_id)
            ret[:questStage] = QuestStage.find(ret[:questQuiz].quest_stage_id)
            ret[:questMonster] = QuestMonster.find(ret[:questQuiz].quest_monster_id)
            ret[:questStatus] = QuestStatus.find_by(lv: ret[:questUser].lv)
            ret[:answers] = get_bugsquest_quiz_choice(ret[:questQuiz].choice)
            # 次のレベルまでの経験値
            ret[:next_lvup_exp] = next_lvup_exp
        else
            ret[:questUser].name = 'ゲストユーザー'
            ret[:questQuiz].id = 0
            ret[:questStage].num = 0
            ret[:questStage].name = 'ゲストモード'
            ret[:questStatus].hp = 5
            ret[:questStatus].mp = 2
            ret[:questUser].lv = 0
            ret[:questUser].exp = 0
            ret[:questMonster].name = 'ブラックバグズ'

            ret[:questQuiz].question = '正しいプログラム言語で敵を倒せ！'
            ret[:questQuiz].tips = 'アカウントを作成すると<br />経験値をためらるぞ❢'

            # 次のレベルまでの経験値
            ret[:next_lvup_exp] = '＜アカウントを作成すると経験値をためられるぞ❢＞'
        end
        return ret
    end
    
    # クイズ取得
    def get_bugsquest_quiz_choice(quiz_choice)
        answers = quiz_choice.split(',').shuffle!
        return answers
    end

    # データ変更用のクエストユーザートークン生成
    def create_user_token
        if logged_in?
            gen_usertoken = QuestUser.find_by(users_id: current_user.id)
            gen_usertoken.create_token_digest
            return gen_usertoken.change_token
        end
    end

    # 次のレベルまでの経験値を取得
    def next_lvup_exp
        if logged_in?
            questUser = QuestUser.find_by(users_id: current_user.id)
            # 次のレベルまでの経験値
            return QuestStatus.find_by(lv: questUser.lv + 1).exp - questUser.exp
        end
    end
end
