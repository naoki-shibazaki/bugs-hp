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
    # validates :content, {presence: true, length: {maximum: 140}}
    validates :form_onamae,
        presence: true
    validates :form_hurigana,
        presence: true
    validates :form_email,
        presence: true
    validates :form_tel,
        presence: true
    validates :form_message,
        presence: true
    
end