class Modifier < ApplicationRecord
  belongs_to :modifier_group

  belongs_to :item, foreign_key: 'item_id'
end
