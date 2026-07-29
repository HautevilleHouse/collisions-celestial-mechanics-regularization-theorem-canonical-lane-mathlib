import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure TwoBodyRegularization {A : AdmissibleClass} where
  leviCivitaRegularization : Prop
  ksRegularization : Prop
  regularizedEquationsBounded : Prop
  eccentricityAnomalyMapping : Prop
  smirnovRegularization : Prop

structure TwoBodyRegularizationEvidence {A : AdmissibleClass} (T : TwoBodyRegularization A) where
  leviCivitaRegularizationClosed : T.leviCivitaRegularization
  ksRegularizationClosed : T.ksRegularization
  regularizedEquationsBoundedClosed : T.regularizedEquationsBounded
  eccentricityAnomalyMappingClosed : T.eccentricityAnomalyMapping
  smirnovRegularizationClosed : T.smirnovRegularization

def TwoBodyRegularizationClosed {A : AdmissibleClass} (T : TwoBodyRegularization A) : Prop :=
  T.leviCivitaRegularization ∧ T.ksRegularization ∧ T.regularizedEquationsBounded ∧
  T.eccentricityAnomalyMapping ∧ T.smirnovRegularization

theorem two_body_regularization_closed_from_evidence
    {A : AdmissibleClass} (T : TwoBodyRegularization A)
    (E : TwoBodyRegularizationEvidence T) : TwoBodyRegularizationClosed T := by
  exact And.intro E.leviCivitaRegularizationClosed
    (And.intro E.ksRegularizationClosed
      (And.intro E.regularizedEquationsBoundedClosed
        (And.intro E.eccentricityAnomalyMappingClosed E.smirnovRegularizationClosed)))

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
