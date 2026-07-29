import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure OutputFeedbackControlPackage {S : DiscreteTimeSystem} (Obs : ObserverDesignPackage S O D) where
  feedbackGain : Type u
  closedLoopStability : Prop
  separationPrinciple : Prop
  closedLoopStabilityTerm : closedLoopStability
  separationPrincipleTerm : separationPrinciple

def OutputFeedbackClosed {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} {D : DetectabilityDecompositionPackage O} (Obs : ObserverDesignPackage S O D) (Fb : OutputFeedbackControlPackage S Obs) : Prop :=
  Fb.closedLoopStability ∧ Fb.separationPrinciple

theorem output_feedback_closed_from_package {S : DiscreteTimeSystem} {O : ObservabilityGramianPackage S} {D : DetectabilityDecompositionPackage O} {Obs : ObserverDesignPackage S O D} (Fb : OutputFeedbackControlPackage S Obs) : OutputFeedbackClosed Obs Fb :=
  by
    exact And.intro Fb.closedLoopStabilityTerm Fb.separationPrincipleTerm

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse