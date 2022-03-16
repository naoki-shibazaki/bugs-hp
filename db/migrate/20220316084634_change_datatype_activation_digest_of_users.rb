class ChangeDatatypeActivationDigestOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :activation_digest, true
  end
end
#rails g migration ChangeDatatypeActivation_digestOfUsers