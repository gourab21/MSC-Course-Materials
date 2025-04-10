import os

folder = 'code'

# List all files (and folders) in the directory
items = os.listdir(folder)

# Filter out only files
files = [f for f in items if os.path.isfile(os.path.join(folder, f))]

# Print each file
for file in files:
    print(file)
