class User < ActiveRecord::Base
ROLES = %w(ee launcher)
validates :first_name, presence: true
validates :last_name, presence: true
validates :role, inclusion: {in: ROLES}, presence: true
validates :email, presence: true, format: {with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/}
has_many :memberships
has_many :interest_groups, through: :memberships
has_many :posts
end
