class StudentPassword < ActiveRecord::Migration
  def self.up
    add_column(:students, :password, :string, :default => "")
  end
 
  def self.down
    remove_column(:students, :password)
  end
end
