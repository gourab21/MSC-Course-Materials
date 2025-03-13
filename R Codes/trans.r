# Function to merge two halves of the array in place
inplace_merge <- function(arr, low, mid, high) {
  # Initialize pointers for the two halves
  i <- low
  j <- mid + 1
  
  # While there are elements in both halves to compare
  while (i <= mid && j <= high) {
    if (arr[i] <= arr[j]) {
      i <- i + 1  # Move pointer in the first half
    } else {
      # Element in the second half is smaller, so we need to shift elements in the first half
      temp <- arr[j]  # Store the element from the second half
      for (k in j: i + 1) {
        arr[k] <- arr[k - 1]  # Shift the elements to the right
      }
      arr[i] <- temp  # Place the element from the second half in the correct position
      
      # Move pointers
      i <- i + 1
      mid <- mid + 1
      j <- j + 1
    }
  }
}

# Function for In-Place Merge Sort
inplace_mergesort <- function(arr, low, high) {
  if (low < high) {
    # Find the middle point
    mid <- floor((low + high) / 2)
    
    # Recursively sort the first and second halves
    inplace_mergesort(arr, low, mid)
    inplace_mergesort(arr, mid + 1, high)
    
    # Merge the two sorted halves in place
    inplace_merge(arr, low, mid, high)
  }
}

# Example usage
arr <- c(12, 11, 13, 5, 6, 7)
print("Original Array:")
print(arr)

# Perform the In-Place Merge Sort
inplace_mergesort(arr, 1, length(arr))

print("Sorted Array:")
print(arr)
