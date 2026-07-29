import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure SignalingPathwayPackage where
  species : Type u
  reactions : Type v
  fluxFunctions : Type w
  bindingSpecificity : Prop
  phosphorylationDynamics : Prop
  signalAmplification : Prop

structure SignalingPathwayEvidence (S : SignalingPathwayPackage) where
  bindingSpecificityClosed : S.bindingSpecificity
  phosphorylationDynamicsClosed : S.phosphorylationDynamics
  signalAmplificationClosed : S.signalAmplification

def SignalingPathwayClosed (S : SignalingPathwayPackage) : Prop :=
  S.bindingSpecificity ∧ S.phosphorylationDynamics ∧ S.signalAmplification

theorem signaling_pathway_closed_from_evidence (S : SignalingPathwayPackage)
    (E : SignalingPathwayEvidence S) : SignalingPathwayClosed S := by
  exact And.intro E.bindingSpecificityClosed
    (And.intro E.phosphorylationDynamicsClosed E.signalAmplificationClosed)

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse