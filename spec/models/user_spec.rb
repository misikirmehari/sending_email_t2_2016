require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }

  it { is_expected.to have_many(:cars) }

  it { is_expected.to have_db_column(:verified_email).with_options(defult: false) }

  it { is_expected.to have_db_column(:token).with_options(default: '') }

  describe "#needs_verification!" do
    let(:user) { FactoryGirl.create(:user, token: '', verified_email: true) }

    it "sets the verified email address field as false" do

      # expect(user.verified_email?).to be_true
      # user.needs_verification!
      # expect(user.verified_email?).to be_false

      expect { user.needs_verification! }.to change(
        user, :verified_email?).from(true).to(false)
    end

    it "sets the token for the user" do
      expect { user.needs_verification! }.to change(user, :token)
    end

    it "sends a verification email" do
      expect { user.needs_verification! }.to change(
        ActionMailer::Base.deliveries, :count).by(1)
    end
  end
end
