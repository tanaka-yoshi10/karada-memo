class User < ApplicationRecord
  belongs_to :family
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         invite_for: 24.hours

  validates :nickname, presence: true, length: { maximum: 50 }

  after_initialize :set_new_family,
                   unless: ->(user) { user.family.present? }
  after_destroy :destroy_family!,
                unless: ->(user) { user.family.member? }

  scope :joined_to_family, -> { no_active_invitation }
  scope :invited_to_family, -> { invitation_not_accepted }

  def can_destroy?(other_user)
    family == other_user.family
  end

  private

  def set_new_family
    self.family = Family.new
  end

  def destroy_family!
    family.destroy!
  end

end
