import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure KalmanDecomposition (S : DiscreteTimeSystem) (C : ControllabilityPackage S) (O : ObservabilityPackage S) where
  controllableObservableSubspace : Submodule (Ring?) S.stateSpace
  controllableUnobservableSubspace : Submodule (Ring?) S.stateSpace
  uncontrollableObservableSubspace : Submodule (Ring?) S.stateSpace
  uncontrollableUnobservableSubspace : Submodule (Ring?) S.stateSpace
  invariantDecomposition : Prop

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse