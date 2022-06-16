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
    def get_bugsquest_game_data(mode: nil, extra_datas: nil)
        # 各モードの共通処理
        @ret = {}
        @ret[:questUser] = QuestUser.new
        @ret[:questQuiz] = QuestQuiz.new
        @ret[:questStage] = QuestStage.new
        @ret[:questStatus] = QuestStatus.new
        @ret[:questMonster] = QuestMonster.new

        case mode
            when 'guest'
                # ゲスト用のデータをセット
                guest_data_set
                # バトル終了後のリンク
                @ret[:yesno_link] = '/game/bugsquest'+make_bugsquest_pram

            when 'story', 'select'
                @ret[:questUser] = QuestUser.find_by(users_id: current_user.id)
                @ret[:questQuiz] = QuestQuiz.find_by(id: @ret[:questUser].recent_quiz_id, open_status: true)
                @ret[:questStage] = QuestStage.find(@ret[:questQuiz].quest_stage_id)
                @ret[:questMonster] = QuestMonster.find(@ret[:questQuiz].quest_monster_id)
                @ret[:questStatus] = QuestStatus.find_by(lv: @ret[:questUser].lv)
                @ret[:answers] = get_bugsquest_quiz_choice(@ret[:questQuiz].choice)
                @ret[:tips] = @ret[:questQuiz].tips

                # 次のレベルまでの経験値
                @ret[:next_lvup_exp] = next_lvup_exp(1)

            when 'extra'
                @ret[:questUser] = QuestUser.find_by(users_id: current_user.id)
                if extra_datas[:extra_id].nil?
                    @ret[:questExtra] = QuestExtra.where(extra_num: extra_datas[:extra_num], open_status: true).first
                else
                    @ret[:questExtra] = QuestExtra.where(id: extra_datas[:extra_id], open_status: true).first
                end

                next_extra_num_id = @ret[:questExtra].id + 1
                last_extra_num_id = QuestExtra.where(extra_num: @ret[:questExtra].extra_num, open_status: true).last.id

                if next_extra_num_id <= last_extra_num_id
                    @ret[:next_extra_num_id] = next_extra_num_id
                else
                    @ret[:next_extra_num_id] = 0
                end

                @ret[:questMonster] = QuestMonster.find(@ret[:questExtra].quest_monster_id)
                @ret[:questStatus] = QuestStatus.find_by(lv: @ret[:questUser].lv)

                @ret[:answers] = get_bugsquest_quiz_choice(@ret[:questExtra].choice)
                @ret[:tips] = @ret[:questExtra].tips

                # 次のレベルまでの経験値
                @ret[:next_lvup_exp] = next_lvup_exp(1)

            when 'extra_g'
                # ゲスト用のデータをセット
                guest_data_set
                # バトル終了後のリンク
                @ret[:yesno_link] = '/game/bugsquest/extra/0'

                @ret[:questExtra] = QuestExtra.where(id: extra_datas[:extra_id], open_status: true).first
                @ret[:answers] = get_bugsquest_quiz_choice(@ret[:questExtra].choice)
                @ret[:tips] = @ret[:questExtra].tips
        end

        # 各モードの共通処理
        return @ret
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
    def next_lvup_exp(next_plus_num)
        if logged_in?
            questUser = QuestUser.find_by(users_id: current_user.id)
            # 次のレベルまでの経験値
            return QuestStatus.find_by(lv: questUser.lv + next_plus_num).exp - questUser.exp
        end
    end

    # エピソード表示用：到達ステージ
    def arr_arrive_stage(now_stage)
        #questStage = QuestStage.find(now_stage)
        questStage = QuestStage.select(:num, :name, :episode).where(num: 1..now_stage)
    end

    # エピソード表示用：到達ステップ
    def arr_arrive_step(now_stage, now_step)
        questQuiz = QuestQuiz.select(:id, :episode).where(quest_stage_id: now_stage, id: 1..now_step, open_status: true)
    end

    # 公開中の最新エピソード番号
    def open_delivery_episode
        QuestQuiz.select(:id).where(open_status: true).maximum(:id)
    end

    private

    def guest_data_set
        @ret[:questUser].name = 'ゲストユーザー'
        @ret[:questQuiz].id = 0
        @ret[:questStage].num = 0
        @ret[:questStage].name = 'ゲストモード'
        @ret[:questStatus].hp = 5
        @ret[:questStatus].mp = 2
        @ret[:questStatus].power = 3
        @ret[:questStatus].protect = 4
        @ret[:questStatus].speed = 2
        @ret[:questStatus].wise = 3
        @ret[:questStatus].luck = 100

        @ret[:questUser].lv = 0
        @ret[:questUser].exp = 0

        @ret[:questMonster] = QuestMonster.all.sample
        #@ret[:questMonster].name = 'ブラックバグズ'
        #@ret[:questMonster].img_path = '/image/game/bugsquest/monster/1_black_bugs_chan.png'

        @ret[:questQuiz].question = '正しいプログラム言語で敵を倒せ！'
        @ret[:tips] = 'アカウントを作成するとストーリーが楽しめて経験値もためらるぞ❢'

        # 次のレベルまでの経験値
        @ret[:next_lvup_exp] = '＜アカウントを作成すると<br />経験値をためらるぞ❢＞'
    end
end
