import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure SignalingNode where
  id : String
  isReceptor : Bool
  isTransducer : Bool
  isEffector : Bool
  isReceptorClosed : isReceptor ∨ ¬isReceptor
  isTransducerClosed : isTransducer ∨ ¬isTransducer
  isEffectorClosed : isEffector ∨ ¬isEffector

structure SignalingNetwork (G : ReactionGraph S) where
  nodes : List SignalingNode
  edges : List (String × String)
  signalFlowDefined : Prop
  signalFlowClosed : signalFlowDefined
  feedbackLoopsIdentified : Prop
  feedbackLoopsClosed : feedbackLoopsIdentified

structure SignalingNetworkEvidence (N : SignalingNetwork G) where
  signalFlowClosed : N.signalFlowDefined
  feedbackLoopsClosed : N.feedbackLoopsIdentified

def SignalingNetworkClosed (N : SignalingNetwork G) : Prop :=
  N.signalFlowDefined ∧ N.feedbackLoopsIdentified

theorem signaling_network_closed_from_evidence (N : SignalingNetwork G) (E : SignalingNetworkEvidence N) :
    SignalingNetworkClosed N := by
  exact And.intro E.signalFlowClosed E.feedbackLoopsClosed

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse