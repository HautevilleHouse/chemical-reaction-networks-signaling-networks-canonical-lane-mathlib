import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure PathwayStructure where
  species : Type u
  reactions : Type v
  rateConstants : Type w
  stoichiometricMatrix : species -> reactions -> ℤ
  incidenceLaw : Prop
  reactionRates : reactions -> ℝ
  fluxBalance : ∀ r : reactions, reactionRates r = 0 → rateConstants r = 0
  incidenceLawTerm : incidenceLaw

def PathwayStructureClosed (P : PathwayStructure) : Prop :=
  P.incidenceLaw ∧ (∀ r : P.reactions, r = r)

theorem pathway_structure_closed (P : PathwayStructure) : PathwayStructureClosed P := by
  exact And.intro P.incidenceLawTerm (fun r => rfl)

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse