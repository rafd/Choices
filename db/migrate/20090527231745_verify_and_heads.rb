class VerifyAndHeads < ActiveRecord::Migration
  def self.up
    drop_table :identities
    
    add_column(:students, :verified, :boolean, :default => false)
    add_column(:students, :special, :boolean, :default => false)
  end

  def self.down 
    create_table :identities do |t|
      t.string :name
      t.integer :student_id
 
      t.timestamps
    end

    remove_column(:students, :verified)
    remove_column(:students, :special)
  end
end
