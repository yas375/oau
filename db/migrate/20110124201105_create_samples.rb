class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.integer :n
      t.integer :c
      t.decimal :p1
      t.decimal :p2
      t.decimal :step
      t.decimal :aql
      t.decimal :ltpd
      t.timestamps
    end
  end
  
  def self.down
    drop_table :samples
  end
end
