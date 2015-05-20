class Category < ActiveRecord::Base
  has_many :videos, -> { order(created: :desc) }
  validates :title, presence: true
end