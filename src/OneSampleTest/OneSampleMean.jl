"""
$(TYPEDEF)

One sample test for mean

Constructors
------------
* `OneSampleMean(mu1::Real, mu0::Real)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

Fields
------
$(FIELDS)
"""
type OneSampleMean <: TrialTest
    mu1::Real
    mu0::Real

    # Validator
    function OneSampleMean(mu1, mu0)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean values must be in (-Inf, Inf)")

        end # end if
        new(mu1, mu0)

    end # end function

end # end type


# One-sample test for mean
function hypotheses{T <: OneSampleMean}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0
    se = sqrt(1 / n) * std
    z = diff / se
    if side == "two"

        p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha / 2))

    else

        p = cdf(ZDIST, abs(z) - quantile(ZDIST, 1 - alpha))

    end # end if
    # power_result(test, p)
    return p

end # end function
