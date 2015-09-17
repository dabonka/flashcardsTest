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
  @card = Card.new(params[:card])
 
  @card.save
  redirect_to @card
end
    
	
end