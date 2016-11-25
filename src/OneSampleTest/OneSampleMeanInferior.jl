"""
$(TYPEDEF)

One sample non-inferiority test for mean

Constructors
------------
* `OneSampleMeanInferior(mu1::Real, mu0::Real, delta::Real)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `delta`: Non-inferiority margin

Fields
------
$(FIELDS)
"""
type OneSampleMeanInferior <: TrialTest
    mu1::Real
    mu0::Real
    delta::Real

    # Validator
    function OneSampleMeanInferior(mu1, mu0, delta)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(-Inf < delta <= 0)

            error("The non-inferiority margin δ must be in (-Inf, 0]")

        end # end if
        new(mu1, mu0, delta)

    end # end function

end # type


# One-sample non-inferiority test for mean
function hypotheses{T <: OneSampleMeanInferior}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0 - test.delta
    se = sqrt(1 / n) * std
    z = diff / se
    p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    # power_result(test, p)
    return p

end # end function
