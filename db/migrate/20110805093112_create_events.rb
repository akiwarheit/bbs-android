class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :organization_id, :null => false
      t.string :what, :null => false
      t.date :when, :null => false
      t.string :where, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
