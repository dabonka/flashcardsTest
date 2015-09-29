class EqualValidator < ActiveModel::Validator
  def validate(card)
  Rails.logger.info "validates"
    if ((card != nil) && (card.original_text != nil) && (card.translated_text != nil)) 
	  if card.original_text.downcase == card.translated_text.downcase
		 translated_text.errors[:base] << "The values of original text and translated text should be different"
	  end
    end
  end
end


class Card < ActiveRecord::Base

def set_review_date
  review_date = DateTime.now + 3.days
  logger.debug "def set_review_date from debug"
  logger.info "def set_review_date from info"
end

  logger.debug "before_validation :set_review_date from debug"
  logger.info "before_validation :set_review_date from info"
  before_validation :set_review_date



  validates :original_text, :translated_text, :review_date, presence: true
  
  validates_with EqualValidator
end






