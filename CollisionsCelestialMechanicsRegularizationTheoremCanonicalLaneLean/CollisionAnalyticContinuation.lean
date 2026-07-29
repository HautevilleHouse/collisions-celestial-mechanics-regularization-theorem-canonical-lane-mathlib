import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure CollisionAnalyticContinuation {A : AdmissibleClass} where
  solutionAcrossCollision : Prop
  regularizedFlowGlobal : Prop
  energyMomentumConserved : Prop
  perturbativeStability : Prop
  centralConfigurationRegularization : Prop

structure CollisionAnalyticContinuationEvidence {A : AdmissibleClass}
    (C : CollisionAnalyticContinuation A) where
  solutionAcrossCollisionClosed : C.solutionAcrossCollision
  regularizedFlowGlobalClosed : C.regularizedFlowGlobal
  energyMomentumConservedClosed : C.energyMomentumConserved
  perturbativeStabilityClosed : C.perturbativeStability
  centralConfigurationRegularizationClosed : C.centralConfigurationRegularization

def CollisionAnalyticContinuationClosed {A : AdmissibleClass}
    (C : CollisionAnalyticContinuation A) : Prop :=
  C.solutionAcrossCollision ∧ C.regularizedFlowGlobal ∧ C.energyMomentumConserved ∧
  C.perturbativeStability ∧ C.centralConfigurationRegularization

theorem collision_analytic_continuation_closed_from_evidence
    {A : AdmissibleClass} (C : CollisionAnalyticContinuation A)
    (E : CollisionAnalyticContinuationEvidence C) : CollisionAnalyticContinuationClosed C := by
  exact And.intro E.solutionAcrossCollisionClosed
    (And.intro E.regularizedFlowGlobalClosed
      (And.intro E.energyMomentumConservedClosed
        (And.intro E.perturbativeStabilityClosed E.centralConfigurationRegularizationClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
