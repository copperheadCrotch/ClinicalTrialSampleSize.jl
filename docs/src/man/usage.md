# Usage

The package supports the power/sample size calculation for clinical trials.

# Create a design object

Sample size calculations in clinical trials is specific to the design. To obtain the sample size
and power, the package requires to create a design object at first, e.g.

```julia
a = OneSampleMean(10, 9)
```

creates an object for a one-sample test for mean, the first value is the true population mean (some assumed treatment effects of a new drug candidate), the second is the mean under the null (commonly a value from a historical control or some observed-evidence.)

# Calculate power

To calculate the power, user can use the ```power``` function. The function requires keyword arguments except for the design object. For a one-sample test for mean, we also need to know the population variance/standard deviation, sample size and desired type I error rate.

```julia
power(a, std = 1, n = 20, alpha = 0.05)
```

# Calculate sample size

To calculate the sample size, user can use the ```sample_size``` function. Similarly, this function takes only keyword arguments except for the design object. For the same test as above, we can get the sample size when we have the desired power, type I error rate and population variance/standard deviation.

```julia
sample_size(a, power = 0.8, std = 1, alpha = 0.05)
```
