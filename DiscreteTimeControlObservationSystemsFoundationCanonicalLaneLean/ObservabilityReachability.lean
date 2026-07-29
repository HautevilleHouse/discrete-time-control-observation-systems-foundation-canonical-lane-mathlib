import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure ObservabilityReachabilityPackage {S : StateSpaceModel} where
  observabilityGramian : Prop
  reachabilityGramian : Prop
  observabilityCondition : ∀ (x1 x2 : S.stateSpace), (∀ (k : ℕ), S.observationFunction (S.stateTransition^k x1) = S.observationFunction (S.stateTransition^k x2)) → x1 = x2
  reachabilityCondition : ∀ (x : S.stateSpace), ∃ (u : ℕ → S.controlSpace) (n : ℕ), S.stateTransition (S.initialDistribution) (u 0) = x ∧ ...

structure ObservabilityReachabilityEvidence {S : StateSpaceModel} (P : ObservabilityReachabilityPackage S) where
  observabilityGramianClosed : P.observabilityGramian
  reachabilityGramianClosed : P.reachabilityGramian
  observabilityConditionClosed : P.observabilityCondition
  reachabilityConditionClosed : P.reachabilityCondition

def ObservabilityReachabilityClosed {S : StateSpaceModel} (P : ObservabilityReachabilityPackage S) : Prop :=
  P.observabilityGramian ∧ P.reachabilityGramian ∧ P.observabilityCondition ∧ P.reachabilityCondition

theorem observability_reachability_closed_from_evidence {S : StateSpaceModel} (P : ObservabilityReachabilityPackage S) (E : ObservabilityReachabilityEvidence P) : ObservabilityReachabilityClosed P := by
  exact And.intro E.observabilityGramianClosed (And.intro E.reachabilityGramianClosed (And.intro E.observabilityConditionClosed E.reachabilityConditionClosed))

end HautevilleHouse
end HautevilleHouse
