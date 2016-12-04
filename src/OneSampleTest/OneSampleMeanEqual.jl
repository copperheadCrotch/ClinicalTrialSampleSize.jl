"""
$(TYPEDEF)

One sample equivalence test for mean

Constructors
------------
* `OneSampleMeanEqual(mu1::Real, mu0::Real, delta::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `delta`: Superiority Margin

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type OneSampleMeanEqual <: TrialTest
    mu1::Real
    mu0::Real
    delta::Real
    stdunknown::Bool

    # Validator
    function OneSampleMeanEqual(mu1, mu0, delta, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(0 <= delta < Inf)

            error("The superiority margin δ must be in [0 , Inf)")

        end # end if
        new(mu1, mu0, delta, stdunknown)

    end # end function

end # end type


# One-sample equivalence test for mean
function hypotheses{T <: OneSampleMeanEqual}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu0) - abs(test.delta)
    se = sqrt(1 / n) * std
    ts = diff / se
    # If population standard deviation is known
    if test.stdunknown == false

        p = 2 * (cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha))) - 1

    # If population standard deviation is unknown
    else

        p = 2 * (cdf(TDist(n - 1), ts - quantile(TDist(n - 1), 1 - alpha)) + cdf(TDist(n - 1), -ts - quantile(TDist(n - 1), 1 - alpha))) - 1

    end # end if
    # power_result(test, p)
    return p

end # end function
