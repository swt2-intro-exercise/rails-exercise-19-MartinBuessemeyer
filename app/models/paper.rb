class Paper < ApplicationRecord
  has_and_belongs_to_many :authors
  validates :title, presence: true, length: {minimum: 1}
  validates :venue, presence: true, length: {minimum: 1}
  validates :year, presence: true, numericality: { only_integer: true }
  scope :in_year, -> (year){ where("year == ?", year)}
end
