import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure StochasticObservationPackage {S : DiscreteTimeSystem} where
  noiseProcess : Type u
  measurementNoiseCovariance : Type v
  stateNoiseCovariance : Type w
  kalmanGain : Type x
  innovationSequence : Prop
  optimalFilterRecursion : Prop
  innovationSequenceTerm : innovationSequence
  optimalFilterRecursionTerm : optimalFilterRecursion

def StochasticObservationClosed {S : DiscreteTimeSystem} (St : StochasticObservationPackage S) : Prop :=
  St.innovationSequence ∧ St.optimalFilterRecursion

theorem stochastic_observation_closed_from_package {S : DiscreteTimeSystem} (St : StochasticObservationPackage S) : StochasticObservationClosed St :=
  by
    exact And.intro St.innovationSequenceTerm St.optimalFilterRecursionTerm

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse