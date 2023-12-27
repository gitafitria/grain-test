class ModifierGroup < ApplicationRecord
  belongs_to :modifiable, polymorphic: true
  has_many :modifiers, dependent: :destroy
end
