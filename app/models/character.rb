class Character < ApplicationRecord
  belongs_to :board
  before_save :char_url

  def char_url
    self.url = "/images/char/#{self.name.downcase}.jpg"
  end
end
