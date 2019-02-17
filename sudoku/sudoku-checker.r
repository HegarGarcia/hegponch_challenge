load("sudoku/inputs.RData")

# Main Func
isSudokuValid <- function(sudoku.vector) {
  if (length(sudoku.vector) != 81) {
    stop("Sudoku incompleto")
  }
  
  sudoku.matrix <- matrix(sudoku.vector, ncol = 9, byrow = TRUE)
  results <- sapply(1:9, FUN = containsValidValues, sudoku.matrix)
  
  isValid <- Reduce(results["isValid",], f = "&&")
  errors <- Reduce(results["errors",], f = "append")
  
  return(list(errors = errors[!is.na(errors)], isValid  = isValid))
}

# Validation Func
containsValidValues <- function(row.number, matrix) {
  row <- matrix[row.number,]
  result <- list(errors = NA);
  isValid <- isValidVector(row)
  
  if (!isValid) {
    duplicate <- row[duplicated(row)]
    indexes <- which(row %in% duplicate)
    
    errors <- sapply(indexes, FUN = function(col.number) {
      col <- matrix[, col.number]
      ifelse(isValidVector(col), NA, paste(col.number, row.number, sep = ","))
    })
    
    result$errors <- errors[which(!errors %in% NA)]
  }
  
  result$isValid <- isValid
  
  return(result)
}

isValidVector <- function(sudoku.vector) 
  1:9 %in% (unique(sudoku.vector)) %>% Reduce(f = "&&")
