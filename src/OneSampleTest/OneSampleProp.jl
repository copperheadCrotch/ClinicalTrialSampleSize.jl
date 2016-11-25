"""
$(TYPEDEF)

One sample test for proportion

Constructors
------------
* `OneSampleProp(p1::Real, p0::Real)`

Arguments
---------
* `p1`: True proportion

* `p0`: Proportion under null hypothesis

Fields
------
$(FIELDS)
"""
type OneSampleProp <: TrialTest
    p1::Real
    p0::Real

    # Validator
    function OneSampleProp(p1, p0)

        if !((0 < p1 < 1) & (0 < p0 < 1))

            error("Proportion values must be in (0, 1)")

        end # end if
        new(p1, p0)

    end # end function

end # function


# One sample test for proportion
function hypotheses{T <: OneSampleProp}(test::T, n::Real, std::Void, alpha::Real, side::String)

    diff = test.p1 - test.p0
    se = sqrt(1 / n * test.p1 * (1 - test.p1))
    z = diff / se
    if side == "two"

        p = cdf(ZDIST, z - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha / 2))

    else

        p = cdf(ZDIST, sqrt(test.p0 * (1 - test.p0) / (test.p1 * (1 - test.p1))) * (abs(z) - quantile(ZDIST, 1 - alpha)))

    end # end if
    return p

end # end function
