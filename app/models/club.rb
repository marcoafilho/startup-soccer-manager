class Club < ActiveRecord::Base
  attr_accessible :founded_at, :name
  
  has_many :players
  
  validates :name, presence: true, uniqueness: true
  
  def as_json(options = {})
    super(include: :players)
  end
end
