class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  validates :state, inclusion: { in: %w(published draft) }
  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }

  scope :published, -> { where(:state => "published")}
  scope :draft, -> { where(:state => "draft")}
end
