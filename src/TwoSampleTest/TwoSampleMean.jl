"""
$(TYPEDEF)

two sample test for mean

Constructors
------------
* `TwoSampleMean(mu1::Real, mu2::Real, k::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type TwoSampleMean <: TrialTest
    mu1::Real
    mu2::Real
    k::Real
    stdunknown::Bool

    # Validator
    function TwoSampleMean(mu1, mu2, k, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if

        if !(0 < k < Inf)

            error("Allocation ratio must be in (0, Inf)")

        end # end if
        new(mu1, mu2, k, stdunknown)

    end # end function

end # end type


# Two-sample test for mean, if the standard devaition is the same for the two groups
function hypotheses{T <: TwoSampleMean}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu2
    se = sqrt(1 / n + 1 / (test.k * n)) * std
    ts = diff / se
    if test.stdunknown == false

        if side == "two"

            p =  cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha / 2))

        else

            p = cdf(ZDIST, abs(ts) - quantile(ZDIST, 1 - alpha))

        end # end if

    else

        if side == "two"

            p =  cdf(TDist(n + test.k * n - 2), ts - quantile(TDist(n + test.k * n - 2), 1 - alpha / 2)) +
                 cdf(TDist(n + test.k * n - 2), -ts - quantile(TDist(n + test.k * n - 2), 1 - alpha / 2))

        else

            p = cdf(TDist(n + test.k * n - 2), abs(ts) - quantile(TDist(n + test.k * n - 2), 1 - alpha))

        end # end if

    end # end if
    # power_result(test, p)
    return p

end # end function


# Two-sample test for mean, if the standard devaition is not the same
function hypotheses{T <: TwoSampleMean}(test::T, n::Real, std::Tuple{Real, Real}, alpha::Real, side::String)

    diff = test.mu1 - test.mu2
    se = sqrt(std[1] ^ 2 / (test.k * n) + std[2] ^ 2 / n)
    ts = diff / se
    if test.stdunknown == false

        if side == "two"

            p =  cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha / 2))

        else

            p = cdf(ZDIST, abs(ts) - quantile(ZDIST, 1 - alpha))

        end # end if

    else

        if side == "two"

            p =  cdf(TDist(n + test.k * n - 2), ts - quantile(TDist(n + test.k * n - 2), 1 - alpha / 2)) +
                 cdf(TDist(n + test.k * n - 2), -ts - quantile(TDist(n + test.k * n - 2), 1 - alpha / 2))

        else

            p = cdf(TDist(n + test.k * n - 2), abs(ts) - quantile(TDist(n + test.k * n - 2), 1 - alpha))

        end # end if

    end # end if
    # power_result(test, p)
    return p

end # end function
