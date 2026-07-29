import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.DiscreteTimeSystemModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure KalmanFilterPackage {M : DiscreteTimeSystemModel} where
  filterEquationsDefined : Prop
  predictionStepDefined : Prop
  updateStepDefined : Prop
  optimalityGuaranteed : Prop
  errorCovariancePropagated : Prop

structure KalmanFilterEvidence {M : DiscreteTimeSystemModel} (K : KalmanFilterPackage M) where
  filterEquationsDefinedClosed : K.filterEquationsDefined
  predictionStepDefinedClosed : K.predictionStepDefined
  updateStepDefinedClosed : K.updateStepDefined
  optimalityGuaranteedClosed : K.optimalityGuaranteed
  errorCovariancePropagatedClosed : K.errorCovariancePropagated

def KalmanFilterClosed {M : DiscreteTimeSystemModel} (K : KalmanFilterPackage M) : Prop :=
  K.filterEquationsDefined ∧ K.predictionStepDefined ∧ K.updateStepDefined ∧
  K.optimalityGuaranteed ∧ K.errorCovariancePropagated

theorem kalman_filter_closed_from_evidence {M : DiscreteTimeSystemModel}
    (K : KalmanFilterPackage M) (E : KalmanFilterEvidence K) : KalmanFilterClosed K := by
  exact And.intro E.filterEquationsDefinedClosed
    (And.intro E.predictionStepDefinedClosed
      (And.intro E.updateStepDefinedClosed
        (And.intro E.optimalityGuaranteedClosed E.errorCovariancePropagatedClosed)))

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse