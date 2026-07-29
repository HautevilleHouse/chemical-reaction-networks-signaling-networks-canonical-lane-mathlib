import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure CrossTalkMechanismsPackage (S : SignalingPathwayPackage) where
  sharedComponents : Prop
  feedbackLoops : Prop
  signalIntegration : Prop
  crossRegulation : Prop

structure CrossTalkMechanismsEvidence {S : SignalingPathwayPackage}
    (C : CrossTalkMechanismsPackage S) where
  sharedComponentsClosed : C.sharedComponents
  feedbackLoopsClosed : C.feedbackLoops
  signalIntegrationClosed : C.signalIntegration
  crossRegulationClosed : C.crossRegulation

def CrossTalkMechanismsClosed {S : SignalingPathwayPackage}
    (C : CrossTalkMechanismsPackage S) : Prop :=
  C.sharedComponents ∧ C.feedbackLoops ∧ C.signalIntegration ∧ C.crossRegulation

theorem cross_talk_mechanisms_closed_from_evidence
    {S : SignalingPathwayPackage} (C : CrossTalkMechanismsPackage S)
    (E : CrossTalkMechanismsEvidence C) : CrossTalkMechanismsClosed C := by
  exact And.intro E.sharedComponentsClosed
    (And.intro E.feedbackLoopsClosed
      (And.intro E.signalIntegrationClosed E.crossRegulationClosed))

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse