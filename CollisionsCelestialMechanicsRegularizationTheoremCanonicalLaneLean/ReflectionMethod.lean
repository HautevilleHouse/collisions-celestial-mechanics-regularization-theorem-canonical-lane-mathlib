import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure ReflectionMethod (A : AdmissibleClass) where
  manifold : A.object.space.carrier
  reflectionMap : manifold → manifold
  fixedPoints : Set manifold
  regularizedNeighborhood : (x : manifold) → x ∈ fixedPoints → Prop
  reflectionRegularization : Prop

structure ReflectionMethodEvidence {A : AdmissibleClass} (R : ReflectionMethod A) where
  reflectionRegularizationClosed : R.reflectionRegularization

def ReflectionMethodClosed {A : AdmissibleClass} (R : ReflectionMethod A) : Prop :=
  R.reflectionRegularization

theorem reflection_method_closed_from_evidence
    {A : AdmissibleClass} (R : ReflectionMethod A)
    (E : ReflectionMethodEvidence R) : ReflectionMethodClosed R := by
  exact E.reflectionRegularizationClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse