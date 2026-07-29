import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure SundmanRegularization (A : AdmissibleClass) where
  timeVariable : ℝ → ℝ
  regularizedTime : Prop
  analyticExtension : Prop
  collisionRegularized : regularizedTime ∧ analyticExtension

structure SundmanRegularizationEvidence {A : AdmissibleClass} (R : SundmanRegularization A) where
  regularizedTimeClosed : R.regularizedTime
  analyticExtensionClosed : R.analyticExtension

def SundmanRegularizationClosed {A : AdmissibleClass} (R : SundmanRegularization A) : Prop :=
  R.collisionRegularized

theorem sundman_regularization_closed_from_evidence
    {A : AdmissibleClass} (R : SundmanRegularization A)
    (E : SundmanRegularizationEvidence R) : SundmanRegularizationClosed R := by
  exact E.regularizedTimeClosed ∧ E.analyticExtensionClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse