class CardsController < ApplicationController

    def index
      @cards = Card.all
    end
  
	def show
	  @card = Card.find(params[:id])
	end
  
	def new
	logger.debug "def new"
	  @card = Card.new
	end
  
	def create
	   logger.debug "def create"
	  @card = Card.new(cards_params)
	 
	  @card.save!
	  redirect_to @card
	end

  private
    

	def cards_params
	logger.info "cards_params"
	  params.require(:card).permit(:original_text, :translated_text, :review_date)
	end
	
end
