import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean

structure ChemicalReactionNetwork where
  species : Type u
  reactions : Type v
  stoichiometry : reactions → List (species × ℕ × ℕ)  -- (species, reactant coefficient, product coefficient)
  rateConstants : reactions → ℝ
  networkStructure : Prop
  massActionKinetics : Prop
  rateConstantsPositive : rateConstants r > 0 ∀ r : reactions
  networkStructureClosed : networkStructure
  massActionKineticsClosed : massActionKinetics
  rateConstantsPositiveClosed : rateConstantsPositive

def ChemicalReactionNetworkAdmitted (N : ChemicalReactionNetwork) : Prop :=
  N.networkStructure ∧ N.massActionKinetics ∧ N.rateConstantsPositive

theorem chemical_reaction_network_admitted_from_evidence (N : ChemicalReactionNetwork) :
    ChemicalReactionNetworkAdmitted N := by
  exact And.intro N.networkStructureClosed
    (And.intro N.massActionKineticsClosed N.rateConstantsPositiveClosed)

end HautevilleHouse
end ChemicalReactionNetworksSignalingNetworksCanonicalLaneLean