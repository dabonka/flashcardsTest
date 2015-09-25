class CardsController < ApplicationController

    def index
      @cards = Card.all
    end
  
	def show
	  @card = Card.find(params[:id])
	end
  
	def new
	  @card = Card.new
	end
  
	def create
	  @card = Card.new(strong_params)
	 
	  @card.save
	  redirect_to @card
	end
    
	def set_review_date
	  review_date = DateTime.now + 3.days
	end

	def strong_params
	  params.require(:@card).permit(:original_text, :translated_text, :review_date)
	end
	
end
