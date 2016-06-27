class HomeController < ApplicationController
  def index
    @card = current_user.cards.first unless current_user.nil?
   end

  def compare
    @card = Card.find(params[:card_id])
    if @card.check_translation(params[:user_variant])
      @card.set_review_date
      @card.save!
      flash[:notice] = true
    else
      flash[:error] = true
    end
    redirect_to '/'
  end
end
