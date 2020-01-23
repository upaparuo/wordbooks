class WordlistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @wordlists = Wordlist.order(id: :desc)
  end
  
  def new
    @wordlist = Wordlist.new
  end

  def create
    @wordlist = current_user.wordlists.build(wordlist_params)
    if @wordlist.save
      flash[:success] = '単語帳を作成しました'
      redirect_to root_url
    else
      @wordlists = current_user.wordlists.order(id: :desc)
      flash.now[:danger] = '作成できませんでした'
      render @new
    end
  end

  def destroy
    @wordlist.destroy
    flash[:success] = '単語帳を削除しました'
    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def edit
    @wordlist = Wordlist.find(params[:id])
  end
  
  private
  
  def wordlist_params
    params.require(:wordlist).permit(:name)
  end
  
  def correct_user
    @wordlist = current_user.wordlists.find_by(id: params[:id])
    unless @wordlist 
      redirect_to root_url
    end
  end
  
end
