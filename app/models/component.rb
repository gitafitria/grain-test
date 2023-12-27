class Component < Item
  belongs_to :product, class_name: 'Product', foreign_key: 'product_id'
  attribute :product_id, :integer

  validates :type, inclusion: { in: ['Component'] }
end
