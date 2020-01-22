class User < ApplicationRecord
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :wordlists
    has_many :words
    has_many :bookmarks
    has_many :bookwords, through: :bookmarks, source: :word, foreign_key: 'word_id'
    
    def bookmark(word)
        self.bookmarks.find_or_create_by(word_id: word.id)
    end
    
    def unbookmark(word)
        bookmark = self.bookmarks.find_by(word_id: word.id)
        bookmark.destroy if bookmark
    end
    
    def bookwords?(word)
        self.bookwords.include?(word)
    end
    
end
