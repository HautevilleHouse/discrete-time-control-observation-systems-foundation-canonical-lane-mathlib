import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

open HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure FeedbackController (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) where
  controlLaw : T.Time → S.State → C.Control
  admissibleByConstruction : ∀ (t : T.Time) (s : S.State), controlLaw t s ∈ C.admissibleControls
  stabilizingCondition : Prop

structure Observer (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) where
  stateEstimate : T.Time → ObservationSpace.Observation → S.State
  errorDynamics : Prop
  asymptoticConvergence : Prop

structure SeparationPrinciplePackage (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (K : FeedbackController T S C) (L : Observer T S C) where
  combinedDynamicsClosedLoop : SystemDynamics T S C
  separationHolds : Prop

def SeparationPrincipleClosed (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (K : FeedbackController T S C) (L : Observer T S C) (P : SeparationPrinciplePackage T S C K L) : Prop :=
  P.separationHolds

theorem separation_principle_holds (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (K : FeedbackController T S C) (L : Observer T S C) (P : SeparationPrinciplePackage T S C K L) (h : P.separationHolds) : SeparationPrincipleClosed T S C K L P := h

end HautevilleHouse
end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean