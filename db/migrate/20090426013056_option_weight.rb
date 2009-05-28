class OptionWeight < ActiveRecord::Migration
  def self.up
    add_column(:options, :weight, :integer, :default => 0)
  end

  def self.down
    remove_column(:options, :weight)
  end
end
