# frozen_string_literal: true

module Mutations
  class SectionItemDelete < BaseMutation
    description "Deletes a section_item by ID"

    field :section_item, Types::SectionItemType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      section_item = ::SectionItem.find(id)
      raise GraphQL::ExecutionError.new "Error deleting section_item", extensions: section_item.errors.to_hash unless section_item.destroy!

      { section_item: section_item }
    end
  end
end
