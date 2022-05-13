class ChangeColumnUsers3 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :corporation, default: 0
  end
end
