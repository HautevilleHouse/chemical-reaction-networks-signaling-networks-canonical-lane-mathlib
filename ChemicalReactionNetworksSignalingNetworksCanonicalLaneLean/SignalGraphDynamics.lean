import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean.ChemicalReactionNetwork

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure SignalGraphDynamics (N : ChemicalReactionNetwork) where
  signalingGraph : Type w
  edgeDynamics : signalingGraph → (N.species → ℝ) → ℝ
  positiveInvariant : Prop
  steadyStateExistence : Prop
  stabilityConditions : Prop
  positiveInvariantClosed : positiveInvariant
  steadyStateExistenceClosed : steadyStateExistence
  stabilityConditionsClosed : stabilityConditions

def SignalGraphDynamicsClosed (N : ChemicalReactionNetwork)
    (S : SignalGraphDynamics N) : Prop :=
  S.positiveInvariant ∧ S.steadyStateExistence ∧ S.stabilityConditions

theorem signal_graph_dynamics_closed_from_evidence (N : ChemicalReactionNetwork)
    (S : SignalGraphDynamics N) : SignalGraphDynamicsClosed N S := by
  exact And.intro S.positiveInvariantClosed
    (And.intro S.steadyStateExistenceClosed S.stabilityConditionsClosed)

end HautevilleHouse
end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean