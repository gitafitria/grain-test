class Modifier < ApplicationRecord
  default_scope { order(display_order: :asc) }

  belongs_to :modifier_group
  belongs_to :item, foreign_key: 'item_id', dependent: :destroy

  validates :item_id, uniqueness: { scope: :modifier_group_id, message: "combination already exists" }

  after_create :createItemModiferGroup

  def createItemModiferGroup
    ItemModifierGroup.create(item_id: self.item_id, modifier_group_id: self.modifier_group_id)
  end
end
