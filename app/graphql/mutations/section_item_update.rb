# frozen_string_literal: true

module Mutations
  class SectionItemUpdate < BaseMutation
    description "Updates a section_item by id"

    field :section_item, Types::SectionItemType, null: false

    argument :id, ID, required: true
    argument :section_item_input, Types::SectionItemInputType, required: true

    def resolve(id:, section_item_input:)
      section_item = ::SectionItem.find(id)
      raise GraphQL::ExecutionError.new "Error updating section_item", extensions: section_item.errors.to_hash unless section_item.update(**section_item_input)

      { section_item: section_item }
    end
  end
end
