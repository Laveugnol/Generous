class Order < ApplicationRecord
  monetize :amount_cents
  mount_uploader :photo, PhotoUploader
  before_validation :strip_whitespace
  validates :player_sku, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :amount_cents, :numericality => { :greater_than => 0 }, presence: true

  validates :email, presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
            message: "invalid email" }
  validates :photo, presence: true

private

  def strip_whitespace
    self.email = email.strip unless email.nil?
  end


end


