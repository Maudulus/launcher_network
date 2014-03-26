require 'spec_helper'

describe InterestGroup do
  let(:valid_attrs) { {
    name:'Tom Cruise Fans',
    creator_id: 1
    }}

describe 'validations' do
  context "when given valid attributes" do
    it "is valid" do
      interest_group = InterestGroup.new(valid_attrs)
      expect(interest_group).to be_valid
    end
  end

  it 'requires a name' do
     # Create an InterestGroup using all of the valid attributes except replace
      # the `name` key with a blank String.
    interest_group = InterestGroup.create(valid_attrs.merge(name: ''))
      expect(interest_group.errors[:name]).to include "can't be blank"
    end

    it 'requires a creator id' do
      interest_group = InterestGroup.create(valid_attrs.merge(creator_id: ''))
        expect(interest_group.errors[:creator_id]).to include "can't be blank"
    end

    it 'optionally takes a description' do
      interest_group = InterestGroup.create(valid_attrs.merge(description: ''))
        expect(interest_group).to be_valid
    end
  end




  describe 'instance methods' do
    user = User.create(first_name: "Terrence", last_name: "Willcox", email: "t.willcox@gmail.com")
    group = InterestGroup.create(name: 'Brutus', creator: user)
  #it "creates 10 different group members" do
    (0...9).each do |number|
      Post.create(
        title: number.to_s,
        body: number.to_s,
        user: user,
        interest_group: group
        )
      end

      3.times do Comment.create(
        body:"Gangnam rules spam woot",
        post_id: 1
        )
      end
    2.times do Comment.create(
      body: "This is legendary",
      post_id: 3
      )
    end
      Comment.create(
        body:"beasters",
        post_id: 5
        )

    it 'returns the number of posts in the group' do
      expect(group.post_count).to eq(10)
    end

    it "The top 3 most popular posts (determined by the number of comments)" do
      expect(group.top_posts).to eq(1)
    end

  end
  end


  # describe 'post_count' do
  #   let(:valid_attrs) { {
  #   name:'Tom Cruise Fans',
  #   creator_id: 1
  #   }}
  #     it 'returns 0 if there are no posts' do
  #       interest_group = InterestGroup.new(valid_attrs)
  #       expect(interest_group.post_count).to eq(0)
  #     end
  #   end
