class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  validates :menu_id, uniqueness: { scope: :section_id, message: "combination already exists" }
end
