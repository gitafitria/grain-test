# frozen_string_literal: true

module Mutations
  class MenuUpdate < BaseMutation
    description "Updates a menu by id"

    field :menu, Types::MenuType, null: false

    argument :id, ID, required: true
    argument :menu_input, Types::MenuInputType, required: true

    def resolve(id:, menu_input:)
      menu = ::Menu.find(id)
      raise GraphQL::ExecutionError.new "Error updating menu", extensions: menu.errors.to_hash unless menu.update(**menu_input)

      { menu: menu }
    end
  end
end
