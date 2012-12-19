class Club < ActiveRecord::Base
  attr_accessible :founded_at, :name
  
  validate :name, presence: true, uniqueness: true
end
