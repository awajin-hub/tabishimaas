class Tour < ApplicationRecord
  belongs_to :user
  validates :tourname, presence: true, length: { maximum: 255 }
  validates :place, presence: true, length: { maximum: 255 }
  #validates :date_start, presence: true
  #validates :date_end, presence: true

  
  #validate :date_check
  
  has_many :itineraries
  
  private
  
  def date_check
    if date_end > date_start
      errors.add(:date_end, は開始日と同じまたは後にしてください)
    end
  end

end