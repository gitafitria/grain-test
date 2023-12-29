Menu.destroy_all
Section.destroy_all
ModifierGroup.destroy_all
Item.destroy_all

# Creating Menu
menu = Menu.create(identifier: 'pizza_menu', label: 'Pizza Menu', state: 'published', start_date: Date.today, end_date: Date.today + 30)

# Creating Sections
classic_pizzas = Section.create(identifier: 'classic_pizzas', label: 'Classic Pizzas', description: 'Traditional Pizza Selection', display_order: 1)
custom_pizzas = Section.create(identifier: 'custom_pizzas', label: 'Custom Pizzas', description: 'Build Your Own Pizza', display_order: 2)

# Associate Sections with Menu
menu.sections << [classic_pizzas, custom_pizzas]

# Creating Items (Product or Component) with descriptive information
pizza = Product.create(type: 'Product', identifier: 'margherita', label: 'Margherita Pizza', description: 'Classic Margherita Pizza', price: 9.99)
cheese = Component.create(type: 'Component', identifier: 'cheese', label: 'Cheese', description: 'Mozzarella Cheese', price: 1.50)
pepperoni = Component.create(type: 'Component', identifier: 'pepperoni', label: 'Pepperoni', description: 'Tasty Pepperoni Slices', price: 2.00)
mushrooms = Component.create(type: 'Component', identifier: 'mushrooms', label: 'Mushrooms', description: 'Fresh Mushroom Slices', price: 1.75)

# Creating ModifierGroup(s)
pizza_size = ModifierGroup.create(identifier: 'pizza_size', label: 'Pizza Size', selection_required_min: 1, selection_required_max: 1)
toppings = ModifierGroup.create(identifier: 'toppings', label: 'Toppings', selection_required_min: 0, selection_required_max: 5)

# Creating Modifier(s) that reference Items
modifier1 = Modifier.create(item: pizza, modifier_group: pizza_size, display_order: 1, default_quantity: 1, price_override: 0.0)
modifier2 = Modifier.create(item: cheese, modifier_group: toppings, display_order: 1, default_quantity: 0, price_override: 0.0)
modifier3 = Modifier.create(item: pepperoni, modifier_group: toppings, display_order: 2, default_quantity: 0, price_override: 0.0)
modifier4 = Modifier.create(item: mushrooms, modifier_group: toppings, display_order: 3, default_quantity: 0, price_override: 0.0)

# Associate Sections with Items
SectionItem.create(section: classic_pizzas, item: pizza, display_order: 1)
SectionItem.create(section: custom_pizzas, item: cheese, display_order: 1)
SectionItem.create(section: custom_pizzas, item: pepperoni, display_order: 2)
SectionItem.create(section: custom_pizzas, item: mushrooms, display_order: 3)