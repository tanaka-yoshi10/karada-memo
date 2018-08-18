class Body < ApplicationRecord
  belongs_to :family
  validates :nickname, presence: true, length: { maximum: 50 },
                       uniqueness: { scope: :family }
end
