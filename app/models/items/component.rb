class Component < Item
  belongs_to :product, class_name: 'Product'

  validates :type, inclusion: { in: ['Component'] }
end
