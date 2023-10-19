library(tictoc)
library(tibble)


# Measure time elapsed for the solution as it is originally
tic()
source(file.path("scripts", "script_as_is.R"))
time_elapsed_as_is <- toc()

# Measure time elapsed for parallel computing
tic()
source(file.path("scripts", "script_parallel_computing.R"))
time_elapsed_parallel <- toc()

# Create a tibble with the time elapsed results
time_elapsed_tibble <- tibble(
  Script = c("script_as_is", "script_parallel_computing"),
  TimeElapsed = c(time_elapsed_as_is$toc - time_elapsed_as_is$tic,
                  time_elapsed_parallel$toc - time_elapsed_parallel$tic)
)

# Print the tibble
print(time_elapsed_tibble)

# For the time being, the script with the parallel computing is the fastest
# method, and is almost 10 seconds faster than the "normal" loop method. I have
# yet not completed the last step, which is to split the M-simulations in the
# MTweedieTests in more than one core.

