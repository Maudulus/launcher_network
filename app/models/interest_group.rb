class InterestGroup < ActiveRecord::Base

validates :name, presence: true
validates :creator_id, presence: true
belongs_to :creator, class_name: 'User'
has_many :posts
has_many :memberships
has_many :users, through: :memberships

end
