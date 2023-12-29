class Item < ApplicationRecord
  has_many :section_items, dependent: :destroy
  has_many :sections, through: :section_items
  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  has_many :modifiers, dependent: :destroy

  self.inheritance_column = :type

  validates :type, uniqueness: { scope: :identifier, message: "combination already exists" }
  validates :type, inclusion: { in: %w(Product Component) }
  validates :label, presence: true
  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }

  scope :products, -> { where(:type => "Product")}
  scope :components, -> { where(:type => "Component")}
end
