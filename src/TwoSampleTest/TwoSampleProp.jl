"""
$(TYPEDEF)

Two sample test for proportion

Constructors
------------
* `TwoSampleProp(p1::Real, p2::Real, k::Real)`

Arguments
---------
* `p1`: Proportion of group 1

* `p2`: Proportion of group 2

* `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

Fields
------
$(FIELDS)
"""
type TwoSampleProp <: TrialTest
    p1::Real
    p2::Real
    k::Real

    # Validator
    function TwoSampleProp(p1, p2, k)

        if !((0 < p1 < 1) & (0 < p2 < 1))

            error("Proportion values must be in (0, 1)")

        end # end if

        if !(0 < k < Inf)

            error("Allocation ratio must be in (0, Inf)")

        end # end if

        new(p1, p2, k)

    end # end function

end # function


# Two sample test for proportion
function hypotheses{T <: TwoSampleProp}(test::T, n::Real, std::Union{Real, Tuple{Real, Real}, Void}, alpha::Real, side::String)

    diff = test.p1 - test.p2
    se = sqrt(1 / (test.k * n) * test.p1 * (1 - test.p1) + 1 / n * test.p2 * (1 - test.p2))
    z = diff / se
    if side == "two"

        p = cdf(ZDIST, z - quantile(ZDIST, 1 - alpha / 2)) + cdf(ZDIST, -z - quantile(ZDIST, 1 - alpha / 2))

    else

        p = cdf(ZDIST, abs(z) - quantile(ZDIST, 1 - alpha))

    end # end if
    return p

end # end function
