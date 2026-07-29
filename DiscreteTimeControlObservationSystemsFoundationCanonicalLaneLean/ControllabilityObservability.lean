import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean.DiscreteTimeSystemModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean

structure ControllabilityPackage {M : DiscreteTimeSystemModel} where
  reachableSetDefined : Prop
  controllabilityCondition : Prop
  controllabilityGramianInvertible : Prop

structure ControllabilityEvidence {M : DiscreteTimeSystemModel} (C : ControllabilityPackage M) where
  reachableSetDefinedClosed : C.reachableSetDefined
  controllabilityConditionClosed : C.controllabilityCondition
  controllabilityGramianInvertibleClosed : C.controllabilityGramianInvertible

def ControllabilityClosed {M : DiscreteTimeSystemModel} (C : ControllabilityPackage M) : Prop :=
  C.reachableSetDefined ∧ C.controllabilityCondition ∧ C.controllabilityGramianInvertible

theorem controllability_closed_from_evidence {M : DiscreteTimeSystemModel}
    (C : ControllabilityPackage M) (E : ControllabilityEvidence C) : ControllabilityClosed C := by
  exact And.intro E.reachableSetDefinedClosed
    (And.intro E.controllabilityConditionClosed E.controllabilityGramianInvertibleClosed)

structure ObservabilityPackage {M : DiscreteTimeSystemModel} where
  observabilityMapDefined : Prop
  observabilityCondition : Prop
  observabilityGramianInvertible : Prop

structure ObservabilityEvidence {M : DiscreteTimeSystemModel} (O : ObservabilityPackage M) where
  observabilityMapDefinedClosed : O.observabilityMapDefined
  observabilityConditionClosed : O.observabilityCondition
  observabilityGramianInvertibleClosed : O.observabilityGramianInvertible

def ObservabilityClosed {M : DiscreteTimeSystemModel} (O : ObservabilityPackage M) : Prop :=
  O.observabilityMapDefined ∧ O.observabilityCondition ∧ O.observabilityGramianInvertible

theorem observability_closed_from_evidence {M : DiscreteTimeSystemModel}
    (O : ObservabilityPackage M) (E : ObservabilityEvidence O) : ObservabilityClosed O := by
  exact And.intro E.observabilityMapDefinedClosed
    (And.intro E.observabilityConditionClosed E.observabilityGramianInvertibleClosed)

end DiscreteTimeControlObservationSystemsFoundationCanonicalLaneLean
end HautevilleHouse