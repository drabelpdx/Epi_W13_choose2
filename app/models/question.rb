class Question < ActiveRecord::Base
  validates_presence_of :option_a
  validates_presence_of :option_b

  has_many :votings, as: :voteable

  def show_votes_a
    upvotes = self.votings.where("up_vote = true").length
    return upvotes
  end

  def show_votes_b
    upvotes = self.votings.where("up_vote = false").length
    return upvotes
  end

  def self.sort_by_votes
    all.sort_by { |question| -question.vote_count }
  end

  def vote_count
    self.votings.length
  end

end
