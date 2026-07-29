import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworks

structure ReactionSpec where
  reactants : List String
  products : List String
  rateConstant : ℝ
  ratePositive : rateConstant > 0

structure ReactionNetwork where
  reactions : List ReactionSpec
  massActionLaw : Prop
  detailedBalance : Prop

structure KineticsPackage where
  network : ReactionNetwork
  odeSystemDefined : Prop
  steadyStatesExist : Prop
  stabilityCharacterization : Prop

structure KineticsEvidence (K : KineticsPackage) where
  odeSystemDefinedClosed : K.odeSystemDefined
  steadyStatesExistClosed : K.steadyStatesExist
  stabilityCharacterizationClosed : K.stabilityCharacterization

def KineticsClosed (K : KineticsPackage) : Prop :=
  K.odeSystemDefined ∧ K.steadyStatesExist ∧ K.stabilityCharacterization

theorem kinetics_closed_from_evidence (K : KineticsPackage)
    (E : KineticsEvidence K) : KineticsClosed K := by
  exact And.intro E.odeSystemDefinedClosed
    (And.intro E.steadyStatesExistClosed E.stabilityCharacterizationClosed)

end ChemicalReactionNetworksSignalingNetworks
end HautevilleHouse