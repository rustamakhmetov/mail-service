class AccountMailer < ApplicationMailer
  def notify(message, account)
    @body = message.make(account).force_encoding("UTF-8")
    if @body
      mail( to: account.email, subject: "Информация")
    end
  end
end
