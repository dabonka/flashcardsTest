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
  @card = Card.new({:original_text => params[:original], :translated_text => params[:translate]})
 
  @card.save
  redirect_to @card
end
    
	
end
