class StudentVerify < ActiveRecord::Migration
   def self.up
    add_column(:students, :verified, :boolean, :default => false)
  end
  def self.down
    remove_column(:students, :verified)
  end
end
