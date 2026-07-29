import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteTimeControlObservationSystemsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse