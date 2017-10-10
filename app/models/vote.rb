# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  voteable_id   :integer
#  voteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end
