class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :acount_plan, :integer, default: 1, null: false, comment: "0 -> 管理者｜1 -> 無料プラン｜2 -> 有料プラン"
    add_column :users, :corporation, :bool, default: false, null: false, comment: "法人区分"
    add_column :users, :corporation_name, :string, comment: "法人名"
  end
end
