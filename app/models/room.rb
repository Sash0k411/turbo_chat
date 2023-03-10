class Room < ApplicationRecord
  has_many :messages, -> { sorted }, dependent: :destroy
  validates :title, presence: true, allow_blank: false

  def channel_id
    "room_#{id}_messages"
  end
end
