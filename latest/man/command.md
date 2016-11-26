
<a id='Index-1'></a>

### Index

- [`ClinicalTrialSampleSize.McNemarProp`](command.md#ClinicalTrialSampleSize.McNemarProp)
- [`ClinicalTrialSampleSize.OneSampleMean`](command.md#ClinicalTrialSampleSize.OneSampleMean)
- [`ClinicalTrialSampleSize.OneSampleMeanEqual`](command.md#ClinicalTrialSampleSize.OneSampleMeanEqual)
- [`ClinicalTrialSampleSize.OneSampleMeanInferior`](command.md#ClinicalTrialSampleSize.OneSampleMeanInferior)
- [`ClinicalTrialSampleSize.OneSampleMeanSuperior`](command.md#ClinicalTrialSampleSize.OneSampleMeanSuperior)
- [`ClinicalTrialSampleSize.OneSampleProp`](command.md#ClinicalTrialSampleSize.OneSampleProp)
- [`ClinicalTrialSampleSize.OneSamplePropEqual`](command.md#ClinicalTrialSampleSize.OneSamplePropEqual)
- [`ClinicalTrialSampleSize.OneSamplePropInferior`](command.md#ClinicalTrialSampleSize.OneSamplePropInferior)
- [`ClinicalTrialSampleSize.OneSamplePropSuperior`](command.md#ClinicalTrialSampleSize.OneSamplePropSuperior)
- [`ClinicalTrialSampleSize.TwoSampleMean`](command.md#ClinicalTrialSampleSize.TwoSampleMean)
- [`ClinicalTrialSampleSize.TwoSampleMeanEqual`](command.md#ClinicalTrialSampleSize.TwoSampleMeanEqual)
- [`ClinicalTrialSampleSize.TwoSampleMeanInferior`](command.md#ClinicalTrialSampleSize.TwoSampleMeanInferior)
- [`ClinicalTrialSampleSize.TwoSampleMeanSuperior`](command.md#ClinicalTrialSampleSize.TwoSampleMeanSuperior)
- [`ClinicalTrialSampleSize.TwoSampleProp`](command.md#ClinicalTrialSampleSize.TwoSampleProp)
- [`ClinicalTrialSampleSize.TwoSamplePropEqual`](command.md#ClinicalTrialSampleSize.TwoSamplePropEqual)
- [`ClinicalTrialSampleSize.TwoSamplePropInferior`](command.md#ClinicalTrialSampleSize.TwoSamplePropInferior)
- [`ClinicalTrialSampleSize.TwoSamplePropSuperior`](command.md#ClinicalTrialSampleSize.TwoSamplePropSuperior)
- [`ClinicalTrialSampleSize.analytic_power`](command.md#ClinicalTrialSampleSize.analytic_power-Tuple{T<:ClinicalTrialSampleSize.TrialTest})
- [`ClinicalTrialSampleSize.power`](command.md#ClinicalTrialSampleSize.power-Tuple{T<:ClinicalTrialSampleSize.TrialTest})
- [`ClinicalTrialSampleSize.sample_size`](command.md#ClinicalTrialSampleSize.sample_size-Tuple{T<:ClinicalTrialSampleSize.TrialTest})

<a id='ClinicalTrialSampleSize.McNemarProp' href='#ClinicalTrialSampleSize.McNemarProp'>#</a>
**`ClinicalTrialSampleSize.McNemarProp`** &mdash; *Type*.



```julia
type McNemarProp <: ClinicalTrialSampleSize.TrialTest
```

Paired sample test for proportion

**Constructors**

  * `McNemarProp(p1::Real, p2::Real)`

**Arguments**

  * `p1`: Proportion for cell of no event - event
  * `p2`: Proportion for cell of event - no event

**Fields**

  * `p1`
  * `p2`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/McNemarProp.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSampleMean' href='#ClinicalTrialSampleSize.OneSampleMean'>#</a>
**`ClinicalTrialSampleSize.OneSampleMean`** &mdash; *Type*.



```julia
type OneSampleMean <: ClinicalTrialSampleSize.TrialTest
```

One sample test for mean

**Constructors**

  * `OneSampleMean(mu1::Real, mu0::Real)`

**Arguments**

  * `mu1`: True mean
  * `mu0`: Mean under null hypothesis

**Fields**

  * `mu1`
  * `mu0`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSampleMean.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSampleMeanEqual' href='#ClinicalTrialSampleSize.OneSampleMeanEqual'>#</a>
**`ClinicalTrialSampleSize.OneSampleMeanEqual`** &mdash; *Type*.



```julia
type OneSampleMeanEqual <: ClinicalTrialSampleSize.TrialTest
```

One sample equivalence test for mean

**Constructors**

  * `OneSampleMeanEqual(mu1::Real, mu0::Real, delta::Real)`

**Arguments**

  * `mu1`: True mean
  * `mu0`: Mean under null hypothesis
  * `delta`: Superiority Margin

**Fields**

  * `mu1`
  * `mu0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSampleMeanEqual.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSampleMeanInferior' href='#ClinicalTrialSampleSize.OneSampleMeanInferior'>#</a>
**`ClinicalTrialSampleSize.OneSampleMeanInferior`** &mdash; *Type*.



```julia
type OneSampleMeanInferior <: ClinicalTrialSampleSize.TrialTest
```

One sample non-inferiority test for mean

**Constructors**

  * `OneSampleMeanInferior(mu1::Real, mu0::Real, delta::Real)`

**Arguments**

  * `mu1`: True mean
  * `mu0`: Mean under null hypothesis
  * `delta`: Non-inferiority margin

**Fields**

  * `mu1`
  * `mu0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSampleMeanInferior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSampleMeanSuperior' href='#ClinicalTrialSampleSize.OneSampleMeanSuperior'>#</a>
**`ClinicalTrialSampleSize.OneSampleMeanSuperior`** &mdash; *Type*.



```julia
type OneSampleMeanSuperior <: ClinicalTrialSampleSize.TrialTest
```

One sample superiority test for Mean

**Constructors**

  * `OneSampleMeanSuperior(mu1::Real, mu0::Real, delta::Real)`

**Arguments**

  * `mu1`: True mean
  * `mu0`: Mean under null hypothesis
  * `delta`: Superiority margin

**Fields**

  * `mu1`
  * `mu0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSampleMeanSuperior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSampleProp' href='#ClinicalTrialSampleSize.OneSampleProp'>#</a>
**`ClinicalTrialSampleSize.OneSampleProp`** &mdash; *Type*.



```julia
type OneSampleProp <: ClinicalTrialSampleSize.TrialTest
```

One sample test for proportion

**Constructors**

  * `OneSampleProp(p1::Real, p0::Real)`

**Arguments**

  * `p1`: True proportion
  * `p0`: Proportion under null hypothesis

**Fields**

  * `p1`
  * `p0`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSampleProp.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSamplePropEqual' href='#ClinicalTrialSampleSize.OneSamplePropEqual'>#</a>
**`ClinicalTrialSampleSize.OneSamplePropEqual`** &mdash; *Type*.



```julia
type OneSamplePropEqual <: ClinicalTrialSampleSize.TrialTest
```

One sample equivalence test for proportion

**Constructors**

  * `OneSamplePropEqual(p1::Real, p0::Real, delta::Real)`

**Arguments**

  * `p1`: True proportion
  * `p0`: Proportion under null hypothesis
  * `delta`: Superiority Margin

**Fields**

  * `p1`
  * `p0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSamplePropEqual.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSamplePropInferior' href='#ClinicalTrialSampleSize.OneSamplePropInferior'>#</a>
**`ClinicalTrialSampleSize.OneSamplePropInferior`** &mdash; *Type*.



```julia
type OneSamplePropInferior <: ClinicalTrialSampleSize.TrialTest
```

One sample non-inferiority test for proportion

**Constructors**

  * `OneSamplePropInferior(p1::Real, p0::Real, delta::Real)`

**Arguments**

  * `p1`: True proportion
  * `p0`: Proportion under null hypothesis
  * `delta`: Non-inferiority margin

**Fields**

  * `p1`
  * `p0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSamplePropInferior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.OneSamplePropSuperior' href='#ClinicalTrialSampleSize.OneSamplePropSuperior'>#</a>
**`ClinicalTrialSampleSize.OneSamplePropSuperior`** &mdash; *Type*.



```julia
type OneSamplePropSuperior <: ClinicalTrialSampleSize.TrialTest
```

One sample superiority test for proportion

**Constructors**

  * `OneSamplePropSuperior(p1::Real, p0::Real, delta::Real)`

**Arguments**

  * `p1`: True proportion
  * `p0`: Proportion under null hypothesis
  * `delta`: Superiority margin

**Fields**

  * `p1`
  * `p0`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/OneSampleTest/OneSamplePropSuperior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSampleMean' href='#ClinicalTrialSampleSize.TwoSampleMean'>#</a>
**`ClinicalTrialSampleSize.TwoSampleMean`** &mdash; *Type*.



```julia
type TwoSampleMean <: ClinicalTrialSampleSize.TrialTest
```

two sample test for mean

**Constructors**

  * `TwoSampleMean(mu1::Real, mu2::Real)`

**Arguments**

  * `mu1`: Mean of group 1
  * `mu2`: Mean of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

**Fields**

  * `mu1`
  * `mu2`
  * `k`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSampleMean.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSampleMeanEqual' href='#ClinicalTrialSampleSize.TwoSampleMeanEqual'>#</a>
**`ClinicalTrialSampleSize.TwoSampleMeanEqual`** &mdash; *Type*.



```julia
type TwoSampleMeanEqual <: ClinicalTrialSampleSize.TrialTest
```

Two sample equivalence test for mean

**Constructors**

  * `TwoSampleMeanEqual(mu1::Real, mu2::Real, k::Real, delta::Real)`

**Arguments**

  * `mu1`: Mean of group 1
  * `mu2`: Mean of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Non-inferiority/Superiority Margin

**Fields**

  * `mu1`
  * `mu2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSampleMeanEqual.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSampleMeanInferior' href='#ClinicalTrialSampleSize.TwoSampleMeanInferior'>#</a>
**`ClinicalTrialSampleSize.TwoSampleMeanInferior`** &mdash; *Type*.



```julia
type TwoSampleMeanInferior <: ClinicalTrialSampleSize.TrialTest
```

Two sample non-inferiority test for Mean

**Constructors**

  * `TwoSampleMeanInferior(mu1::Real, mu2::Real, k::Real, delta::Real)`

**Arguments**

  * `mu1`: Mean of group 1
  * `mu2`: Mean of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Non-inferiority Margin

**Fields**

  * `mu1`
  * `mu2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSampleMeanInferior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSampleMeanSuperior' href='#ClinicalTrialSampleSize.TwoSampleMeanSuperior'>#</a>
**`ClinicalTrialSampleSize.TwoSampleMeanSuperior`** &mdash; *Type*.



```julia
type TwoSampleMeanSuperior <: ClinicalTrialSampleSize.TrialTest
```

Two sample superiority test for Mean

**Constructors**

  * `TwoSampleMeanSuperior(mu1::Real, mu2::Real, k::Real, delta::Real)`

**Arguments**

  * `mu1`: Mean of group 1
  * `mu2`: Mean of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Superiority Margin

**Fields**

  * `mu1`
  * `mu2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSampleMeanSuperior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSampleProp' href='#ClinicalTrialSampleSize.TwoSampleProp'>#</a>
**`ClinicalTrialSampleSize.TwoSampleProp`** &mdash; *Type*.



```julia
type TwoSampleProp <: ClinicalTrialSampleSize.TrialTest
```

Two sample test for proportion

**Constructors**

  * `TwoSampleProp(p1::Real, p2::Real, k::Real)`

**Arguments**

  * `p1`: Proportion of group 1
  * `p2`: Proportion of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

**Fields**

  * `p1`
  * `p2`
  * `k`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSampleProp.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSamplePropEqual' href='#ClinicalTrialSampleSize.TwoSamplePropEqual'>#</a>
**`ClinicalTrialSampleSize.TwoSamplePropEqual`** &mdash; *Type*.



```julia
type TwoSamplePropEqual <: ClinicalTrialSampleSize.TrialTest
```

Two sample equivalence test for proportion

**Constructors**

  * `TwoSamplePropEqual(p1::Real, p2::Real, k::Real, delta::Real)`

**Arguments**

  * `p1`: Proportion of group 1
  * `p2`: Proportion of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Superiority Margin

**Fields**

  * `p1`
  * `p2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSamplePropEqual.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSamplePropInferior' href='#ClinicalTrialSampleSize.TwoSamplePropInferior'>#</a>
**`ClinicalTrialSampleSize.TwoSamplePropInferior`** &mdash; *Type*.



```julia
type TwoSamplePropInferior <: ClinicalTrialSampleSize.TrialTest
```

Two sample non-inferiority test for proportion

**Constructors**

  * `TwoSamplePropInferior(p1::Real, p2::Real, k::Real, delta::Real)`

**Arguments**

  * `p1`: Proportion of group 1
  * `p2`: Proportion of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Non-inferiority Margin

**Fields**

  * `p1`
  * `p2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSamplePropInferior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.TwoSamplePropSuperior' href='#ClinicalTrialSampleSize.TwoSamplePropSuperior'>#</a>
**`ClinicalTrialSampleSize.TwoSamplePropSuperior`** &mdash; *Type*.



```julia
type TwoSamplePropSuperior <: ClinicalTrialSampleSize.TrialTest
```

Two sample superiority test for proportion

**Constructors**

  * `TwoSamplePropSuperior(p1::Real, p2::Real, k::Real, delta::Real)`

**Arguments**

  * `p1`: Proportion of group 1
  * `p2`: Proportion of group 2
  * `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)
  * `delta`: Non-inferiority Margin

**Fields**

  * `p1`
  * `p2`
  * `k`
  * `delta`


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/TwoSampleTest/TwoSamplePropSuperior.jl#L1' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.analytic_power-Tuple{T<:ClinicalTrialSampleSize.TrialTest}' href='#ClinicalTrialSampleSize.analytic_power-Tuple{T<:ClinicalTrialSampleSize.TrialTest}'>#</a>
**`ClinicalTrialSampleSize.analytic_power`** &mdash; *Method*.



```julia
analytic_power(test)

```

Compute the power of the trial without checking arguments, given the sample size, desired type I error rate and effect size.

**Arguments**

  * `Test` – The test for calculating the power
  * `n` – Sample size
  * `std` – Standard deviation
  * `alpha` – Desired type I error rate
  * `side` – Side of the test, "two" is two-sided, "one" is one-sided


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/CalPower.jl#L32-L45' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.power-Tuple{T<:ClinicalTrialSampleSize.TrialTest}' href='#ClinicalTrialSampleSize.power-Tuple{T<:ClinicalTrialSampleSize.TrialTest}'>#</a>
**`ClinicalTrialSampleSize.power`** &mdash; *Method*.



```julia
power(test)

```

Compute the power of the trial, given the sample size, desired type I error rate and effect size.

**Arguments**

  * `Test` – The test for calculating the power
  * `n` – Sample size
  * `std` – Standard deviation
  * `alpha` – Desired type I error rate
  * `side` – Side of the test, "two" is two-sided, "one" is one-sided


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/CalPower.jl#L1-L14' class='documenter-source'>source</a><br>

<a id='ClinicalTrialSampleSize.sample_size-Tuple{T<:ClinicalTrialSampleSize.TrialTest}' href='#ClinicalTrialSampleSize.sample_size-Tuple{T<:ClinicalTrialSampleSize.TrialTest}'>#</a>
**`ClinicalTrialSampleSize.sample_size`** &mdash; *Method*.



```julia
sample_size(test)

```

Compute the minimum sample size needed for the desired power, type I error rate and effect size

**Arguments**

  * `Test` – The test for calculating the power
  * `std` – Standard deviation
  * `power` – Power
  * `alpha` – Desired type I error rate
  * `side` – Side of the test, "two" is two-sided, "one" is one-sided


<a target='_blank' href='https://github.com/ContaTP/ClinicalTrialSampleSize.jl/tree/a15317eba6b0b0318dfad18602aa99baf84224c5/src/CalSampleSize.jl#L1' class='documenter-source'>source</a><br>

