class Player < ActiveRecord::Base
  POSITIONS = {
    "GK" => "Goal Keeper",
    "SW" => "Sweeper",
    "CB" => "Center back",
    "FB" => "Full back",
    "WB" => "Wingback",
    "DM" => "Defensive midfielder",
    "CM" => "Central midfielder",
    "SM" => "Side midfielder",
    "AM" => "Attacking midfielder",
    "SS" => "Deep lying forward",
    "CF" => "Centre forward",
    "W"  => "Winger"
  }
  
  attr_accessible :acceleration, :aggression, :balance, :born_at, :first_name, :gender, :last_name, :marking, :number, :position, :stamina
  
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
end
