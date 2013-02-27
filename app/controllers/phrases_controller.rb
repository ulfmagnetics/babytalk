class PhrasesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @phrase = current_user.phrases.build(params[:phrase])
    if !@phrase.save
      flash[:error] = "Error dudes."
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end
end
