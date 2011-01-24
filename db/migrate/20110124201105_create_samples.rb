class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.integer :n
      t.integer :c
      t.decimal :p1, :precision => 8, :scale => 2
      t.decimal :p2, :precision => 8, :scale => 2
      t.decimal :step, :precision => 8, :scale => 2
      t.decimal :aql, :precision => 8, :scale => 2
      t.decimal :ltpd, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
