import CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.CelestialMechanicsRegularizationAdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizationMapPackage {A : AdmissibleClass} where
  collisionMap : Type
  regularizedFlow : Type
  mapContinuous : Prop
  mapHomeomorphism : Prop
  preservesOrbitsOutsideCollision : Prop

structure RegularizationMapEvidence {A : AdmissibleClass} (R : RegularizationMapPackage) where
  mapContinuousClosed : R.mapContinuous
  mapHomeomorphismClosed : R.mapHomeomorphism
  preservesOrbitsOutsideCollisionClosed : R.preservesOrbitsOutsideCollision

def RegularizationMapClosed {A : AdmissibleClass} (R : RegularizationMapPackage) : Prop :=
  R.mapContinuous ∧ R.mapHomeomorphism ∧ R.preservesOrbitsOutsideCollision

theorem regularization_map_closed_from_evidence
    {A : AdmissibleClass} (R : RegularizationMapPackage)
    (E : RegularizationMapEvidence R) : RegularizationMapClosed R := by
  exact And.intro E.mapContinuousClosed
    (And.intro E.mapHomeomorphismClosed E.preservesOrbitsOutsideCollisionClosed)

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse