import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure SteadyStateCondition {G : ReactionGraph S} (K : MassActionKinetics G) where
  concentrations : List (String × ℝ)
  steadyStateEquations : Prop
  jacobianComputed : Prop
  stabilityAnalyzed : Prop
  steadyStateEquationsClosed : steadyStateEquations
  jacobianComputedClosed : jacobianComputed
  stabilityAnalyzedClosed : stabilityAnalyzed

structure SteadyStateEvidence (C : SteadyStateCondition K) where
  steadyStateEquationsClosed : C.steadyStateEquations
  jacobianComputedClosed : C.jacobianComputed
  stabilityAnalyzedClosed : C.stabilityAnalyzed

def SteadyStateClosed (C : SteadyStateCondition K) : Prop :=
  C.steadyStateEquations ∧ C.jacobianComputed ∧ C.stabilityAnalyzed

theorem steady_state_closed_from_evidence (C : SteadyStateCondition K) (E : SteadyStateEvidence C) :
    SteadyStateClosed C := by
  exact And.intro E.steadyStateEquationsClosed (And.intro E.jacobianComputedClosed E.stabilityAnalyzedClosed)

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse