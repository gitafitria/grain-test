class Product < Item
  has_many :modifiers, foreign_key: 'item_id'

  validates :type, inclusion: { in: ['Product'] }
end
