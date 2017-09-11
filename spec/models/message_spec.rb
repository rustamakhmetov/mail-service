require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :title}
  it { should validate_uniqueness_of(:title)}
  it { should validate_presence_of :text}

  describe "#make" do
    let!(:account) { create(:account) }
    let(:message) { Message.new(title: "Message1", text: text)}

    describe "with valid attributes" do
      let!(:text) { "Здравствуйте, {{name}}. Ваш баланс: {{balance}}{{currency}}" }
      let!(:body) { message.make(account) }

      it "fill attributes in message" do
        %w{name balance currency}.each do |attr|
          expect(body).to match(account.try(attr.to_sym).to_s)
        end
      end

      it "is valid object" do
        expect(message).to be_valid
      end
    end

    describe "with invalid attributes" do
      let!(:text) { "Здравствуйте, {{name1}}. Ваш баланс: {{balance}}{{currency1}}" }
      subject { message.make(account) }

      it "returns nil" do
        expect(subject).to eq nil
      end

      it "returns errors" do
        subject
        expect(message.errors.full_messages).to match_array(["Name1 not exists", "Currency1 not exists"])
      end
    end
  end
end
