import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

def ConstrainedReactionNetworkClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_reaction_network_endgame (A : AdmissibleClass) : ConstrainedReactionNetworkClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse