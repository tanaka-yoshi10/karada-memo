class Family < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :members, -> { User.joined_to_family },
           class_name: 'User'
  has_many :invitees, -> { User.invited_to_family },
           class_name: 'User'
  has_many :bodies, dependent: :destroy
  has_many :notes, through: :bodies

  def user?
    users.any?
  end

  def member?
    members.any?
  end

  def invitee?
    invitees.any?
  end

  def body?
    bodies.any?
  end
end
