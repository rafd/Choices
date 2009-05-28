class StudentCounterCache < ActiveRecord::Migration
  def self.up
    add_column(:options, :students_count, :integer, :default => 0)
  end

  def self.down
    remove_column(:options, :students_count)
  end
end
