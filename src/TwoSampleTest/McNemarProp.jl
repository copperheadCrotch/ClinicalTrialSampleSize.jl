"""
$(TYPEDEF)

Paired sample test for proportion

Constructors
------------
* `McNemarProp(p1::Real, p2::Real)`

Arguments
---------
* `p1`: Proportion for cell of no event - event

* `p2`: Proportion for cell of event - no event

Fields
------
$(FIELDS)
"""
type McNemarProp <: TrialTest
    p1::Real
    p2::Real

    # Validator
    function McNemarProp(p1, p2)

        if !((0 < p1 < 1) & (0 < p2 < 1))

            error("Proportion values must be in (0, 1)")

        end # end if
        new(p1, p2)

    end # end function

end # function


# Two sample test for proportion
function hypotheses{T <: McNemarProp}(test::T, n::Real, std::Union{Real, Tuple{Real, Real}, Void}, alpha::Real, side::String)

    pdisc = test.p1 + test.p2
    pdiff = test.p2 - test.p1
    if side == "two"

        p = cdf(ZDIST, (pdiff * sqrt(n) - quantile(ZDIST, 1 - alpha / 2) * sqrt(pdisc)) / sqrt(pdisc - pdiff ^ 2)) +
            cdf(ZDIST, (-pdiff * sqrt(n) - quantile(ZDIST, 1 - alpha / 2) * sqrt(pdisc)) / sqrt(pdisc - pdiff ^ 2))

    else

        p = cdf(ZDIST, (abs(pdiff) * sqrt(n) - quantile(ZDIST, 1 - alpha) * sqrt(pdisc)) / sqrt(pdisc - pdiff ^ 2))

    end # end if
    return p

end # end function
