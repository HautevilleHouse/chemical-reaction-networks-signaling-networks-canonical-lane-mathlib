import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksSignalingNetworks

structure ObservedData where
  timePoints : List ℝ
  measurements : List (List ℝ) -- species concentrations over time
  noiseModel : Prop

structure InferredNetwork where
  reactions : List ReactionSpec
  confidenceScore : ℝ
  scoreInRange : 0 ≤ confidenceScore ∧ confidenceScore ≤ 1

structure InferencePackage where
  data : ObservedData
  inferred : InferredNetwork
  inferenceAlgorithmSound : Prop
  identifiabilityCondition : Prop

structure InferenceEvidence (I : InferencePackage) where
  inferenceAlgorithmSoundClosed : I.inferenceAlgorithmSound
  identifiabilityConditionClosed : I.identifiabilityCondition

def InferenceClosed (I : InferencePackage) : Prop :=
  I.inferenceAlgorithmSound ∧ I.identifiabilityCondition

theorem inference_closed_from_evidence (I : InferencePackage)
    (E : InferenceEvidence I) : InferenceClosed I := by
  exact And.intro E.inferenceAlgorithmSoundClosed E.identifiabilityConditionClosed

end ChemicalReactionNetworksSignalingNetworks
end HautevilleHouse