class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  validates :state, inclusion: { in: %w(published draft) }

  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }
end
