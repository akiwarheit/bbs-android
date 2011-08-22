class CreateAffiliations < ActiveRecord::Migration
  def self.up
    create_table :affiliations, :id => false do |t|
      t.integer :user_id
      t.integer :organization_id 

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliations
  end
end
