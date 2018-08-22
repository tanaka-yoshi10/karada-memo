class User < ApplicationRecord
  belongs_to :family
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, presence: true, length: { maximum: 50 }

  after_initialize :set_new_family,
                   unless: ->(user) { user.family.present? }
  after_destroy :destroy_family!,
                unless: ->(user) { user.family.member? }

  private

  def set_new_family
    self.family = Family.new
  end

  def destroy_family!
    family.destroy!
  end

end
