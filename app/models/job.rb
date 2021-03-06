class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :category
  belongs_to :company
  has_many   :comments

  def self.jobs_by_interest
    group(:level_of_interest).count
  end

  def self.job_count_by_location
    group(:city).count
  end

  def self.location_filter(location)
    where(city: location)
  end
  
  def self.sort_by(sort_params)
    if sort_params == 'interest'
      order('level_of_interest desc')
    else
      order('city asc')
    end
  end
end
