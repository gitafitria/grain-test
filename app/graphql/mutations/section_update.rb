# frozen_string_literal: true

module Mutations
  class SectionUpdate < BaseMutation
    description "Updates a section by id"

    field :section, Types::SectionType, null: false

    argument :id, ID, required: true
    argument :section_input, Types::SectionInputType, required: true

    def resolve(id:, section_input:)
      section = ::Section.find(id)
      raise GraphQL::ExecutionError.new "Error updating section", extensions: section.errors.to_hash unless section.update(**section_input)

      { section: section }
    end
  end
end
