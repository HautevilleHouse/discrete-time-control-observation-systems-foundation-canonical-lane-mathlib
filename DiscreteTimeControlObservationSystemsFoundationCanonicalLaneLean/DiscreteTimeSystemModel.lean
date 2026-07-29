import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure DiscreteTimeSystemModel where
  stateSpace : Type u
  observationSpace : Type v
  controlInputSpace : Type w
  timeIndex : Type
  shiftOperator : timeIndex → timeIndex
  stateTransition : timeIndex → stateSpace → controlInputSpace → stateSpace
  observationMap : timeIndex → stateSpace → observationSpace
  initialConditionsDefined : Prop
  transitionWellDefined : Prop
  observationConsistent : Prop

def DiscreteTimeSystemModelClosed (M : DiscreteTimeSystemModel) : Prop :=
  M.initialConditionsDefined ∧ M.transitionWellDefined ∧ M.observationConsistent

structure DiscreteTimeSystemModelEvidence (M : DiscreteTimeSystemModel) where
  initialConditionsDefinedClosed : M.initialConditionsDefined
  transitionWellDefinedClosed : M.transitionWellDefined
  observationConsistentClosed : M.observationConsistent

theorem discrete_time_system_model_closed_from_evidence (M : DiscreteTimeSystemModel)
    (E : DiscreteTimeSystemModelEvidence M) : DiscreteTimeSystemModelClosed M := by
  exact And.intro E.initialConditionsDefinedClosed
    (And.intro E.transitionWellDefinedClosed E.observationConsistentClosed)

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse