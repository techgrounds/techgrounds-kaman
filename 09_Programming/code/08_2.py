"""
Exercise 2:
Create a new script.
Use user input to ask for their information (first name, last name, job title, company). 
Store the information in a dictionary.
Write the information to a csv file (comma-separated values). 
The data should not be overwritten when you run the script multiple times.
"""

import csv

first_name = input("Type in your fist name: ")
last_name = input("Type in your last name: ")
job_title = input("Type in your job title: ")
company = input("Type in your company: ")

thisdict = {
    "First name" : first_name,
    "Last name" : last_name,
    "Job title" : job_title,
    "Company" : company
}
#print (thisdict)


file_name = "output.csv"

# check of deze file al bestaat
# https://www.python-engineer.com/posts/check-if-file-exists/
file_exists = False
try:
    f = open(file_name)
except FileNotFoundError:
     # doesn’t exist
     file_exists = False
     print("The file will be created")
else:
     # exists
     file_exists = True
     print("The file exists, data will be appended to the file.")

# 'a' = append. Maakt het bestand aan als het nog niet bestaat.
with open(file_name,'a', newline='') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=thisdict.keys())
    
    # Als het bestand nog niet bestaat, schrijf ook de headers.
    if file_exists == False:
    writer.writeheader()
    # write the values from thisdict as a new row in the CSV file.    
    writer.writerow(thisdict)
