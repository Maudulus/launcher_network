require 'spec_helper'

describe User do

  let(:valid_attrs) {{
    first_name: 'Barry',
    last_name: 'Zuckercorn',
    email: 'barry@hesverygood.com',
    role: 'EE',
    fun_fact: 'has a pet tortoise'
    }}


  describe 'validations' do

    context "when given valid attributes" do
      it "is valid, that being the entire user model " do
        user = User.new(valid_attrs)
        expect(user).to be_valid
      end
    end



   it "requires a first_name" do
    user = User.create(valid_attrs.merge(first_name: ''))
    expect(user.errors[:first_name]).to include("can't be blank")
  end

    it "requires a last_name" do
      user = User.create(valid_attrs.merge(last_name: ''))
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "requires an email" do
      user = User.create(valid_attrs.merge(email: ''))
      expect(user.errors[:email]).to include("can't be blank")
    end


  end
end
