import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure DiscreteTimeSystem where
  StateSpace : Type u
  ObservationSpace : Type v
  stateTransition : StateSpace → StateSpace
  observationMap : StateSpace → ObservationSpace
  timeSteps : ℕ

structure ObservabilityGramianPackage (S : DiscreteTimeSystem) where
  gramianMatrix : Type w
  rankFull : Prop
  detectionTime : ℕ
  rankFullTerm : rankFull

def ObservableClosed (S : DiscreteTimeSystem) (G : ObservabilityGramianPackage S) : Prop :=
  G.rankFull

theorem observable_closed_from_package (S : DiscreteTimeSystem) (G : ObservabilityGramianPackage S) : ObservableClosed S G :=
  G.rankFullTerm

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse