class Section < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :menus, through: :menu_sections
  has_many :section_items, dependent: :destroy
  has_many :items, through: :section_items

  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }
end
