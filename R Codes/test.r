# Create a data frame
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Salary = c(50000, 55000, 60000)
)

# Print the data frame
print(data)
print(data$Name)       # Access the 'Name' column
print(data[["Age"]])   # Alternative way to access 'Age'
print(data[1, 2])      # Access element in the 1st row, 2nd column
print(data[ , "Salary"]) # Access the 'Salary' column



# Ask the user for input
user_input <- readline(prompt = "Enter a list of integers (comma-separated): ")

# Split the input into individual elements
list_data <- strsplit(user_input, ",")[[1]]

# Convert the elements to integers and remove any extra spaces
list_data <- as.integer(trimws(list_data))

# Print the resulting list of integers
print("Your list of integers is:")
print(list_data)

s=0; 
for (i in list_data){ 
  if (!(i %% 2==0)){ 
    s=s+i; 
  } 
} 
print("List - "); 
print(list_data); 
print(paste("Sum of Odd terms - ",s));

# Create a custom operator to add 10 to a number
`%add10%` <- function(x,y) {
  return(x + 10)
}

# Use the custom operator
result <- 5 %add10% 0   # Adds 10 to 5
print(result)  # Output: 15







