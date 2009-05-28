class Identity < ActiveRecord::Migration
  def self.up
    create_table :identities do |t|
      t.string :name
      t.integer :student_id
 
      t.timestamps
    end

    remove_column(:students, :verified)
  end
 
  def self.down
    drop_table :identities
    
    add_column(:students, :verified, :boolean, :default => false)
  end
end
