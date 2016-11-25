"""
$(TYPEDEF)

One sample equivalence test for proportion

Constructors
------------
* `OneSamplePropEqual(p1::Real, p0::Real, delta::Real)`

Arguments
---------
* `p1`: True proportion

* `p0`: Proportion under null hypothesis

* `delta`: Non-inferiority/Superiority Margin

Fields
------
$(FIELDS)
"""
type OneSamplePropEqual <: TrialTest
    p1::Real
    p0::Real
    delta::Real

    # Validator
    function OneSamplePropEqual(p1, p0, delta)

        if !((0 < p1 < 1) & (0 < p0 < 1))

            error("Proportion value must be in (0, 1)")

        end # end if

        if !(-1 < delta < 1)

            error("The non-inferiority/superiority margin δ must be in (-1 , 1)")

        end # end if
        new(p1, p0, delta)

    end # end function

end # end type


# One sample equivalence test for proportion
function hypotheses{T <: OneSamplePropEqual}(test::T, n::Real, std::Void, alpha::Real, side::String)

    diff = abs(test.p1 - test.p0) - test.delta
    se = sqrt(1 / n * test.p1 * (1 - test.p1))
    z = diff / se
    p = 2 * (cdf(ZDIST, z - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha))) - 1
    return p

end # end function
