import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.DiscreteTimeSystemModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure StabilizabilityPackage {M : DiscreteTimeSystemModel} where
  stabilizableCondition : Prop
  feedbackStabilizingGainExists : Prop
  lyapunovFunctionExists : Prop

structure StabilizabilityEvidence {M : DiscreteTimeSystemModel} (S : StabilizabilityPackage M) where
  stabilizableConditionClosed : S.stabilizableCondition
  feedbackStabilizingGainExistsClosed : S.feedbackStabilizingGainExists
  lyapunovFunctionExistsClosed : S.lyapunovFunctionExists

def StabilizabilityClosed {M : DiscreteTimeSystemModel} (S : StabilizabilityPackage M) : Prop :=
  S.stabilizableCondition ∧ S.feedbackStabilizingGainExists ∧ S.lyapunovFunctionExists

theorem stabilizability_closed_from_evidence {M : DiscreteTimeSystemModel}
    (S : StabilizabilityPackage M) (E : StabilizabilityEvidence S) : StabilizabilityClosed S := by
  exact And.intro E.stabilizableConditionClosed
    (And.intro E.feedbackStabilizingGainExistsClosed E.lyapunovFunctionExistsClosed)

structure DetectabilityPackage {M : DiscreteTimeSystemModel} where
  detectableCondition : Prop
  observerGainExists : Prop
  errorDynamicsStable : Prop

structure DetectabilityEvidence {M : DiscreteTimeSystemModel} (D : DetectabilityPackage M) where
  detectableConditionClosed : D.detectableCondition
  observerGainExistsClosed : D.observerGainExists
  errorDynamicsStableClosed : D.errorDynamicsStable

def DetectabilityClosed {M : DiscreteTimeSystemModel} (D : DetectabilityPackage M) : Prop :=
  D.detectableCondition ∧ D.observerGainExists ∧ D.errorDynamicsStable

theorem detectability_closed_from_evidence {M : DiscreteTimeSystemModel}
    (D : DetectabilityPackage M) (E : DetectabilityEvidence D) : DetectabilityClosed D := by
  exact And.intro E.detectableConditionClosed
    (And.intro E.observerGainExistsClosed E.errorDynamicsStableClosed)

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse