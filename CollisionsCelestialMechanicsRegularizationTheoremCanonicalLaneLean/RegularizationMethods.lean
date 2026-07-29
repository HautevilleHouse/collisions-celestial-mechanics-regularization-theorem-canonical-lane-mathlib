import HautevilleHouse.CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizationMethodsPackage where
  timeScaleChange : Prop
  coordinateTransformation : Prop
  energyRegularization : Prop
  collisionRegularization : Prop

structure RegularizationMethodsEvidence (R : RegularizationMethodsPackage) where
  timeScaleChangeClosed : R.timeScaleChange
  coordinateTransformationClosed : R.coordinateTransformation
  energyRegularizationClosed : R.energyRegularization
  collisionRegularizationClosed : R.collisionRegularization

def RegularizationMethodsClosed (R : RegularizationMethodsPackage) : Prop :=
  R.timeScaleChange ∧ R.coordinateTransformation ∧ R.energyRegularization ∧ R.collisionRegularization

theorem regularization_methods_closed_from_evidence
    (R : RegularizationMethodsPackage) (E : RegularizationMethodsEvidence R) :
    RegularizationMethodsClosed R := by
  exact And.intro E.timeScaleChangeClosed
    (And.intro E.coordinateTransformationClosed
      (And.intro E.energyRegularizationClosed E.collisionRegularizationClosed))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
