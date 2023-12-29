class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item

  validates :section_id, uniqueness: { scope: :item_id, message: "combination already exists" }
end
