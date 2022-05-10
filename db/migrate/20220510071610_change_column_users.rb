class ChangeColumnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :corporation
    #change_column :users, :corporation, :integer, comment: "法人区分：0 -> 個人｜1 -> 個人事業主｜2 -> 法人"
  end
end