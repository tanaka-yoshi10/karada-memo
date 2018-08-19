class Note < ApplicationRecord
  belongs_to :body
  validates :detail, length: { maximum: 140 }

  after_create :set_noted_at,
               if: ->(note) { note.noted_at.nil? }

  default_scope { order(noted_at: :desc) }

  private

  def set_noted_at
    self.noted_at = self.created_at
  end
end
