# frozen_string_literal: true

module Mutations
  class SectionItemCreate < BaseMutation
    description "Creates a new section_item"

    field :section_item, Types::SectionItemType, null: false

    argument :section_item_input, Types::SectionItemInputType, required: true

    def resolve(section_item_input:)
      section_item = ::SectionItem.new(**section_item_input)
      raise GraphQL::ExecutionError.new "Error creating section_item", extensions: section_item.errors.to_hash unless section_item.save

      { section_item: section_item }
    end
  end
end
