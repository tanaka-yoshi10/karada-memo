class Body < ApplicationRecord
  belongs_to :family
  has_many :notes, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 50 },
                       uniqueness: { scope: :family }
end
