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


end
