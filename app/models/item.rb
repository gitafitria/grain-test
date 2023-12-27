class Item < ApplicationRecord
  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  self.inheritance_column = :type

  validates :type, inclusion: { in: %w(Product Component) }
end
