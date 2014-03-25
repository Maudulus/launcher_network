require 'spec_helper'

describe Post do
  let(:valid_attrs) {{
    title: "Welcome to the jungle",
    body: "We've got fun and games"

    }}

    describe 'validations' do
      context "when given valid attributes" do
        it "is valid" do
          post = Post.new(valid_attrs)
          expect(post).to be_valid
        end
      end

      it "has a field 'title' populated" do
        post = Post.create(valid_attrs.merge(title: ""))
        expect(post.errors[:title]).to include("can't be blank")
      end

      it "has a field 'body' populated" do
        post = Post.create(valid_attrs.merge(body: ""))
        expect(post.errors[:body]).to include("can't be blank")
      end

describe 'associations' do

        user_attrs = {
          first_name: "Forest",
          last_name: "Gump",
          role: "ee",
          email: "john@gmail.com"
        }

        user =User.create(user_attrs)

        group_attrs = {
          name: "Fairies",
          creator: user
        }

        groupies = InterestGroup.create(group_attrs)

        post_attrs = {
          title: "Jungle",
          body: "We've got fun and games",

        }

        post = Post.new(post_attrs.merge({user: user,interest_group: groupies}))


        it "has one group and includes interest group " do
          expect(post).to respond_to(:interest_group)
          expect(post.interest_group).to eq(groupies)
         # expect(post.interest_group).to include(:interest_group_id)
          # why wouldn't this work?
        end

        it "belongs to one group" do
          expect(post).to respond_to(:user)
          expect(post.user).to eq(user)
        end

end
end
end


