import canonicalLaneMathlib.AdmissibleClass
import CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure SundmanRegularizationData where
  timeTransformation : ℝ → ℝ
  regularizedTimeVariable : ℝ
  seriesConvergenceRadius : ℝ
  collisionTimesRemoved : Prop

structure SundmanRegularizationPackage where
  threeBodyCollision : CollisionEvent
  regularizationData : SundmanRegularizationData
  seriesSolutionExists : Prop
  realAnalyticExtension : Prop

structure SundmanRegularizationEvidence
    (S : SundmanRegularizationPackage) where
  seriesSolutionExistsClosed : S.seriesSolutionExists
  realAnalyticExtensionClosed : S.realAnalyticExtension

def SundmanRegularizationClosed (S : SundmanRegularizationPackage) : Prop :=
  S.seriesSolutionExists ∧ S.realAnalyticExtension

theorem sundman_regularization_closed_from_evidence
    (S : SundmanRegularizationPackage)
    (E : SundmanRegularizationEvidence S) :
    SundmanRegularizationClosed S := by
  exact And.intro E.seriesSolutionExistsClosed E.realAnalyticExtensionClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse