class ToppagesController < ApplicationController
  def index
    @wordlists = current_user.wordlists.order(id: :desc)
  end
end
