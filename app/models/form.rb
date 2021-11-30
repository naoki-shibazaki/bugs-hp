class Form
    # 参考
    # https://railsguides.jp/active_model_basics.html
    # https://api.rubyonrails.org/classes/ActiveModel/Validations.html

    #include ActiveModel::Model
    include ActiveModel::Validations

    #要素を定義します
    #attr_accessor :name, :name2
    attr_accessor :form_onamae,
        :form_hurigana,
        :form_email,
        :form_tel,
        :form_message

    #バリデーションの定義
    MaxLength1 = 25
    MaxLength2 = 100
    MaxLength3 = 1000
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/i

    validates :form_onamae,
        presence: true,
        length: { maximum: MaxLength1 }
    #validates :form_hurigana,
    #    presence: true
    validates :form_email,
        presence: true,
        length: { maximum: MaxLength1 },
        format: { with: VALID_EMAIL_REGEX }
    validates :form_tel,
        #presence: true,
        length: { maximum: MaxLength2 }
        #format: { with: VALID_PHONE_REGEX }
    validates :form_message,
        presence: true,
        length: { maximum: MaxLength3 }
    
end