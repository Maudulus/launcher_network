class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :interest_group#, counter_cache: true
  validates :body, presence: true
end
