class Cat < ActiveRecord::Base
  COLORS = %w(black white orange)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color"}
  validates :sex, inclusion: {in: %w(M F), message: "%{value} is not one of the options"}
  has_many :cat_rental_requests, :dependent => :destroy
end
