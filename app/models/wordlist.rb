class Wordlist < ApplicationRecord
  belongs_to :user
  has_many :words
  validates :name, presence: true, length: { maximum: 50 }
end
