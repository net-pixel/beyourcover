class CardsController < ApplicationController
  before_action :set_cards, only: [:index, :edit]

  require 'payjp'

  def show
    @users = User.all
  end
  
  private

  def set_cards
    @cards = Card.all
  end
end
