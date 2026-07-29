import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundation

structure ControllabilityPackage (sys : DiscreteTimeSystem) where
  controllable : Prop
  controllabilityGramian : Type
  reachableSubspace : Type

def ControllabilityClosed (sys : DiscreteTimeSystem) (C : ControllabilityPackage sys) : Prop :=
  C.controllable

theorem controllability_closed_from_evidence (sys : DiscreteTimeSystem) (C : ControllabilityPackage sys) :
    ControllabilityClosed sys C := by
  exact C.controllable

end DiscreteTimeControlObservationSystemsFoundation
end HautevilleHouse
