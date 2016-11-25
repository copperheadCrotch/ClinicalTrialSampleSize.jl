"""
$(TYPEDEF)

two sample test for mean

Constructors
------------
* `TwoSampleMean(mu1::Real, mu2::Real)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

Fields
------
$(FIELDS)
"""
type TwoSampleMean <: TrialTest
    mu1::Real
    mu2::Real
    k::Real

    # Validator
    function TwoSampleMean(mu1, mu2, k)

        if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if

        if !(0 < k < Inf)

            error("Allocation ratio must be in (0, Inf)")

        end # end if
        new(mu1, mu2, k)

    end # end function

end # end type


# Two-sample test for mean, if the standard devaition is the same for the two groups
function hypotheses{T <: TwoSampleMean}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu2
    se = sqrt(1 / n + 1 / (test.k * n)) * std
    z = diff / se
    if side == "two"

        p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha / 2))

    else

        p = cdf(ZDIST, abs(z) - quantile(ZDIST, 1 - alpha))

    end # end if
    # power_result(test, p)
    return p

end # end function


# Two-sample test for mean, if the standard devaition is not the same
function hypotheses{T <: TwoSampleMean}(test::T, n::Real, std::Tuple{Real, Real}, alpha::Real, side::String)

    diff = test.mu1 - test.mu2
    se = sqrt(std[1] ^ 2 / (test.k * n) + std[2] ^ 2 / n)
    z = diff / se
    if side == "two"

        p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha / 2))

    else

        p = cdf(ZDIST, abs(z) - quantile(ZDIST, 1 - alpha))

    end # end if
    # power_result(test, p)
    return p

end # end function
