class Membership < ActiveRecord::Base
  belongs_to :interest_group
  belongs_to :user
end
