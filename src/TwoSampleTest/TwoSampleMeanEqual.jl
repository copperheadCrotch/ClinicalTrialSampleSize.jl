"""
$(TYPEDEF)

Two sample equivalence test for mean

Constructors
------------
* `TwoSampleMeanEqual(mu1::Real, mu2::Real, k::Real, delta::Real)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `k`: Ratio of the groups, k = n(group1) / n(group 2)

* `delta`: Non-inferiority/Superiority Margin

Fields
------
$(FIELDS)
"""
type TwoSampleMeanEqual <: TrialTest
    mu1::Real
    mu2::Real
    k::Real
    delta::Real

    # Validator
    function TwoSampleMeanEqual(mu1, mu2, k, delta)

        if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(0 < k < Inf)

            error("Sampling ratio must be in (0, Inf)")

        end # end if

        if !(-Inf < delta < Inf)

            error("The non-inferiority/superiority margin δ must be in (Inf , Inf)")

        end # end if
        new(mu1, mu2, k, delta)

    end # end function

end # end type


# Two-sample equivalence test for mean, equal standard deviaiton
function hypotheses{T <: TwoSampleMeanEqual}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu2) - test.delta
    se = sqrt(1 / n + 1 / (k * n)) * std
    z = diff / se
    p = 2 * (cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))) - 1
    # power_result(test, p)
    return p

end # end function


# Two-sample equivalence test for mean, unequal standard deviation
function hypotheses{T <: TwoSampleMeanEqual}(test::T, n::Real, std::Tuple{Real}, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu2) - test.delta
    se = sqrt(std[1] / n + std[2] / (k * n))
    z = diff / se
    p = 2 * (cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))) - 1
    # power_result(test, p)
    return p

end # end function
