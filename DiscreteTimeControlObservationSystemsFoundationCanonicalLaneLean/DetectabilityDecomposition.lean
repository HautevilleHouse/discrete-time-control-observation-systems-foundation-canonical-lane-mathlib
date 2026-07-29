import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure DetectabilityDecompositionPackage {S : DiscreteTimeSystem} (O : ObservabilityGramianPackage S) where
  unobservableSubspace : Prop
  detectableModes : Prop
  stableUnobservablePart : Prop
  detectableSubspaceCover : Prop
  unobservableSubspaceTerm : unobservableSubspace
  detectableModesTerm : detectableModes
  stableUnobservablePartTerm : stableUnobservablePart
  detectableSubspaceCoverTerm : detectableSubspaceCover

def DetectabilityClosed {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} (D : DetectabilityDecompositionPackage O) : Prop :=
  D.unobservableSubspace ∧ D.detectableModes ∧ D.stableUnobservablePart ∧ D.detectableSubspaceCover

theorem detectability_closed_from_package {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} (D : DetectabilityDecompositionPackage O) : DetectabilityClosed D :=
  by
    exact And.intro D.unobservableSubspaceTerm (And.intro D.detectableModesTerm (And.intro D.stableUnobservablePartTerm D.detectableSubspaceCoverTerm))

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse