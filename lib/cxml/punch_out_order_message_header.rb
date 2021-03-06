# frozen_string_literal: true

module CXML
  # punchout order message header
  class PunchOutOrderMessageHeader < DocumentNode
    accessible_attributes %i[
      operation_allowed
    ]
    accessible_nodes %i[
      total
      shipping
      tax
      ship_to
    ]

    def operation_allowed
      @operation_allowed || 'create'
    end
  end
end
