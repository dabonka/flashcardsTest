class EqualValidator < ActiveModel::Validator
  def validate(card)
    if card.original_text.downcase == card.translated_text.downcase
      translated_text.errors[:base] << "The values of original text and translated text should be different"
    end
  end
end

class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with EqualValidator
end

def set_review_date
  review_date = DateTime.now = 3.days
end