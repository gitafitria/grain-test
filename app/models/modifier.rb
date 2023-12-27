class Modifier < ApplicationRecord
  belongs_to :modifier_group

  belongs_to :item, polymorphic: true
end
