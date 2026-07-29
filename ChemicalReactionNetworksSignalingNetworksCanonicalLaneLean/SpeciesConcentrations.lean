import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworks

structure SpeciesConcentration where
  speciesName : String
  concentration : ℝ
  positiveConcentration : concentration > 0

structure ConcentrationVector (n : ℕ) where
  species : Fin n → SpeciesConcentration

structure ConcentrationPackage where
  nSpecies : ℕ
  concentrationVector : ConcentrationVector nSpecies
  totalConcentrationSum : Prop
  concentrationLipschitz : Prop

structure ConcentrationEvidence (C : ConcentrationPackage) where
  totalConcentrationSumClosed : C.totalConcentrationSum
  concentrationLipschitzClosed : C.concentrationLipschitz

def ConcentrationClosed (C : ConcentrationPackage) : Prop :=
  C.totalConcentrationSum ∧ C.concentrationLipschitz

theorem concentration_closed_from_evidence (C : ConcentrationPackage)
    (E : ConcentrationEvidence C) : ConcentrationClosed C := by
  exact And.intro E.totalConcentrationSumClosed E.concentrationLipschitzClosed

end ChemicalReactionNetworksSignalingNetworks
end HautevilleHouse