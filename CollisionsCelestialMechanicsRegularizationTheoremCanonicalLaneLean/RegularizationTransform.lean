import canonicalLaneMathlib.AdmissibleClass
import CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizationTransform where
  timeRegularization : ℝ → ℝ
  coordinateRegularization : (ℝ × ℝ × ℝ) → (ℝ × ℝ × ℝ)
  preservesHamiltonian : Prop
  eliminatesCollisionSingularity : Prop

structure RegularizationTransformEvidence (R : RegularizationTransform) where
  preservesHamiltonianClosed : R.preservesHamiltonian
  eliminatesCollisionSingularityClosed : R.eliminatesCollisionSingularity

def RegularizationTransformClosed (R : RegularizationTransform) : Prop :=
  R.preservesHamiltonian ∧ R.eliminatesCollisionSingularity

theorem regularization_transform_closed_from_evidence
    (R : RegularizationTransform) (E : RegularizationTransformEvidence R) :
    RegularizationTransformClosed R := by
  exact And.intro E.preservesHamiltonianClosed E.eliminatesCollisionSingularityClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse