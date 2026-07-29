import HautevilleHouse.CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse
