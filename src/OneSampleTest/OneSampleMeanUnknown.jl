"""
$(TYPEDEF)

One sample test for mean if the population variance is unknown

Constructors
------------
* `OneSampleMeanUnknown(mu1::Real, mu0::Real)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

Fields
------
$(FIELDS)
"""
type OneSampleMeanUnknown <: TrialTest
    mu1::Real
    mu0::Real

    # Validator
    function OneSampleMeanUnknown(mu1, mu0)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if
        new(mu1, mu0)

    end # end function

end # end type


# One-sample test for mean if the population variance is unknown
function hypotheses{T <: OneSampleMeanUnknown}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0
    se = sqrt(1 / n) * std
    t = diff / se
    if side == "two"

        p =  cdf(TDist(n - 1), t - quantile(TDist(n - 1), 1 - alpha / 2)) + cdf(TDist(n - 1), -t - quantile(TDist(n - 1), 1 - alpha / 2))

    else

        p = cdf(TDist(n - 1), abs(t) - quantile(TDist(n - 1), 1 - alpha))

    end # end if
    # power_result(test, p)
    return p

end # end function
