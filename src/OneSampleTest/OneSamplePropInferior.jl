"""
$(TYPEDEF)

One sample non-inferiority test for proportion

Constructors
------------
* `OneSamplePropInferior(p1::Real, p0::Real, delta::Real)`

Arguments
---------
* `p1`: True proportion

* `p0`: Proportion under null hypothesis

* `delta`: Non-inferiority margin

Fields
------
$(FIELDS)
"""
type OneSamplePropInferior <: TrialTest
    p1::Real
    p0::Real
    delta::Real

    # Validator
    function OneSamplePropInferior(p1, p0, delta)

        if !((0 < p1 < 1) & (0 < p0 < 1))

            error("Proportion value must be in (0, 1)")

        end # end if

        if !(-1 < delta <= 0)

            error("The non-inferiority margin δ must be in (-1, 0]")

        end # end if
        new(p1, p0, delta)

    end # end function

end # end type


# One sample non-inferiority test for proportion
function hypotheses{T <: OneSamplePropInferior}(test::T, n::Real, std::Void, alpha::Real, side::String)

    diff = test.p1 - test.p0 - test.delta
    se = sqrt(1 / n * test.p1 * (1 - test.p1))
    z = diff / se
    p = cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))
    return p

end # end function
