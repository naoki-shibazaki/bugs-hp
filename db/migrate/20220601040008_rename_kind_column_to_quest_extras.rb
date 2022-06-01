class RenameKindColumnToQuestExtras < ActiveRecord::Migration[6.1]
  def change
    rename_column :quest_extras, :kind, :category
  end
end
