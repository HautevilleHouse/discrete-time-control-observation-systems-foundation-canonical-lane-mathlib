import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

def ConstrainedObservationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_observation_endgame (A : AdmissibleClass) : ConstrainedObservationClosure A :=
  by
    exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse