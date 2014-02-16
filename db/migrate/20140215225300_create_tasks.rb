class CreateTasks < ActiveRecord::Migration

  def self.up
    create_table :tasks do |t|
      t.string :content , null: false
      t.integer :complete, default: 0
    end
  end

  def self.down
    drop_table :tasks
  end
  
end