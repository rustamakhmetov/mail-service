class Message < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true
end
