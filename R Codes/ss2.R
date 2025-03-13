

hwage = as.numeric(readline(prompt = "Enter The Hourly Wage : "))
regular = as.numeric(readline(prompt = "Enter The Regular Working Hours : "))
overtime = as.numeric(readline(prompt = "Enter The Overtime Working Hours : "))

pay=(hwage*regular)+(hwage*1.5*overtime)
cat("Your Pay is ",pay)
