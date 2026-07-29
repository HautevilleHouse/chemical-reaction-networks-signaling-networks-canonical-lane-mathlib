import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure ChemicalReactionNetworkAdmittedObject where
  species : Type u
  reactions : Type v
  network : Type w
  steadyStateExists : Prop
  closureCondition : Prop
  conclusion : closureCondition

def ChemicalReactionNetworkWitnessClosed (O : ChemicalReactionNetworkAdmittedObject) : Prop :=
  O.closureCondition

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse