class WordsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def index
  end

  def show
    @words = Word.where(wordlist_id: params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.create(word_params)
      if @word.save
        flash[:success] = '単語を登録しました'
        redirect_to root_url
      else
        @words = current_user.words.order(id: :desc)
        flash.now[:danger] = '登録できませんでした'
        render new_word_path
      end
  end

  def destroy
    
    @word.destroy
    flash[:success] = '単語を削除しました'
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
  end
  
  private
  
  def word_params
    params.require(:word).permit(:content, :meaning, :wordlist_id)
  end
  
  def correct_user
    @word = current_user.words.find_by(id: params[:id])
    unless @word
      redirect_to root_url
    end
  end
  
end
