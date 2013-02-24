require 'spec_helper'

describe Phrase do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @phrase = Phrase.new(content: 'Oh no, eggys!', user_id: user.id)
  end

  subject { @phrase }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "must have a user_id" do
    before { @phrase.user_id = nil }
    it { should_not be_valid }
  end
end
