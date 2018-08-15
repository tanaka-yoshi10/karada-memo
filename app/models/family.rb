class Family < ApplicationRecord
  has_many :members, class_name: 'User', dependent: :destroy

  def member?
    !members.empty?
  end
end
