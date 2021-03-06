class VotingsController < ApplicationController
  # def new
  #   @question = Question.find(params[:id])
  #   @vote = Voting.new
  # end

  def create
    @question = Question.find(params[:question_id])
    @vote = Voting.new(voting_params)
    # current_user.questions << @vote
    @question.votings.push(@vote)
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    #   # binding.pry
    # if @vote.save
    #   # current_user.questions << @vote
    #   @question.votings.push(@vote)
    #   @question.save
    #   flash[:notification] = "Voted successfully"
    #   redirect_to questions_path
    # else
    #   flash[:alert] = "Nope."
    #   redirect_to :back
    end
  end

  private

  def voting_params
    params.require(:voting).permit(:voteable_id, :up_vote)
  end

end
