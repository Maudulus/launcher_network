class Post < ActiveRecord::Base
  belongs_to :interest_group
  belongs_to :user
  has_many :comments
  #has_many :comments
  validates :title, presence: true
  validates :body, presence: true

  def post_count
    Post.count
  end

  # def top_posts
  #   Post.order("comments_count").first(3)
  # end
end
