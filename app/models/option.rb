class Option < ActiveRecord::Base
    has_many :students, :order => 'special ASC, name ASC'
end
