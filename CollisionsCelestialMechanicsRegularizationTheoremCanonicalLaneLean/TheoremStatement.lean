import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean

structure CelestialRegularizationAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  admissible : Prop
  conclusion : Prop

def CelestialRegularizationWitnessClosed (O : CelestialRegularizationAdmittedObject) : Prop :=
  O.conclusion

end CollisionsCelestialMechanicsRegularizationTheoremCanonicalLaneLean
end HautevilleHouse