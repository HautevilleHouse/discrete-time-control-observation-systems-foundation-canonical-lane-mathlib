import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.KalmanFilter
import HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.ControlDesign

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure LQGControlPackage {S : StateSpaceModel} (K : KalmanFilterPackage S) (C : ControlDesignPackage S) where
  separationPrinciple : Prop
  combinedController : S.stateSpace → S.controlSpace := λ x => C.feedbackLaw (K.updateStep x (default)) -- simplified
  optimalityClosed : Prop

structure LQGControlEvidence {S : StateSpaceModel} {K : KalmanFilterPackage S} {C : ControlDesignPackage S} (L : LQGControlPackage K C) where
  separationPrincipleClosed : L.separationPrinciple
  optimalityClosed : L.optimalityClosed

def LQGControlClosed {S : StateSpaceModel} {K : KalmanFilterPackage S} {C : ControlDesignPackage S} (L : LQGControlPackage K C) : Prop :=
  L.separationPrinciple ∧ L.optimalityClosed

theorem lqg_control_closed_from_evidence {S : StateSpaceModel} {K : KalmanFilterPackage S} {C : ControlDesignPackage S} (L : LQGControlPackage K C) (E : LQGControlEvidence L) : LQGControlClosed L := by
  exact And.intro E.separationPrincipleClosed E.optimalityClosed

end HautevilleHouse
end HautevilleHouse
