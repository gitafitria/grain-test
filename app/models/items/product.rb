class Product < Item
  has_many :modifier_groups, as: :modifiable, dependent: :destroy
  has_many :modifiers, through: :modifier_groups

  validates :type, inclusion: { in: ['Product'] }
end
