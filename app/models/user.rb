class User < ApplicationRecord
  belongs_to :family
  after_initialize :set_new_family,
                   if: ->(user) { user.family.nil? }
  after_destroy :destroy_family!,
                unless: ->(user) { user.family.member? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def set_new_family
    self.family = Family.new
  end

  def destroy_family!
    family.destroy!
  end

end
