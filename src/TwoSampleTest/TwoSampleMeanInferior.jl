"""
$(TYPEDEF)

Two sample non-inferiority test for Mean

Constructors
------------
* `TwoSampleMeanInferior(mu1::Real, mu2::Real, k::Real, delta::Real)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

* `delta`: Non-inferiority Margin

Fields
------
$(FIELDS)
"""
type TwoSampleMeanInferior <: TrialTest
    mu1::Real
    mu2::Real
    k::Real
    delta::Real

    # Validator
    function TwoSampleMeanInferior(mu1, mu2, k, delta)

      if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

          error("Mean value must be in (-Inf, Inf)")

      end # end if

      if !(0 < k < Inf)

          error("Allocation ratio must be in (0, Inf)")

      end # end if

      if !(-Inf < delta < 0)

          error("The non-inferiority margin δ must be in (-Inf , 0)")

      end # end if
      new(mu1, mu2, k, delta)

    end # end function

end # end type


# Two-sample non-inferiority test for mean, equal standard deviaiton
function hypotheses{T <: TwoSampleMeanInferior}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu2 - test.delta
    se = sqrt(1 / n + 1 / (test.k * n)) * std
    z = diff / se
    p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    # power_result(test, p)
    return p

end # end function


# Two-sample non-inferiority test for mean, unequal standard deviaiton
function hypotheses{T <: TwoSampleMeanInferior}(test::T, n::Real, std::Tuple{Real, Real}, alpha::Real, side::String)

    diff = test.mu1 - test.mu2 - test.delta
    se = sqrt(std[1] ^ 2 / (test.k * n) + std[2] ^ 2 / n)
    z = diff / se
    p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    # power_result(test, p)
    return p

end # end function
