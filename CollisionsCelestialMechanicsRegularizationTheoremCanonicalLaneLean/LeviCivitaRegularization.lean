import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure LeviCivitaRegularization (A : AdmissibleClass) where
  collisionOrbit : A.object.space.carrier → ℝ
  transformation : A.object.space.carrier → A.object.space.carrier
  regularizedParameter : Prop
  analyticityPreserved : Prop
  leviCivitaRegularization : regularizedParameter ∧ analyticityPreserved

structure LeviCivitaRegularizationEvidence {A : AdmissibleClass} (R : LeviCivitaRegularization A) where
  regularizedParameterClosed : R.regularizedParameter
  analyticityPreservedClosed : R.analyticityPreserved

def LeviCivitaRegularizationClosed {A : AdmissibleClass} (R : LeviCivitaRegularization A) : Prop :=
  R.leviCivitaRegularization

theorem levi_civita_regularization_closed_from_evidence
    {A : AdmissibleClass} (R : LeviCivitaRegularization A)
    (E : LeviCivitaRegularizationEvidence R) : LeviCivitaRegularizationClosed R := by
  exact E.regularizedParameterClosed ∧ E.analyticityPreservedClosed

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse