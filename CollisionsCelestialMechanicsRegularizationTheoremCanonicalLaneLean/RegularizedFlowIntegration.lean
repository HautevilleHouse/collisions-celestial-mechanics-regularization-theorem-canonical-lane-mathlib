import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure RegularizedFlowIntegrationPackage where
  regularizedHamiltonian : Prop
  regularizedFlow : Type u
  collisionlessTrajectories : Prop
  asymptoticBehavior : Prop
  analyticExtension : Prop
  globalTimeExistence : Prop

structure RegularizedFlowIntegrationEvidence (P : RegularizedFlowIntegrationPackage) where
  regularizedHamiltonianClosed : P.regularizedHamiltonian
  collisionlessTrajectoriesClosed : P.collisionlessTrajectories
  asymptoticBehaviorClosed : P.asymptoticBehavior
  analyticExtensionClosed : P.analyticExtension
  globalTimeExistenceClosed : P.globalTimeExistence

def RegularizedFlowIntegrationClosed (P : RegularizedFlowIntegrationPackage) : Prop :=
  P.regularizedHamiltonian ∧ P.collisionlessTrajectories ∧
  P.asymptoticBehavior ∧ P.analyticExtension ∧ P.globalTimeExistence

theorem regularized_flow_integration_closed_from_evidence
    (P : RegularizedFlowIntegrationPackage) (E : RegularizedFlowIntegrationEvidence P) :
    RegularizedFlowIntegrationClosed P := by
  exact And.intro E.regularizedHamiltonianClosed
    (And.intro E.collisionlessTrajectoriesClosed
      (And.intro E.asymptoticBehaviorClosed
        (And.intro E.analyticExtensionClosed E.globalTimeExistenceClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse