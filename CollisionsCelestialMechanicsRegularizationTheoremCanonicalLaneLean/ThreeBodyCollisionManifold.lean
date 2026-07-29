import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure ThreeBodyCollisionManifold {A : AdmissibleClass} where
  sundmanRegularization : Prop
  binaryCollisionRegularized : Prop
  tripleCollisionBlowup : Prop
  collisionManifoldDimension : Prop
  blockRegularization : Prop

structure ThreeBodyCollisionManifoldEvidence {A : AdmissibleClass}
    (T : ThreeBodyCollisionManifold A) where
  sundmanRegularizationClosed : T.sundmanRegularization
  binaryCollisionRegularizedClosed : T.binaryCollisionRegularized
  tripleCollisionBlowupClosed : T.tripleCollisionBlowup
  collisionManifoldDimensionClosed : T.collisionManifoldDimension
  blockRegularizationClosed : T.blockRegularization

def ThreeBodyCollisionManifoldClosed {A : AdmissibleClass}
    (T : ThreeBodyCollisionManifold A) : Prop :=
  T.sundmanRegularization ∧ T.binaryCollisionRegularized ∧
  T.tripleCollisionBlowup ∧ T.collisionManifoldDimension ∧ T.blockRegularization

theorem three_body_collision_manifold_closed_from_evidence
    {A : AdmissibleClass} (T : ThreeBodyCollisionManifold A)
    (E : ThreeBodyCollisionManifoldEvidence T) : ThreeBodyCollisionManifoldClosed T := by
  exact And.intro E.sundmanRegularizationClosed
    (And.intro E.binaryCollisionRegularizedClosed
      (And.intro E.tripleCollisionBlowupClosed
        (And.intro E.collisionManifoldDimensionClosed E.blockRegularizationClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
