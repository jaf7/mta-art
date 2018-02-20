class Artist < ActiveRecord::Base

  has_many :artworks

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
