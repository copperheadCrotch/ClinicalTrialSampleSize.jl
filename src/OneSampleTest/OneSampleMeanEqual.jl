"""
$(TYPEDEF)

One sample equivalence test for mean

Constructors
------------
* `OneSampleMeanEqual(mu1::Real, mu0::Real, delta::Real)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `delta`: Non-inferiority/Superiority Margin

Fields
------
$(FIELDS)
"""
type OneSampleMeanEqual <: TrialTest
    mu1::Real
    mu0::Real
    delta::Real

    # Validator
    function OneSampleMeanEqual(mu1, mu0, delta)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(-Inf < delta < Inf)

            error("The non-inferiority/superiority margin δ must be in (Inf , Inf)")

        end # end if
        new(mu1, mu0, delta)

    end # end function

end # end type


# One-sample equivalence test for mean
function hypotheses{T <: OneSampleMeanEqual}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu0) - test.delta
    se = sqrt(1 / n) * std
    z = diff / se
    p = 2 * (cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))) - 1
    # power_result(test, p)
    return p

end # end function
