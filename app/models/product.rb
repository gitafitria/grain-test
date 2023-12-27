class Product < Item
  has_many :modifiers, foreign_key: 'item_id'

  has_many :components, class_name: 'Component', foreign_key: 'product_id'

  validates :type, inclusion: { in: ['Product'] }
end
