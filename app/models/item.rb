class Item < ApplicationRecord
  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  has_many :modifiers

  self.inheritance_column = :type

  validates :type, inclusion: { in: %w(Product Component) }
  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }
end
