"""
$(TYPEDEF)

One sample non-inferiority test for mean

Constructors
------------
* `OneSampleMeanInferior(mu1::Real, mu0::Real, delta::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `delta`: Non-inferiority margin

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type OneSampleMeanInferior <: TrialTest
    mu1::Real
    mu0::Real
    delta::Real
    stdunknown::Bool

    # Validator
    function OneSampleMeanInferior(mu1, mu0, delta, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(-Inf < delta <= 0)

            error("The non-inferiority margin δ must be in (-Inf, 0]")

        end # end if
        new(mu1, mu0, delta, stdunknown)

    end # end function

end # type


# One-sample non-inferiority test for mean
function hypotheses{T <: OneSampleMeanInferior}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0 - test.delta
    se = sqrt(1 / n) * std
    ts = diff / se
    if test.stdunknown == false

        p =  cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha))

    else

        p =  cdf(TDist(n - 1), ts - quantile(TDist(n - 1), 1 - alpha)) + cdf(TDist(n - 1), -ts - quantile(TDist(n - 1), 1 - alpha))

    end # end if
    # power_result(test, p)
    return p

end # end function
