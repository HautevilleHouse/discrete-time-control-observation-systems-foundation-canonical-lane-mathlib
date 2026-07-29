import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure ControlDesignPackage {S : StateSpaceModel} where
  feedbackLaw : S.stateSpace → S.controlSpace
  costFunction : S.stateSpace → S.controlSpace → ℝ
  optimalityCondition : ∀ (x : S.stateSpace), costFunction x (feedbackLaw x) ≤ costFunction x u for all u
  stabilityGuarantee : ∀ (x : S.stateSpace), limsup_{k→∞} ‖S.stateTransition^k x‖ < ∞

structure ControlDesignEvidence {S : StateSpaceModel} (C : ControlDesignPackage S) where
  feedbackLawClosed : True
  costFunctionClosed : True
  optimalityConditionClosed : C.optimalityCondition
  stabilityGuaranteeClosed : C.stabilityGuarantee

def ControlDesignClosed {S : StateSpaceModel} (C : ControlDesignPackage S) : Prop :=
  C.optimalityCondition ∧ C.stabilityGuarantee

theorem control_design_closed_from_evidence {S : StateSpaceModel} (C : ControlDesignPackage S) (E : ControlDesignEvidence C) : ControlDesignClosed C := by
  exact And.intro E.optimalityConditionClosed E.stabilityGuaranteeClosed

end HautevilleHouse
end HautevilleHouse
