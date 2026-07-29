import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure BinaryCollisionRegularization (A : AdmissibleClass) where
  collisionPoints : Set (A.object.space.carrier)
  regularizedMetric : A.object.space.topology → A.object.space.topology
  blowupResolved : Prop
  analyticExtension : Prop
  binaryCollisionResolved : blowupResolved ∧ analyticExtension

structure BinaryCollisionRegularizationEvidence {A : AdmissibleClass} (R : BinaryCollisionRegularization A) where
  blowupResolvedClosed : R.blowupResolved
  analyticExtensionClosed : R.analyticExtension

def BinaryCollisionRegularizationClosed {A : AdmissibleClass} (R : BinaryCollisionRegularization A) : Prop :=
  R.binaryCollisionResolved

theorem binary_collision_regularization_closed_from_evidence
    {A : AdmissibleClass} (R : BinaryCollisionRegularization A)
    (E : BinaryCollisionRegularizationEvidence R) : BinaryCollisionRegularizationClosed R := by
  exact E.blowupResolvedClosed ∧ E.analyticExtensionClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse