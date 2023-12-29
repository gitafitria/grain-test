class ModifierGroup < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  validates :identifier, format: { with: /\A[a-z0-9_]+\z/, message: "should be in snake_case" }
end
