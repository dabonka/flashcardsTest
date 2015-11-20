class EqualValidator < ActiveModel::Validator
  def validate(card)
    if card
      if card.original_text.mb_chars.downcase.strip.normalize == card.translated_text.mb_chars.downcase.strip.normalize
           card.errors[:base] << "The values of original text and translated text should be different"
      end
    end
  end
end

class Card < ActiveRecord::Base

  def set_review_date
    self.review_date = Date.current + 3.days
  end

  # scope :select_cards_for_learning, -> { where("review_date <= ?", Time.now).order("RANDOM()").first}
  scope :select_cards_for_learning, -> { where(true).order("RANDOM()").first}

  def check_translation(mytext)
   self.translated_text.mb_chars.downcase.strip == mytext.mb_chars.downcase.strip
  end

  before_validation :set_review_date
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with EqualValidator
  
end