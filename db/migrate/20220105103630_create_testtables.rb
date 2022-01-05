class CreateTesttables < ActiveRecord::Migration[6.1]
  def change
    create_table :testtables do |t|
      t.integer :test_num
      t.string :test_str

      t.timestamps
    end
  end
end
