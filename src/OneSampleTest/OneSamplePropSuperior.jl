"""
$(TYPEDEF)

One sample superiority test for proportion

Constructors
------------
* `OneSamplePropSuperior(p1::Real, p0::Real, delta::Real)`

Arguments
---------
* `p1`: True proportion

* `p0`: Proportion under null hypothesis

* `delta`: Superiority margin

Fields
------
$(FIELDS)
"""
type OneSamplePropSuperior <: TrialTest
    p1::Real
    p0::Real
    delta::Real

    # Validator
    function OneSamplePropSuperior(p1, p0, delta)

        if !((0 < mu1 < 1) & (0 < mu0 < 1))

            error("Proportion value must be in (0, 1)")

        end # end if

        if !(0 <= delta < 1)

            error("The superiority margin δ must be in [0, 1)")

        end # end if
        new(p1, p0, delta)

    end # end function

end # type


# One sample superiority test for proportion
function hypotheses{T <: OneSamplePropSuperior}(test::T, n::Real, std::Void, alpha::Real, side::String)

    diff = test.p1 - test.p0 - test.delta
    se = sqrt(1 / n * test.p1 * (1 - test.p1))
    z = diff / se
    p = cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    return p

end # end function
