class Movie < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  scope :search_by_title, -> (title) do
    where("title like ?","%#{title}%")
  end

  scope :search_by_director, -> (director) do
    where("director like ?", "%#{director}%")
  end

  scope :search_by_runtime, -> (time) do
    case time
    when "1"
         @movies = Movie.where("runtime_in_minutes < ?", 90) 
    when "2"  
         @movies = Movie.where("runtime_in_minutes between ? and ?", 90, 120) 
    when "3"
         @movies = Movie.where("runtime_in_minutes > ?", 120)  
    end
  end



  def review_average
    return nil if reviews.empty?
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end
