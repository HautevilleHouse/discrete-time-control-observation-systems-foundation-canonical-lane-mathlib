import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure StateSpaceModel where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  stateTransition : stateSpace → controlSpace → stateSpace
  observationFunction : stateSpace → observationSpace
  initialDistribution : stateSpace → Prop

structure StateSpaceModelEvidence (S : StateSpaceModel) where
  stateTransitionClosed : ∀ (x : S.stateSpace) (u : S.controlSpace), S.initialDistribution x → S.initialDistribution (S.stateTransition x u)
  observationFunctionClosed : ∀ (x : S.stateSpace), S.initialDistribution x → True

def StateSpaceModelClosed (S : StateSpaceModel) : Prop :=
  ∀ (x : S.stateSpace) (u : S.controlSpace), S.initialDistribution x → S.initialDistribution (S.stateTransition x u)

theorem state_space_model_closed_from_evidence (S : StateSpaceModel) (E : StateSpaceModelEvidence S) : StateSpaceModelClosed S := by
  intro x u h
  exact E.stateTransitionClosed x u h

end HautevilleHouse
end HautevilleHouse
