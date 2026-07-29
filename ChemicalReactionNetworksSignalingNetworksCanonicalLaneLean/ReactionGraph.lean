import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure ReactionGraph (S : Type) where
  species : List S
  edges : List (S × S)
  connected : Prop
  directed : Prop
  adjacencyMatrix : List (List Nat)
  connectedClosed : connected
  directedClosed : directed

structure ReactionGraphEvidence (G : ReactionGraph S) where
  connectedClosed : G.connected
  directedClosed : G.directed

def ReactionGraphClosed (G : ReactionGraph S) : Prop :=
  G.connected ∧ G.directed

theorem reaction_graph_closed_from_evidence (G : ReactionGraph S) (E : ReactionGraphEvidence G) :
    ReactionGraphClosed G := by
  exact And.intro E.connectedClosed E.directedClosed

end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean
end HautevilleHouse