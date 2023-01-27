class Message < ApplicationRecord
  belongs_to :room

  scope :sorted, -> { order(:id) }
  validates :body, presence: true, allow_blank: false
end
