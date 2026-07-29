import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizedCollisionOrbit {A : AdmissibleClass} where
  primarySystem : Type u
  regularizingTransform : Type v
  collisionOrbitsClassified : Prop
  transformRemovesSingularity : Prop
  postRegularizationFlowDefined : Prop

structure RegularizedCollisionOrbitEvidence {A : AdmissibleClass} (R : RegularizedCollisionOrbit A) where
  collisionOrbitsClassifiedClosed : R.collisionOrbitsClassified
  transformRemovesSingularityClosed : R.transformRemovesSingularity
  postRegularizationFlowDefinedClosed : R.postRegularizationFlowDefined

def RegularizedCollisionOrbitClosed {A : AdmissibleClass} (R : RegularizedCollisionOrbit A) : Prop :=
  R.collisionOrbitsClassified ∧ R.transformRemovesSingularity ∧ R.postRegularizationFlowDefined

theorem regularized_collision_orbit_closed_from_evidence
    {A : AdmissibleClass} (R : RegularizedCollisionOrbit A)
    (E : RegularizedCollisionOrbitEvidence R) : RegularizedCollisionOrbitClosed R := by
  exact And.intro E.collisionOrbitsClassifiedClosed
    (And.intro E.transformRemovesSingularityClosed E.postRegularizationFlowDefinedClosed)

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
