class Club < ActiveRecord::Base
  attr_accessible :founded_at, :name, :club_image_url
  
  has_many :players, order: :last_name
  has_many :host_matches, foreign_key: :host_id
  has_many :guest_matches, foreign_key: :guest_id
  
  validates :name, presence: true, uniqueness: true
  
  def matches
    host_matches + guest_matches
  end
    
  def as_json(options = {})
    super(include: :players)
  end
end
