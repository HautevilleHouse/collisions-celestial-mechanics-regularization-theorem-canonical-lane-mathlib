import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure CollisionManifoldReductionPackage where
  regularizedPhaseSpace : Type u
  collisionSurface : Prop
  reducedDimension : Prop
  topologicalTypeChange : Prop
  energyLevelSetCompactified : Prop
  collisionRegularizationChart : Prop

structure CollisionManifoldReductionEvidence (P : CollisionManifoldReductionPackage) where
  collisionSurfaceClosed : P.collisionSurface
  reducedDimensionClosed : P.reducedDimension
  topologicalTypeChangeClosed : P.topologicalTypeChange
  energyLevelSetCompactifiedClosed : P.energyLevelSetCompactified
  collisionRegularizationChartClosed : P.collisionRegularizationChart

def CollisionManifoldReductionClosed (P : CollisionManifoldReductionPackage) : Prop :=
  P.collisionSurface ∧ P.reducedDimension ∧
  P.topologicalTypeChange ∧ P.energyLevelSetCompactified ∧ P.collisionRegularizationChart

theorem collision_manifold_reduction_closed_from_evidence
    (P : CollisionManifoldReductionPackage) (E : CollisionManifoldReductionEvidence P) :
    CollisionManifoldReductionClosed P := by
  exact And.intro E.collisionSurfaceClosed
    (And.intro E.reducedDimensionClosed
      (And.intro E.topologicalTypeChangeClosed
        (And.intro E.energyLevelSetCompactifiedClosed E.collisionRegularizationChartClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse