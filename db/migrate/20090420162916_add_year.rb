class AddYear < ActiveRecord::Migration
  def self.up
      add_column(:students, :year, :string)
  end

  def self.down
      remove_column(:students, :year)
  end
end
