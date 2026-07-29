import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizationTransformationPackage where
  collisionOrbitType : Type u
  regularizingChart : Type v
  timeTransformationFunction : Prop
  regularizedCoordinates : Prop
  blowupResolution : Prop
  contractivityCondition : Prop
  smoothExtension : Prop

structure RegularizationTransformationEvidence (P : RegularizationTransformationPackage) where
  timeTransformationFunctionClosed : P.timeTransformationFunction
  regularizedCoordinatesClosed : P.regularizedCoordinates
  blowupResolutionClosed : P.blowupResolution
  contractivityConditionClosed : P.contractivityCondition
  smoothExtensionClosed : P.smoothExtension

def RegularizationTransformationClosed (P : RegularizationTransformationPackage) : Prop :=
  P.timeTransformationFunction ∧ P.regularizedCoordinates ∧
  P.blowupResolution ∧ P.contractivityCondition ∧ P.smoothExtension

theorem regularization_transformation_closed_from_evidence
    (P : RegularizationTransformationPackage) (E : RegularizationTransformationEvidence P) :
    RegularizationTransformationClosed P := by
  exact And.intro E.timeTransformationFunctionClosed
    (And.intro E.regularizedCoordinatesClosed
      (And.intro E.blowupResolutionClosed
        (And.intro E.contractivityConditionClosed E.smoothExtensionClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse