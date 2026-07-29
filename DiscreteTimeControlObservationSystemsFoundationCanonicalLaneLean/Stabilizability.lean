import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundation

structure StabilizabilityPackage (sys : DiscreteTimeSystem) where
  stabilizable : Prop
  feedbackLaw : Type
  closedLoopStable : Prop

def StabilizabilityClosed (sys : DiscreteTimeSystem) (S : StabilizabilityPackage sys) : Prop :=
  S.stabilizable ∧ S.closedLoopStable

theorem stabilizability_closed_from_evidence (sys : DiscreteTimeSystem) (S : StabilizabilityPackage sys) :
    StabilizabilityClosed sys S := by
  exact And.intro S.stabilizable S.closedLoopStable

end DiscreteTimeControlObservationSystemsFoundation
end HautevilleHouse
