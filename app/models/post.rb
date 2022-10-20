class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length:{minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion:{in:%w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        if title
            puts title
            ["Won't Believe", "Secret", "Top", "Guess"].each do |str|
                if !title.include?(str)
                    errors.add(:title, "Not clickbait-y enough")
                else
                    break
                end
            end
        end
    end
end
