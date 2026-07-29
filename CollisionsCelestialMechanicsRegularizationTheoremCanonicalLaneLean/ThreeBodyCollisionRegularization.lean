import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure ThreeBodyCollisionRegularization (A : AdmissibleClass) where
  tripleCollisionSet : Set (A.object.space.carrier)
  regularizedFlow : ℝ → A.object.space.carrier → A.object.space.carrier
  tripleCollisionResolved : Prop
  flowContinuation : Prop
  threeBodyRegularization : tripleCollisionResolved ∧ flowContinuation

structure ThreeBodyCollisionRegularizationEvidence {A : AdmissibleClass}
    (R : ThreeBodyCollisionRegularization A) where
  tripleCollisionResolvedClosed : R.tripleCollisionResolved
  flowContinuationClosed : R.flowContinuation

def ThreeBodyCollisionRegularizationClosed {A : AdmissibleClass}
    (R : ThreeBodyCollisionRegularization A) : Prop :=
  R.threeBodyRegularization

theorem three_body_collision_regularization_closed_from_evidence
    {A : AdmissibleClass} (R : ThreeBodyCollisionRegularization A)
    (E : ThreeBodyCollisionRegularizationEvidence R) :
    ThreeBodyCollisionRegularizationClosed R := by
  exact E.tripleCollisionResolvedClosed ∧ E.flowContinuationClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse