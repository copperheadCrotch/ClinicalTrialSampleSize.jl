"""
$(TYPEDEF)

Crossover design, test for mean

Constructors
------------
* `CrossoverMean(mu1::Real, mu2::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type CrossoverMean <: TrialTest
    mu1::Real
    mu2::Real
    stdunknown::Bool

    # Validator
    function CrossoverMean(mu1, mu2, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if
        new(mu1, mu2, stdunknown)

    end # end function

end # end type


# Two-sample test for mean, if the standard devaition is the same for the two groups
function hypotheses{T <: CrossoverMean}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu2
    se = sqrt(1 / (2 * n)) * std
    ts = diff / se
    if test.stdunknown == false

        if side == "two"

            p =  cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha / 2))

        else

            p = cdf(ZDIST, abs(ts) - quantile(ZDIST, 1 - alpha))

        end # end if

    else

        if side == "two"

            p =  cdf(TDist(2 * n - 2), ts - quantile(TDist(2 * n - 2), 1 - alpha / 2)) +
                 cdf(TDist(2 * n - 2), -ts - quantile(TDist(2 * n - 2), 1 - alpha / 2))

        else

            p = cdf(TDist(2 * n - 2), abs(ts) - quantile(TDist(2 * n - 2), 1 - alpha))

        end # end if

    end # end if
    # power_result(test, p)
    return p

end # end function
