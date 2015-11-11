class HomeController < ApplicationController
  def index
    @card = Card.select_cards_for_learning
  end

  def compare
    @card = Card.find(params[:card_id])
    if @card.check_translation(params[:user_variant])
      @card.set_review_date
      @card.save!
      flash[:notice] = "Правильно!"
    else
      flash[:error] = "Ошибка!"
    end
   redirect_to "/"
  end
end