import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

open HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure ObservabilityPackage (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) where
  observationHorizon : ℕ
  observabilityGramian : Type
  observabilityGramianRankCondition : Prop
  detectabilityCondition : Prop

structure ObservabilityEvidence (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (O : ObservabilityPackage T S C) where
  observabilityGramianRankConditionClosed : O.observabilityGramianRankCondition
  detectabilityConditionClosed : O.detectabilityCondition

def ObservabilityClosed (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (O : ObservabilityPackage T S C) : Prop :=
  O.observabilityGramianRankCondition ∧ O.detectabilityCondition

theorem observability_closed_from_evidence (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (O : ObservabilityPackage T S C) (E : ObservabilityEvidence T S C O) : ObservabilityClosed T S C O := by
  exact And.intro E.observabilityGramianRankConditionClosed E.detectabilityConditionClosed

structure ReachabilityPackage (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) where
  reachabilityHorizon : ℕ
  reachabilityGramian : Type
  reachabilityGramianRankCondition : Prop
  controllabilityCondition : Prop

structure ReachabilityEvidence (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (R : ReachabilityPackage T S C) where
  reachabilityGramianRankConditionClosed : R.reachabilityGramianRankCondition
  controllabilityConditionClosed : R.controllabilityCondition

def ReachabilityClosed (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (R : ReachabilityPackage T S C) : Prop :=
  R.reachabilityGramianRankCondition ∧ R.controllabilityCondition

theorem reachability_closed_from_evidence (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (R : ReachabilityPackage T S C) (E : ReachabilityEvidence T S C R) : ReachabilityClosed T S C R := by
  exact And.intro E.reachabilityGramianRankConditionClosed E.controllabilityConditionClosed

end HautevilleHouse
end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean