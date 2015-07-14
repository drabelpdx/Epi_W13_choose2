class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_sorted = Question.sort_by_votes
    @question = Question.new
    @votes = Voting.all
    @vote = Voting.new
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create!(question_params)
    respond_to do |format|
      format.html { redirect_to questions_path() }
      format.js
    # if @question.save
    #   # current_user.question.push(@question)
    #   flash[:notice] = "Your question has been posted."
    #   redirect_to questions_path()
    # else
    #   render :new
    end
end

  def show
    @questions = Question.all
    @question = Question.find(params[:id])
    @votes_a = @question.show_votes_a
  end

def upvote
  @question = Question.find params[:id]
  current_user.upvote(@question)
  flash[:message] = 'Thanks for voting!'
  redirect_to questions_path()
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to questions_path()
end

def downvote
  @question = Question.find params[:id]
  current_user.downvote(@question)
  flash[:message] = 'Thanks for voting!'
  redirect_to question_path(@question)
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to question_path(@question)
end

  private

  def question_params
    params.require(:question).permit(:option_a, :option_b)
  end
end
