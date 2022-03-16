class EmailExistValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors.add(attribute, 'が存在していません') if !User.exists?(email: record.email)
    end
end