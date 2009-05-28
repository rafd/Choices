class OptionsType < ActiveRecord::Migration
  def self.up
     add_column(:options, :option_type, :integer, :default => 0)
  end

  def self.down
    remove_column(:options, :option_type)
  end
end
