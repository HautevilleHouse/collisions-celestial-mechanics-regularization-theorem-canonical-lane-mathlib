import HautevilleHouse.CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.BodyProblemDynamics

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure CollisionResolutionPackage {R : RegularizationMethodsPackage}
    {D : BodyProblemDynamicsPackage R} where
  binaryCollisionRegularizable : Prop
  tripleCollisionNonRegularizable : Prop
  LeviCivitaRegularization : Prop
  KustaanheimoStiefelRegularization : Prop
  collisionEjectionScenario : Prop

structure CollisionResolutionEvidence {R : RegularizationMethodsPackage}
    {D : BodyProblemDynamicsPackage R} (C : CollisionResolutionPackage D) where
  binaryCollisionRegularizableClosed : C.binaryCollisionRegularizable
  tripleCollisionNonRegularizableClosed : C.tripleCollisionNonRegularizable
  LeviCivitaRegularizationClosed : C.LeviCivitaRegularization
  KustaanheimoStiefelRegularizationClosed : C.KustaanheimoStiefelRegularization
  collisionEjectionScenarioClosed : C.collisionEjectionScenario

def CollisionResolutionClosed {R : RegularizationMethodsPackage}
    {D : BodyProblemDynamicsPackage R} (C : CollisionResolutionPackage D) : Prop :=
  C.binaryCollisionRegularizable ∧ C.tripleCollisionNonRegularizable ∧
  C.LeviCivitaRegularization ∧ C.KustaanheimoStiefelRegularization ∧
  C.collisionEjectionScenario

theorem collision_resolution_closed_from_evidence
    {R : RegularizationMethodsPackage} {D : BodyProblemDynamicsPackage R}
    (C : CollisionResolutionPackage D) (E : CollisionResolutionEvidence C) :
    CollisionResolutionClosed C := by
  exact And.intro E.binaryCollisionRegularizableClosed
    (And.intro E.tripleCollisionNonRegularizableClosed
      (And.intro E.LeviCivitaRegularizationClosed
        (And.intro E.KustaanheimoStiefelRegularizationClosed E.collisionEjectionScenarioClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
