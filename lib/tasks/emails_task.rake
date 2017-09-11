desc 'send email'
task send_email: :environment do
  AccountMailer.notify(Message.first, Account.first).deliver_now
end