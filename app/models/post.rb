class Post < ApplicationRecord
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    
    validate :title_is_clickbait

    def title_is_clickbait
        if title
            unless title.match?(/Won't Believe/) || title.match?(/Secret/) || title.match?(/Top\s\d+/) || title.match?(/Guess/)
                errors.add(:title, 'Title needs more clickbait')
            end
        end
    end
end

