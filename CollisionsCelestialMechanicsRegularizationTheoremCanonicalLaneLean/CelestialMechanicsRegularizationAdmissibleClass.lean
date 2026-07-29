import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure CelestialAdmissibleObject where
  system : Type
  phaseSpace : Type
  regularizedCollisionOrbits : Prop
  collisionRegularizationMap : Type
  regularizationHomeomorphism : Prop
  conclusion : regularizationHomeomorphism

def celestialWitnessClosed (O : CelestialAdmissibleObject) : Prop :=
  O.regularizationHomeomorphism

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse