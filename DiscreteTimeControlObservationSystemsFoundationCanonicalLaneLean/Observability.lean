import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundation

structure ObservabilityPackage (sys : DiscreteTimeSystem) where
  observable : Prop
  observabilityGramian : Type
  rankCondition : Prop

def ObservabilityClosed (sys : DiscreteTimeSystem) (O : ObservabilityPackage sys) : Prop :=
  O.observable ∧ O.rankCondition

theorem observability_closed_from_evidence (sys : DiscreteTimeSystem) (O : ObservabilityPackage sys) :
    ObservabilityClosed sys O := by
  exact And.intro O.observable O.rankCondition

end DiscreteTimeControlObservationSystemsFoundation
end HautevilleHouse
