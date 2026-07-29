import HautevilleHouse.CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.RegularizationMethods

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure BodyProblemDynamicsPackage {R : RegularizationMethodsPackage} where
  nBodyPhaseSpace : Prop
  collisionSet : Prop
  regularizedFlow : Prop
  conservedQuantities : Prop
  asymptoticBehavior : Prop

structure BodyProblemDynamicsEvidence {R : RegularizationMethodsPackage}
    (D : BodyProblemDynamicsPackage R) where
  nBodyPhaseSpaceClosed : D.nBodyPhaseSpace
  collisionSetClosed : D.collisionSet
  regularizedFlowClosed : D.regularizedFlow
  conservedQuantitiesClosed : D.conservedQuantities
  asymptoticBehaviorClosed : D.asymptoticBehavior

def BodyProblemDynamicsClosed {R : RegularizationMethodsPackage}
    (D : BodyProblemDynamicsPackage R) : Prop :=
  D.nBodyPhaseSpace ∧ D.collisionSet ∧ D.regularizedFlow ∧ D.conservedQuantities ∧ D.asymptoticBehavior

theorem body_problem_dynamics_closed_from_evidence
    {R : RegularizationMethodsPackage} (D : BodyProblemDynamicsPackage R)
    (E : BodyProblemDynamicsEvidence D) : BodyProblemDynamicsClosed D := by
  exact And.intro E.nBodyPhaseSpaceClosed
    (And.intro E.collisionSetClosed
      (And.intro E.regularizedFlowClosed
        (And.intro E.conservedQuantitiesClosed E.asymptoticBehaviorClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
