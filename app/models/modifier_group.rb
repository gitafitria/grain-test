class ModifierGroup < ApplicationRecord
  has_many :modifiers, dependent: :destroy
end
