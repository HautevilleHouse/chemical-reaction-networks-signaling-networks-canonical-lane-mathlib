import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure MichaelisMentenParams where
  substrate : String
  enzyme : String
  product : String
  Km : ℝ
  Vmax : ℝ
  KmClosed : Km > 0
  VmaxClosed : Vmax > 0

structure MichaelisMentenKinetics (G : ReactionGraph S) where
  params : List MichaelisMentenParams
  kineticsApplied : Prop
  kineticsAppliedClosed : kineticsApplied
  steadyStateAssumption : Prop
  steadyStateAssumptionClosed : steadyStateAssumption

structure MichaelisMentenEvidence (M : MichaelisMentenKinetics G) where
  kineticsAppliedClosed : M.kineticsApplied
  steadyStateAssumptionClosed : M.steadyStateAssumption

def MichaelisMentenClosed (M : MichaelisMentenKinetics G) : Prop :=
  M.kineticsApplied ∧ M.steadyStateAssumption

theorem michaelis_menten_closed_from_evidence (M : MichaelisMentenKinetics G) (E : MichaelisMentenEvidence M) :
    MichaelisMentenClosed M := by
  exact And.intro E.kineticsAppliedClosed E.steadyStateAssumptionClosed

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse