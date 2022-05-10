class ChangeColumnUsers2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :corporation, :integer, default: 1, comment: "法人区分：1 -> 個人｜2 -> 個人事業主｜3 -> 法人"
  end
end
