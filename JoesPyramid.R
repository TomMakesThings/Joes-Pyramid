# Function to calculate the stone values in the pyramid
checkPyramid <- function(layer_6) {
  # Record the values for each layer
  layers <- list()
  # Assign the last with the values to test
  layers[6] <- list(unname(layer_6))
  
  # Calculate values for layers 5 to 1 (second last bottom to top)
  for (i in 5:1) {
    # Set the layer under the current
    previous_layer <- layers[i + 1]
    # Create placeholder for stone values
    layers[i] <- list(rep(NA, i))
    
    # Calculate each stone's value by summing those on the layer below
    for (j in 1:length(layers[[i]])) {
      layers[[i]][j] = previous_layer[[1]][[j]] +
        previous_layer[[1]][[j + 1]]
    }
  }
  
  # Check pyramid contains no duplicated values
  if (!any(duplicated(unlist(layers, recursive = FALSE)))) {
    # Return solution
    return(layers)
  } else {
    # Otherwise return nothing
    return(NULL)
  }
}

solution_counter <- 0

# Check values for each letter
for (a in 1:29) {
  for (b in 1:9) {
    attempted_letters <- c(a = a, b = NA, c = NA, d = NA, e = NA, f = NA)
    # Prevent letter value being used if already taken
    if (!(b %in% attempted_letters)) {
      attempted_letters["b"] = b
      for (c in 1:6) {
        if (!(c %in% attempted_letters)) {
          attempted_letters["c"] = c
          for (d in 1:6) {
            if (!(d %in% attempted_letters)) {
              attempted_letters["d"] = d
              for (e in 1:9) {
                if (!(e %in% attempted_letters)) {
                  attempted_letters["e"] = e
                  for (f in 1:29) {
                    if (!(f %in% attempted_letters)) {
                      attempted_letters["f"] = f
                      
                      # Filter to check that top of pyramid < 100
                      # regardless of repeating stones
                      calculation <- a + 5*b + 10*c + 10*d + 5*e + f
                      
                      if (calculation < 100) {
                        solution <- checkPyramid(attempted_letters)
                        
                        if (!is.null(solution)) {
                          solution_counter <- solution_counter + 1
                          
                          message(paste("Solution", solution_counter))
                          for (i in 1:length(solution)) {
                            print(solution[[i]])
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}