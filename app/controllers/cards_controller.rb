class CardsController < ApplicationController
  before_action :set_cards, only: [:index, :edit]

  require 'payjp'

  def index
    @users = User.all
  end
  
end
