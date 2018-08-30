class Note < ApplicationRecord
  DETAIL_LENGTH_MAXIMUM = 1000

  belongs_to :body
  validates :detail, length: { maximum: DETAIL_LENGTH_MAXIMUM }
  validates :noted_at, presence: true

  after_initialize :set_default_noted_at,
                   unless: ->(note) { note.noted_at.present? }

  default_scope { order(noted_at: :desc) }

  scope :noted_in, ->(year) do
    return if year.blank?
    date = Time.zone.local(year)
    where(noted_at: (date.beginning_of_year..date.end_of_year))
  end

  scope :latest, ->(count) do
    first(count)
  end

  private

  def set_default_noted_at
    self.noted_at = Time.current
  end
end
