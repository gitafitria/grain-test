# frozen_string_literal: true

module Mutations
  class SectionCreate < BaseMutation
    description "Creates a new section"

    field :section, Types::SectionType, null: false

    argument :section_input, Types::SectionInputType, required: true

    def resolve(section_input:)
      section = ::Section.new(**section_input)
      raise GraphQL::ExecutionError.new "Error creating section", extensions: section.errors.to_hash unless section.save

      { section: section }
    end
  end
end
