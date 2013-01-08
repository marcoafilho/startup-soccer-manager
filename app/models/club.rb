class Club < ActiveRecord::Base
  attr_accessible :founded_at, :name
  
  has_many :players, order: :last_name
  
  validates :name, presence: true, uniqueness: true
  
  def as_json(options = {})
    super(include: :players)
  end
end
