class HomeController < ApplicationController
  def index
     if current_user != nil
      # @card = Card.select_cards_for_learning(current_user.id).first
       @card = current_user.cards.first
     end
   end

  def compare
    @card = Card.find(params[:card_id])
    if @card.check_translation(params[:user_variant])
      @card.set_review_date
      @card.save!
      # flash[:notice] = "Правильно!"
      flash[:notice] = true
    else
      flash[:error] = true
    end
   redirect_to "/"
  end
end
