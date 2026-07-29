import canonicalLaneMathlib.AdmissibleClass
import CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure TwoBodyCentralCollision where
  m1 : ℝ
  m2 : ℝ
  initialPosition : ℝ × ℝ × ℝ
  initialVelocity : ℝ × ℝ × ℝ
  collisionTime : ℝ

structure LeviCivitaRegularizationPackage where
  transformation : RegularizationTransform
  energyLevel : ℝ
  reducedEquations : Prop
  analyticExtension : Prop

structure LeviCivitaRegularizationEvidence
    (L : LeviCivitaRegularizationPackage) where
  transformationClosed : RegularizationTransformClosed L.transformation
  reducedEquationsClosed : L.reducedEquations
  analyticExtensionClosed : L.analyticExtension

def LeviCivitaRegularizationClosed (L : LeviCivitaRegularizationPackage) : Prop :=
  RegularizationTransformClosed L.transformation ∧ L.reducedEquations ∧ L.analyticExtension

theorem levi_civita_regularization_closed_from_evidence
    (L : LeviCivitaRegularizationPackage)
    (E : LeviCivitaRegularizationEvidence L) :
    LeviCivitaRegularizationClosed L := by
  exact And.intro E.transformationClosed
    (And.intro E.reducedEquationsClosed E.analyticExtensionClosed)

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse