using ClinicalTrialSampleSize
using Base.Test

# TwoSampleMean
# Constructor: TwoSampleMean()
@test_throws ErrorException TwoSampleMean(-Inf, Inf, 1)
@test_throws ErrorException TwoSampleMean(25, 20, 0)

params = (
    (TwoSampleMean(3, 2, 1), 15.698, 0.8, 1, 0.05, "two"),
    (TwoSampleMean(10, 7, 2), 43.780, 0.9, 5, 0.05, "two"),
    (TwoSampleMean(7, 4, 1), 13.139, 0.9, 3, 0.1, "one"),
    (TwoSampleMean(50, 45, 1.5), 137.123, 0.85, (10.4, 15.2), 0.01, "one"),
    (TwoSampleMean(120, 114, 1), 171.548, 0.95, (13, 17.5), 0.05, "two"),
)

for (test, n, p, std, alpha, side) in params

        p_est = power(test; n = n, std = std, alpha = alpha, side = side)
        n_est = sample_size(test; power = p, std = std, alpha = alpha, side = side)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# Two-sample non-inferiority/superiority for mean
# Constructor: TwoSampleMeanInferior/Superior
@test_throws ErrorException TwoSampleMeanInferior(-Inf, 5, 1, -1)
@test_throws ErrorException TwoSampleMeanInferior(30, 35, -3, -3)
@test_throws ErrorException TwoSampleMeanInferior(30, 35, 1, 3)
@test_throws ErrorException TwoSampleMeanSuperior(-Inf, Inf, 1, 1)
@test_throws ErrorException TwoSampleMeanSuperior(35, 30, -2, 5)
@test_throws ErrorException TwoSampleMeanSuperior(35, 30, 1, -3)

params = (
    (TwoSampleMeanInferior(2, 2, 1, -1), 12.365, 0.8, 1, 0.05),
    (TwoSampleMeanInferior(1.9, 2.5, 2, -1), 16.850, 0.85, 0.5, 0.05),
    (TwoSampleMeanInferior(1.94, 2.0, 1, -2.3), 46.286, 0.95, (1.1, 4.5), 0.05),
    (TwoSampleMeanSuperior(2.5, 2, 2, 0), 45.710, 0.8, 1.3, 0.1),
    (TwoSampleMeanSuperior(20, 15, 1, 3), 81.267, 0.85, 5.5, 0.1),
    (TwoSampleMeanSuperior(121, 119, 1.5, 2.3), 8278.386, 0.95, (3, 9), 0.1),
)

for (test, n, p, std, alpha) in params

        p_est = power(test; n = n, std = std, alpha = alpha)
        n_est = sample_size(test; power = p, std = std, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# Two-sample equivalence for mean
# Constructor: TwoSampleMeanEqual()
@test_throws ErrorException TwoSampleMeanEqual(-Inf, Inf, 1, 1)
@test_throws ErrorException TwoSampleMeanEqual(30, 30, -1, 0)
@test_throws ErrorException TwoSampleMeanEqual(30, 30, 1, -5)

params = (
    (TwoSampleMeanEqual(2, 2, 1, 0.3), 190.308, 0.8, 1, 0.05),
    (TwoSampleMeanEqual(1.94, 1.95, 2, 0), 8918.842, 0.85, 0.25, 0.05),
    (TwoSampleMeanEqual(112, 110, 1, 1.7), 15542.81, 0.95, (5.2, 10.3), 0.1),
    (TwoSampleMeanEqual(59, 54, 2, 3), 23.404, 0.8, (4, 2.5), 0.1),
)

for (test, n, p, std, alpha) in params

        p_est = power(test; n = n, std = std, alpha = alpha)
        n_est = sample_size(test; power = p, std = std, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# Two-sample proportion
# Constructor: TwoSampleProp()
@test_throws ErrorException TwoSampleProp(-1.2, 1.2, 1)
@test_throws ErrorException TwoSampleProp(-1.2, 1.2, -1)

params = (
    (TwoSampleProp(0.5, 0.2, 1), 35.756, 0.8, 0.05, "two"),
    (TwoSampleProp(0.9, 0.4, 2), 10.235, 0.85, 0.05, "two"),
    (TwoSampleProp(0.44, 0.4, 1), 2603.41, 0.95, 0.1, "one"),
)

for (test, n, p, alpha, side) in params

        p_est = power(test; n = n, alpha = alpha, side = side)
        n_est = sample_size(test; power = p, alpha = alpha, side = side)

        println(p_est)
        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# Two-sample non-inferiority/superiority proportion
# Constructor: TwoSamplePropInferior/Superior
@test_throws ErrorException TwoSamplePropInferior(-1.2, 1.2, 0)
@test_throws ErrorException TwoSamplePropInferior(0.3, 0.2, 1)
@test_throws ErrorException TwoSamplePropSuperior(1.3, 0.3, 0)
@test_throws ErrorException TwoSamplePropSuperior(0.4, 0.2, 1.2)

params = (
    (OneSamplePropInferior(0.25, 0.3, -0.06), 11592.29, 0.8, 0.05),
    (OneSamplePropInferior(0.71, 0.8, -0.05), 691.445, 0.85, 0.1),
    (OneSamplePropInferior(0.4, 0.4, -0.02), 5138.308, 0.95, 0.1),
    (OneSamplePropSuperior(0.7, 0.5, 0.1), 129.834, 0.8, 0.05),
    (OneSamplePropSuperior(0.32, 0.27, 0.03), 2922.942, 0.85, 0.1),
    (OneSamplePropSuperior(0.5, 0.44, 0.2), 57.2, 0.9, 0.2),
)

for (test, n, p, alpha) in params

        p_est = power(test; n = n, alpha = alpha)
        n_est = sample_size(test; power = p, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for

#=
# One-sample equivalence proportion
# Constructor: OneSamplePropEqual
@test_throws ErrorException OneSamplePropEqual(1.9, 1.2, 0.1)
@test_throws ErrorException OneSamplePropEqual(0.2, 0.2, -1)

params = (
    (OneSamplePropEqual(0.35, 0.3, 0.06), 19482.75, 0.8, 0.05),
    (OneSamplePropEqual(0.85, 0.8, 0.1), 377.619, 0.85, 0.1),
    (OneSamplePropEqual(0.4, 0.4, 0.02), 6304.454, 0.95, 0.1),
)

for (test, n, p, alpha) in params

        p_est = power(test; n = n, alpha = alpha)
        n_est = sample_size(test; power = p, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for
=#
return true
