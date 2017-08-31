class Score < ApplicationRecord
  belongs_to :board
  before_save :to_guest
  validates :score, presence: true
  validates :board_id, presence: true

  def to_guest
    self.player = "--" if self.player.nil? or self.player.blank?
  end
end
