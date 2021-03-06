# frozen_string_literal: true

# The CredentialMac element is used for the Message Authentication Code (MAC)
# authentication method. This authentication method is used in situations where the
# sender must prove to the receiver that it has been authenticated by shared secret by a
# trusted third party. For example, a direct PunchOut request can travel directly from a
# buyer to a supplier without going through a network commerce hub, because it
# contains a MAC (generated by the network commerce hub) that allows the supplier to
# authenticate it.
# The trusted third party computes the MAC and transfers it to the sender through the
# Profile transaction. The MAC is opaque to the sender (it is secure and non-reversible).
# To see how the MAC is transmitted from the trusted third party to the sender, see
# "ProfileResponse" on page 63.
#
# Page 45 cXML reference

module CXML
  class CredentialMac < DocumentNode
    accessible_attributes %i[
      type
      algorithm
      creation_date
      expiration_date
    ]
  end
end
