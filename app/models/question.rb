# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def voted_by?(user)
    votes.exists?(user_id: user_id)
  end

end
