__precompile__()

module ClinicalTrialSampleSize

using Distributions
using DocStringExtensions
using Roots

# Abstract Types
# One sample test
abstract TrialTest
# abstract OneSampleSize <: TrialTest
# abstract TwoSampleSize <: TrialTest

# Export types
export
    OneSampleMean,
    OneSampleMeanInferior,
    OneSampleMeanSuperior,
    OneSampleMeanEqual,
    OneSampleProp,
    OneSamplePropInferior,
    OneSamplePropSuperior,
    OneSamplePropEqual,
    TwoSampleMean,
    TwoSampleMeanInferior,
    TwoSampleMeanSuperior,
    TwoSampleMeanEqual,
    TwoSampleProp,
    TwoSamplePropInferior,
    TwoSamplePropSuperior,
    TwoSamplePropEqual,
    McNemarProp

# Export functions
export
    power,
    sample_size,
    analytic_power

const MAXSAMPLESIZE = 1.0e6
const ZDIST = Normal(0, 1)

include("CalPower.jl")
include("CalSampleSize.jl")
include("CheckArgs.jl")
include("OneSampleTest/OneSampleMean.jl")
include("OneSampleTest/OneSampleMeanInferior.jl")
include("OneSampleTest/OneSampleMeanSuperior.jl")
include("OneSampleTest/OneSampleMeanEqual.jl")
include("OneSampleTest/OneSampleProp.jl")
include("OneSampleTest/OneSamplePropInferior.jl")
include("OneSampleTest/OneSamplePropSuperior.jl")
include("OneSampleTest/OneSamplePropEqual.jl")
include("TwoSampleTest/TwoSampleMean.jl")
include("TwoSampleTest/TwoSampleMeanInferior.jl")
include("TwoSampleTest/TwoSampleMeanSuperior.jl")
include("TwoSampleTest/TwoSampleMeanEqual.jl")
include("TwoSampleTest/TwoSampleProp.jl")
include("TwoSampleTest/TwoSamplePropInferior.jl")
include("TwoSampleTest/TwoSamplePropSuperior.jl")
include("TwoSampleTest/TwoSamplePropEqual.jl")
include("TwoSampleTest/McNemarProp.jl")
# include("PrintTrialSSResult.jl")

end
