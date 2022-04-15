class QuestUser < ApplicationRecord
    attr_accessor :change_token

    def create_token_digest
        self.change_token = QuestUser.new_token
        update_attribute(:change_token_digest, QuestUser.digest(change_token))
    end

    # トークンがダイジェストと一致したらtrueを返す
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    private

    # ランダムなトークンを返す
    def QuestUser.new_token
        SecureRandom.urlsafe_base64
    end

    # 渡された文字列のハッシュ値を返す
    def QuestUser.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
