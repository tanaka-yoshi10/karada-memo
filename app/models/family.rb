class Family < ApplicationRecord
  has_many :members, class_name: 'User', dependent: :destroy
  has_many :bodies, dependent: :destroy

  def member?
    !members.empty?
  end

  def body?
    !bodies.empty?
  end
end
