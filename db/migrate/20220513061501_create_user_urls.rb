class CreateUserUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :user_urls do |t|
      #t.integer :users_id
      t.references :users, :null => false, foreign_key: true, index: {unique: true}
      t.string :web_url1, limit: 255
      t.string :web_url2, limit: 255
      t.string :web_url3, limit: 255
      t.string :twitter_url, limit: 255
      t.string :facebook_url, limit: 255
      t.string :instagram_url, limit: 255
      t.string :youtube_url, limit: 255
      t.string :tiktok_url, limit: 255

      t.timestamps
    end
  end
end
