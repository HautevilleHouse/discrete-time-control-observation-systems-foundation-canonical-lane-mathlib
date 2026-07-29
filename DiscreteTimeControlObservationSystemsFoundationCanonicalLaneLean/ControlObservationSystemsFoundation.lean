import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure DiscreteTimeDomain where
  Time : Type u
  nextTime : Time → Time
  initialTime : Time
  initialTimeNotReached : ∀ t : Time, nextTime t ≠ t
  discreteOrder : Prop

structure StateSpace where
  State : Type
  transition : State → State
  admissibleInitialStates : Set State
  stateSpaceTopological : Prop

structure ObservationSpace where
  Observation : Type
  observationFunction : StateSpace.State → Observation
  observationSpaceMeasurable : Prop

structure ControlSpace where
  Control : Type
  admissibleControls : Set Control
  controlSpaceTopological : Prop

structure SystemDynamics (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) where
  stateTransition : T.Time → S.State → C.Control → S.State
  outputMap : T.Time → S.State → ObservationSpace.Observation
  initialCondition : S.State
  initialConditionAdmissible : initialCondition ∈ S.admissibleInitialStates
  deterministicDynamics : ∀ (t : T.Time) (s : S.State) (u : C.Control), stateTransition t s u ∈ S.State

def DynamicsClosed (T : DiscreteTimeDomain) (S : StateSpace) (C : ControlSpace) (D : SystemDynamics T S C) : Prop :=
  D.initialConditionAdmissible ∧ D.deterministicDynamics

end HautevilleHouse
end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean