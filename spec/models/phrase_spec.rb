require 'spec_helper'

describe Phrase do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @phrase = user.phrases.build(content: 'Oh no, eggys!')
  end

  subject { @phrase }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "must have a user_id" do
    before { @phrase.user_id = nil }
    it { should_not be_valid }
  end

  pending "must have content"

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect { Phrase.new(user_id: user.id) }.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
