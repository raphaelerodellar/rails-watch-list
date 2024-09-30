class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
end
