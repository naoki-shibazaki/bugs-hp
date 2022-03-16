class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, :null => false, limit: 255, comment: 'ユーザー名'
      t.string :email, :null => false, limit: 255, comment: 'メールアドレス'
      t.string :password_digest, :null => false, comment: '暗号化・bcrypt「gem bcrypt」使用)'
      t.string :activation_digest, :null => false, comment: '暗号化・bcrypt「gem bcrypt」使用)'
      t.boolean :activated, :default => false, :null => false, comment: 'アカウントアクティベート'
      t.timestamp :activated_at
      t.string :reset_digest, comment: 'パスワードリマインダー'
      t.timestamp :reset_sent_at
      t.boolean :acount_lock, :default => false, :null => false, comment: 'アカウントロック'

      t.timestamps
    end
    add_index :users, [:email], unique: true
  end
end
