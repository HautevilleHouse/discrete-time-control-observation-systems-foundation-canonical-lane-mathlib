import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundation

structure DiscreteTimeSystem where
  stateSpace : Type u
  inputSpace : Type v
  observationSpace : Type w
  dynamics : stateSpace × inputSpace → stateSpace
  observationMap : stateSpace → observationSpace
  initialCondition : stateSpace

def DiscreteTimeBridgeClosed (sys : DiscreteTimeSystem) : Prop :=
  sys.initialCondition = sys.initialCondition

end DiscreteTimeControlObservationSystemsFoundation
end HautevilleHouse
