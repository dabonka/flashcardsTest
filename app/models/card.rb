class EqualValidator < ActiveModel::Validator
  def validate(card)
    if card
      if card.original_text.downcase == card.translated_text.downcase
          card.errors[:base] << "The values of original text and translated text should be different"
      end
    end
  end
end

class Card < ActiveRecord::Base

  def set_review_date
    self.review_date = DateTime.now + 3.days
  end

  before_validation :set_review_date
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with EqualValidator
  
end