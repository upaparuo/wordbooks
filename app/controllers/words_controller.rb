class WordsController < ApplicationController
  def index
    @words = Word.where(word_id:self.id)
  end

  def show
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
  end

  def edit
  end

  def update
  end
  
  private
  
  def word_params
    params.require(:word).permit(:content, :meaning, :wordlist_id)
  end
end
