class Word < ApplicationRecord
  belongs_to :wordlist
  belongs_to :user
  validates :content, presence: true, length: { maximum: 250 }
  validates :meaning, presence: true, length: { maximum: 250 }
end
