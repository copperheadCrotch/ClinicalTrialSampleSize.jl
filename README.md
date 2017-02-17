ClinicalTrialSampleSize
=========================

[![Build Status](https://travis-ci.org/ContaTP/ClinicalTrialSampleSize.jl.svg?branch=master)](https://travis-ci.org/ContaTP/ClinicalTrialSampleSize.jl)
[![Coverage Status](https://coveralls.io/repos/github/ContaTP/ClinicalTrialSampleSize.jl/badge.svg?branch=master)](https://coveralls.io/github/ContaTP/ClinicalTrialSampleSize.jl?branch=master)
[![codecov.io](http://codecov.io/github/ContaTP/ClinicalTrialSampleSize.jl/coverage.svg?branch=master)](http://codecov.io/github/ContaTP/ClinicalTrialSampleSize.jl?branch=master)

[![ClinicalTrialSampleSize](http://pkg.julialang.org/badges/ClinicalTrialSampleSize_0.5.svg)](http://pkg.julialang.org/?pkg=ClinicalTrialSampleSize)
[![ClinicalTrialSampleSize](http://pkg.julialang.org/badges/ClinicalTrialSampleSize_0.6.svg)](http://pkg.julialang.org/?pkg=ClinicalTrialSampleSize)

Julia package to calculate power and sample size for different clinical trial designs.


### Documentation
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://contatp.github.io/ClinicalTrialSampleSize.jl/latest)


### Dependencies

* Distributions.jl
* Roots.jl
* DocStringExtensions.jl


### Support calculations


| Sample        | Test          |
| ------------- |:-------------:|
| One-Sample    | Mean, Proportion, Non-inferiority, Superiority, Equivalence |
| Two-Sample    | Mean, Proportion, Non-inferiority, Superiority, Equivalence, McNemar's, Crossover|

Part of the work refers to John Myles White's work on [PowerAnalysis.jl](https://github.com/johnmyleswhite/PowerAnalysis.jl)

### References


Rosner B. 2010. *Fundamentals of Biostatistics*. 7th Ed. Brooks/Cole

Chow S, Shao J, Wang H. 2008. *Sample Size Calculations in Clinical Research*. 2nd Ed. Chapman & Hall/CRC Biostatistics Series.
