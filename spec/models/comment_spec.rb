require 'spec_helper'

describe Comment do

  describe "Validations" do

    comment_attrs = {
      body: "Best comment of all time!"
    }

    new_comment = Comment.new(comment_attrs)

    it "comment should be valid" do
      expect(new_comment).to be_valid
    end

    it "should have a body field populated" do
      second_comment = Comment.create(comment_attrs.merge(body: ''))
      expect(second_comment.errors[:body]).to include("can't be blank")
    end
  end
  describe "Associations" do
    comment_attrs2 = {
      body: "Best comment of all time!"
    }

    user_attrs = {
      first_name: "Forest",
      last_name: "Gump",
      role: "ee",
      email: "john@gmail.com"
    }

    user =User.create(user_attrs)

    post_attrs = {
    title: "Welcome to the jungle",
    body: "We've got fun and games"
    }

    post = Post.create(post_attrs)

    new_comment2 = Comment.create(comment_attrs2.merge({user: user, post: post}))

    it "belongs to one user" do
      expect(new_comment2).to respond_to(:user)
      expect(new_comment2.user).to eq(user)
    end

    it "belongs to one post" do
      expect(new_comment2).to respond_to(:post)
      expect(new_comment2.post).to eq(post)
    end

    # it "belongs to one group" do
    #       expect(post).to respond_to(:user)
    #       expect(post.user).to eq(user)
    #     end
  end
end
