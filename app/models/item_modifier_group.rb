class ItemModifierGroup < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :modifier_group_id, uniqueness: { scope: :item_id, message: "combination already exists" }
end
