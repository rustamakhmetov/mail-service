class Account < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true

  before_validation :downcase_email

  private

  def downcase_email
    email.downcase! if email
  end
end
