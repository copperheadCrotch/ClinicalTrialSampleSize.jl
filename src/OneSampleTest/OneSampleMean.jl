"""
$(TYPEDEF)

One sample test for mean

Constructors
------------
* `OneSampleMean(mu1::Real, mu0::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type OneSampleMean <: TrialTest
    mu1::Real
    mu0::Real
    stdunknown::Bool
    # Validator
    function OneSampleMean(mu1, mu0, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if
        new(mu1, mu0, stdunknown)

    end # end function

end # end type


# One-sample test for mean
function hypotheses{T <: OneSampleMean}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0
    se = sqrt(1 / n) * std
    ts = diff / se
    # If the population standard deviation is known
    if test.stdunknown == false

        if side == "two"

            p =  cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha / 2))

        else

            p = cdf(ZDIST, abs(ts) - quantile(ZDIST, 1 - alpha))

        end # end if

   # If the population standard deviation is unknown
    else

        if side == "two"

            p =  cdf(TDist(n - 1), ts - quantile(TDist(n - 1), 1 - alpha / 2)) + cdf(TDist(n - 1), -ts - quantile(TDist(n - 1), 1 - alpha / 2))

        else

            p = cdf(TDist(n - 1), abs(ts) - quantile(TDist(n - 1), 1 - alpha))

        end # end if

    end # end if

    # power_result(test, p)
    return p

end # end function
