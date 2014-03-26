class InterestGroup < ActiveRecord::Base

  validates :name, presence: true
  validates :creator_id, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :posts
  has_many :memberships
  has_many :users, through: :memberships


  def post_count
    Post.where(interest_group: self).count
  end

  def top_posts
    Post.order("comments_count").first(3)
  end

end
