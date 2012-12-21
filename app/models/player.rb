class Player < ActiveRecord::Base
  POSITIONS = {
    "Offense" => {
      "Deep lying forward" => "SS",
      "Centre forward" => "CF",
      "Winger" => "W"
    },
    "Mid-field" => {
      "Defensive midfielder" => "DM",
      "Central midfielder" => "CM",
      "Side midfielder" => "SM",
      "Attacking midfielder" => "AM"
    },
    "Defense" => {
      "Sweeper" => "SW",
      "Center back" => "CB",
      "Full back" => "FB",
      "Wingback" => "WB"
    },
    "Goal" => {
      "Goal Keeper" => "GK"
    },
  }
  
  attr_accessible :acceleration, :aggression, :balance, :born_at, :first_name, :gender, :last_name, :marking, :number, :position, :profile_image_url, :stamina
  
  belongs_to :club
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }
  
  validates :acceleration, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :aggression, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :marking, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :stamina, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  
  def average
    (acceleration + aggression + balance + marking + stamina).to_f / 5
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def as_json(options = {})
    super(include: :club)
  end
end
