import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure LinearQuadraticRegulator (S : DiscreteTimeSystem) where
  costStateWeight : LinearMap (Ring?) S.stateSpace (Ring?) S.stateSpace?
  costControlWeight : LinearMap (Ring?) (ControlSpace?) (Ring?) (ControlSpace?)?
  optimalControl : (Nat -> S.stateSpace) -> (Nat -> ControlSpace?) 
  optimalCost : S.stateSpace -> Nat -> Real
  algebraicRiccatiEquation : Prop
  closedLoopStability : Prop

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse