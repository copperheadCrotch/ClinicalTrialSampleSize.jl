# ClinicalTrialSampleSize.jl

A Julia package to calculate sample size/power for clinical trials.

## Installation

```julia
    Pkg.add("ClinicalTrialSampleSize")
```

## Usage

See the [Usage](man/usage.md).

# Dependencies

* Distributions.jl
* Roots.jl
* DocStringExtensions.jl

# Support calculations

| Sample        | Test          |
| ------------- |:-------------:|
| One-Sample    | Mean, Proportion, Non-inferiority, Superiority, Equivalence |
| Two-Sample    | Mean, Proportion, Non-inferiority, Superiority, Equivalence, McNemar's |

# Acknowledgements

Part of the work refers to John Myles White's work on [PowerAnalysis.jl](https://github.com/johnmyleswhite/PowerAnalysis.jl)

# References

Rosner B. 2010. *Fundamentals of Biostatistics*. 7th Ed. Brooks/Cole

Chow S, Shao J, Wang H. 2008. *Sample Size Calculations in Clinical Research*. 2nd Ed. Chapman & Hall/CRC Biostatistics Series.

## Index

```@index
Pages = ["man/command.md"]
```
