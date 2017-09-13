require "rails_helper"

RSpec.describe AccountMailer, type: :mailer do
  describe ".notify" do
    let!(:account) { create(:account) }
    let!(:text) { "Здравствуйте, {{name}}. Ваш баланс: {{balance}}{{currency}}" }
    let(:message) { create(:message, title: "Message1", text: text)}
    let(:mail) { AccountMailer.notify(message, account) }
    let(:body) { message.make(account) }

    it "renders the headers" do
      expect(mail.subject).to eq("Информация")
      expect(mail.to).to eq [account.email]
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.text_part.body.decoded.strip).to match(body)
    end
  end
end
