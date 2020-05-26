class VotesController < ApplicationController
  def upvote
    unless @current_user 
      flash[:warning] = "A problem occurred: You must log in to do that"
      redirect_to request.referrer || root_path
      return
    end

    @work = Work.find(params[:id])
    unless @work
      flash[:warning] = "A problem occurred: can't find work"
      redirect_to request.referrer || root_path
      return
    end
    vote = Vote.new
    vote.user = @current_user
    vote.work = @work
    vote.voted_date = DateTime.now

    if vote.save
      flash[:success] = "Successfully upvoted!"
      

    else 
      flash[:warning] = "Unable to upvote!"
      

    end
    redirect_to request.referrer || root_path
  end
end