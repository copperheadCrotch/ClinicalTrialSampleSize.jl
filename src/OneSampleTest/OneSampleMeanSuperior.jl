"""
$(TYPEDEF)

One sample superiority test for Mean

Constructors
------------
* `OneSampleMeanSuperior(mu1::Real, mu0::Real, delta::Real)`

Arguments
---------
* `mu1`: True mean

* `mu0`: Mean under null hypothesis

* `delta`: Superiority margin

Fields
------
$(FIELDS)
"""
type OneSampleMeanSuperior <: TrialTest
    mu1::Real
    mu0::Real
    delta::Real

    # Validator
    function OneSampleMeanSuperior(mu1, mu0, delta)

        if !((-Inf < mu1 < Inf) & (-Inf < mu0 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(0 <= delta < Inf)

            error("The superiority margin δ must be in [0, Inf)")

        end # end if
        new(mu1, mu0, delta)

    end # end function

end # end type


# One-sample superiority test for mean
function hypotheses{T <: OneSampleMeanSuperior}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = test.mu1 - test.mu0 - test.delta
    se = sqrt(1 / n) * std
    z = diff / se
    p =  cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    # power_result(test, p)
    return p

end # end function
