import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure BifurcationParameter where
  name : String
  range : ℝ × ℝ
  rangeClosed : range.1 < range.2

structure BistabilityAnalysis {G : ReactionGraph S} (K : MassActionKinetics G) where
  parameters : List BifurcationParameter
  bifurcationDiagram : Prop
  multipleSteadyStates : Prop
  hysteresisCondition : Prop
  bifurcationDiagramClosed : bifurcationDiagram
  multipleSteadyStatesClosed : multipleSteadyStates
  hysteresisConditionClosed : hysteresisCondition

structure BistabilityEvidence (B : BistabilityAnalysis K) where
  bifurcationDiagramClosed : B.bifurcationDiagram
  multipleSteadyStatesClosed : B.multipleSteadyStates
  hysteresisConditionClosed : B.hysteresisCondition

def BistabilityClosed (B : BistabilityAnalysis K) : Prop :=
  B.bifurcationDiagram ∧ B.multipleSteadyStates ∧ B.hysteresisCondition

theorem bistability_closed_from_evidence (B : BistabilityAnalysis K) (E : BistabilityEvidence B) :
    BistabilityClosed B := by
  exact And.intro E.bifurcationDiagramClosed (And.intro E.multipleSteadyStatesClosed E.hysteresisConditionClosed)

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse