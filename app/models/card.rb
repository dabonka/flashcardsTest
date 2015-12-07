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
  belongs_to :user

  def set_review_date
    self.review_date = Date.current + 3.days
  end

  scope :select_cards_for_learning, -> (u) { where("review_date <= ? AND user_id = ?", Time.now, u).order("RANDOM()")}
  scope :select_cards_by_user_id, -> (u) { where("user_id = ?", u)}

  def check_translation(mytext)
   self.translated_text.mb_chars.downcase.strip == mytext.mb_chars.downcase.strip
  end

  before_validation :set_review_date
  validates :original_text, :translated_text, :review_date, :user_id, presence: true
  validates_with EqualValidator
  
end