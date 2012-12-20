class Club < ActiveRecord::Base
  attr_accessible :founded_at, :name
  
  validates :name, presence: true, uniqueness: true
end
