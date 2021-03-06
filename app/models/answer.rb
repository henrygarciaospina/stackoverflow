# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :question

  validates :body, presence: true
end
