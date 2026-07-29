import HautevilleHouse.ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean.ChemicalReactionNetwork

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure AdmissibleClass where
  object : ChemicalReactionNetwork
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChemicalReactionNetworkAdmitted A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HautevilleHouse
end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean