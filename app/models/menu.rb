class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  scope :published, -> { where(:state => "published")}
  scope :draft, -> { where(:state => "draft")}

  validates :state, inclusion: { in: %w(published draft) }
  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
