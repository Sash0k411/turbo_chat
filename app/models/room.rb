class Room < ApplicationRecord
  has_many :messages, -> { sorted }, dependent: :destroy
  before_create { self.title = SecureRandom.hex(3) }
end
