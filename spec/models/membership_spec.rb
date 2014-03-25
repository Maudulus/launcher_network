require 'spec_helper'

describe Membership do
  describe 'associations' do
    let(:user_attributes) {{
      first_name: 'Barry',
      last_name: 'Zuckercorn',
      email: 'barry@hesverygood.com'
    }}

    let(:group_attributes) {{
      name: 'Excuses'
    }}

    it "has many interest_groups" do
      user = User.create(user_attributes)
      interest_group = InterestGroup.create(group_attributes)
      expect(user).to respond_to(:interest_groups)
    end

    it 'has many users' do
      user = User.create(user_attributes)
      interest_group = InterestGroup.create(group_attributes)
      expect(interest_group).to respond_to(:users)
    end
  end
end
