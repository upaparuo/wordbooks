class BookmarksController < ApplicationController
  
  
  
  def create
    word = Word.find(params[:word_id])
    current_user.bookmark(word)
    flash[:success] = 'ブックマークしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    word = Word.find(params[:word_id])
    current_user.unbookmark(word)
    flash[:success] = 'ブックマークを解除しました'
    redirect_back(fallback_location: root_path)
  end
end
