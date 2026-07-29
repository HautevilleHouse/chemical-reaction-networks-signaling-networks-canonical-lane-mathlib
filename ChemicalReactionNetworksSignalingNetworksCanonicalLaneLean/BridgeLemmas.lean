import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

open HautevilleHouse.ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChemicalReactionNetworkWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse