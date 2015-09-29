class CardsController < ApplicationController

    def index
      @cards = Card.all
    end
  
	def show
	  @card = Card.find(params[:id])
	end
  
	def new
  logger.debug "def new from debug"
  logger.info "def new from info"
	  @card = Card.new
	end
  
	def create
  logger.debug "def create from debug"
  logger.info "def create from info"
	  @card = Card.new(cards_params)
	 
	  @card.save!
	  redirect_to @card
	end

  private
    

	def cards_params
  logger.debug "def cards_params from debug"
  logger.info "def cards_params from info"
	  params.require(:card).permit(:original_text, :translated_text, :review_date)
	end
	
end
