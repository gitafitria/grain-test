# frozen_string_literal: true

module Mutations
  class SectionDelete < BaseMutation
    description "Deletes a section by ID"

    field :section, Types::SectionType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      section = ::Section.find(id)
      raise GraphQL::ExecutionError.new "Error deleting section", extensions: section.errors.to_hash unless section.destroy!

      { section: section }
    end
  end
end
