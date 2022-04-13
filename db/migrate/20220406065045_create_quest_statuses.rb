class CreateQuestStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :quest_statuses do |t|
      t.integer :lv
      t.integer :exp
      t.integer :hp
      t.integer :mp
      t.integer :power
      t.integer :protect
      t.integer :speed
      t.integer :wise
      t.integer :luck

      #t.timestamps

      t.index [ :lv, :exp ], unique: true
      #t.index [ :exp ], unique: true
    end
    #add_index :quest_lvs, [:lv, :exp], unique: true
  end
end
