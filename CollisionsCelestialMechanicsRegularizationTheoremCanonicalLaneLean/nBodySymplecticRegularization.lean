import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure NBodySymplecticRegularization {A : AdmissibleClass} where
  symmetricRegularization : Prop
  timeTransformation : Prop
  symplecticStructurePreserved : Prop
  collisionResolutionContinuous : Prop
  kustaanheimoStiefelExtension : Prop

structure NBodySymplecticRegularizationEvidence {A : AdmissibleClass}
    (N : NBodySymplecticRegularization A) where
  symmetricRegularizationClosed : N.symmetricRegularization
  timeTransformationClosed : N.timeTransformation
  symplecticStructurePreservedClosed : N.symplecticStructurePreserved
  collisionResolutionContinuousClosed : N.collisionResolutionContinuous
  kustaanheimoStiefelExtensionClosed : N.kustaanheimoStiefelExtension

def NBodySymplecticRegularizationClosed {A : AdmissibleClass}
    (N : NBodySymplecticRegularization A) : Prop :=
  N.symmetricRegularization ∧ N.timeTransformation ∧ N.symplecticStructurePreserved ∧
  N.collisionResolutionContinuous ∧ N.kustaanheimoStiefelExtension

theorem n_body_symplectic_regularization_closed_from_evidence
    {A : AdmissibleClass} (N : NBodySymplecticRegularization A)
    (E : NBodySymplecticRegularizationEvidence N) : NBodySymplecticRegularizationClosed N := by
  exact And.intro E.symmetricRegularizationClosed
    (And.intro E.timeTransformationClosed
      (And.intro E.symplecticStructurePreservedClosed
        (And.intro E.collisionResolutionContinuousClosed E.kustaanheimoStiefelExtensionClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
