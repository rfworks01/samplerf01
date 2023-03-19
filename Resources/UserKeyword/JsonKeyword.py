import json
import os,sys,time

#r -->
#w -->

# function to add to JSON
def write_append_json(new_data, filename='update2.json',json_node="test_data"):

    testfile = '../../'
    with open(filename, 'r+') as file:
        # First we load existing data into a dict.
        file_data = json.load(file)
        # Join new_data with file_data inside emp_details
        file_data["json_node"].append(new_data)
        # Sets file's current position at offset.
        file.seek(0)
        # convert back to json.
        json.dump(file_data, file, indent=4)
        # python object to be appended


y = {"name": "Nikhil",
     "email": "nikhil@geeksforgeeks.org",
     }

