load("inputs.RData")

isSudokuValid <- function(sudoku.vector) {
  # Throw if vector does not contains 81 elements
  if (length(sudoku.vector) != 81) {
    stop("Sudoku incompleto")
  }
  
  # Convert vector to 9 x 9 matrix
  sudoku.matrix <- matrix(sudoku.vector, ncol = 9, byrow = TRUE)

  # Validate matrix
  linear.results <- sapply(1:9, FUN = linearValidator, sudoku.matrix)

  is.valid <- Reduce(linear.results["isValid",], f = "&&")
  errors <- Reduce(linear.results["errors",], f = "append")
  
  return(list(errors = errors[!is.na(errors)], isValid  = is.valid))
}

linearValidator <- function(row.number, matrix) {
  # Extract row from matrix
  row <- matrix[row.number,]

  # Create return list
  result <- list(errors = NA);

  # Validate vector
  is.valid <- isValidVector(row)
  
  if (!is.valid) {
    # Get duplicated values
    duplicate <- row[duplicated(row)]
    duplicate.indexes <- which(row %in% duplicate)
    
    # Map erros
    errors <- sapply(duplicate.indexes, FUN = function(col.number) {
      col <- matrix[, col.number]
      ifelse(isValidVector(col), NA, paste(col.number, row.number, sep = ","))
    })
    
    result$errors <- errors[which(!errors %in% NA)]
  }
  
  result$isValid <- is.valid
  
  return(result)
}

isValidVector <- function(sudoku.vector) {
  1:9 %in% (unique(sudoku.vector)) %>% Reduce(f = "&&")
}
