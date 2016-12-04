using ClinicalTrialSampleSize
using Base.Test

# OneSampleMean
# Constructor: OneSampleMean()
@test_throws ErrorException OneSampleMean(-Inf, Inf)

params = (
    (OneSampleMean(3, 2), 7.849, 0.8, 1, 0.05, "two"),
    (OneSampleMean(3, 2.5), 70.640, 0.8, 1.5, 0.05, "two"),
    (OneSampleMean(50, 25), 11.976, 0.95, 24, 0.05, "two"),
    (OneSampleMean(10, 7), 23.788, 0.9, 5, 0.05, "one"),
    (OneSampleMean(7, 4), 6.569, 0.9, 3, 0.1, "one"),
)

for (test, n, p, std, alpha, side) in params

        p_est = power(test; n = n, std = std, alpha = alpha, side = side)
        n_est = sample_size(test; power = p, std = std, alpha = alpha, side = side)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for

# OneSampleMeanUnknown
# Constructor: OneSampleMeanUnknown()
# OneSampleMean
# Constructor: OneSampleMean()
@test_throws ErrorException OneSampleMeanUnknown(-Inf, Inf)

params = (
    (OneSampleMeanUnknown(3, 2), 9.913, 0.8, 1, 0.05, "two"),
    (OneSampleMeanUnknown(7, 4), 8.006, 0.9, 3, 0.1, "one"),
)

for (test, n, p, std, alpha, side) in params

        p_est = power(test; n = n, std = std, alpha = alpha, side = side)
        n_est = sample_size(test; power = p, std = std, alpha = alpha, side = side)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# One-sample non-inferiority/superiority for mean
# Constructor: OneSampleMeanInferior/Superior
@test_throws ErrorException OneSampleMeanInferior(-Inf, Inf, -1)
@test_throws ErrorException OneSampleMeanInferior(30, 35, 10)
@test_throws ErrorException OneSampleMeanSuperior(-Inf, Inf, 1)
@test_throws ErrorException OneSampleMeanSuperior(35, 30, -10)

params = (
    (OneSampleMeanInferior(2, 2, -1), 6.183, 0.8, 1, 0.05),
    (OneSampleMeanInferior(1.9, 2.5, -1), 9.660, 0.8, 0.5, 0.05),
    (OneSampleMeanInferior(1.94, 2.0, -0.05), 130948.3, 0.95, 1.1, 0.05),
    (OneSampleMeanSuperior(2.5, 2, 0), 41.794, 0.8, 1.3, 0.05),
    (OneSampleMeanSuperior(20, 15, 3), 54.369, 0.85, 5.5, 0.05),
    (OneSampleMeanSuperior(121, 119, 2.3), 856.385, 0.95, 3, 0.1),
)

for (test, n, p, std, alpha) in params

        p_est = power(test; n = n, std = std, alpha = alpha)
        n_est = sample_size(test; power = p, std = std, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# One-sample equivalence for mean
# Constructor: OneSampleMeanEqual()
@test_throws ErrorException OneSampleMeanEqual(-Inf, Inf, 1)
@test_throws ErrorException OneSampleMeanEqual(30, 30, -1)

params = (
    (OneSampleMeanEqual(2, 2, 0.3), 95.154, 0.8, 1, 0.05),
    (OneSampleMeanEqual(1.94, 1.95, 0), 5945.895, 0.85, 0.25, 0.05),
    (OneSampleMeanEqual(112, 110, 1.7), 3156.897, 0.95, 5.2, 0.1),
)

for (test, n, p, std, alpha) in params

        p_est = power(test; n = n, std = std, alpha = alpha)
        n_est = sample_size(test; power = p, std = std, alpha = alpha)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# One-sample proportion
# Constructor: OneSampleProp()
@test_throws ErrorException OneSampleProp(-1.2, 1.2)

params = (
    (OneSampleProp(0.5, 0.2), 21.802, 0.8, 0.05, "two"),
    (OneSampleProp(0.9, 0.4), 3.232, 0.85, 0.05, "two"),
    (OneSampleProp(0.44, 0.4), 1666.615, 0.95, 0.1, "two"),
    (OneSampleProp(0.7, 0.5), 49.682, 0.9, 0.05, "one"),
    (OneSampleProp(0.32, 0.27), 369.834, 0.8, 0.1, "one"),
)

for (test, n, p, alpha, side) in params

        p_est = power(test; n = n, alpha = alpha, side = side)
        n_est = sample_size(test; power = p, alpha = alpha, side = side)

        @test abs(p_est - p) < 1e-3
        @test abs(n_est - n) < 1

end # end for


# One-sample non-inferiority/superiority proportion
# Constructor: OneSamplePropInferior/Superior
@test_throws ErrorException OneSamplePropInferior(-1.2, 1.2, 0)
@test_throws ErrorException OneSamplePropInferior(0.3, 0.2, 1)
@test_throws ErrorException OneSamplePropSuperior(1.3, 0.3, 0)
@test_throws ErrorException OneSamplePropSuperior(0.4, 0.2, 1.2)

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

return true
