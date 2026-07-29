import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure ObserverDesignPackage {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} {D : DetectabilityDecompositionPackage O} where
  gainMatrix : Type w
  errorDynamicsStable : Prop
  reconstructionError : Prop
  convergenceRate : Prop
  gainMatrixTerm : gainMatrix
  errorDynamicsStableTerm : errorDynamicsStable
  reconstructionErrorTerm : reconstructionError
  convergenceRateTerm : convergenceRate

def ObserverClosed {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} {D : DetectabilityDecompositionPackage O} (Obs : ObserverDesignPackage S O D) : Prop :=
  Obs.errorDynamicsStable ∧ Obs.reconstructionError ∧ Obs.convergenceRate

theorem observer_closed_from_package {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} {D : DetectabilityDecompositionPackage O} (Obs : ObserverDesignPackage S O D) : ObserverClosed Obs :=
  by
    exact And.intro Obs.errorDynamicsStableTerm (And.intro Obs.reconstructionErrorTerm Obs.convergenceRateTerm)

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse