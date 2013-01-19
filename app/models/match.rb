class Match < ActiveRecord::Base
  belongs_to :host, class_name: "Club"
  belongs_to :guest, class_name: "Club"

  attr_accessible :guest, :guest_id, :guest_score, :host, :host_id, :host_score, :location, :played_at
  
  def as_json(options = {})
    super(include: [:host, :guest])
  end
end
