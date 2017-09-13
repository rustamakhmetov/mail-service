require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should validate_presence_of :email}
  it { should validate_uniqueness_of(:email).case_insensitive}
  it { should validate_presence_of :name}

  describe "#email" do
    describe "with valid attributes" do
      it "account saved to database" do
        expect{Account.create(email:"info@yandex.ru.com", name: "New name")}.
            to change(Account, :count).by(1)
      end
    end
    describe "with invalid attributes" do
      subject { Account.create(email:"info@yandexru", name: "New name") }

      it "account not saved to database" do
        expect{subject}.to_not change(Account, :count)
      end

      it "returns error message" do
        expect(subject.errors.full_messages).to eq ["Email is invalid"]
      end
    end
  end
end
