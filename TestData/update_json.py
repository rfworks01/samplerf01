import json

# JSON data:
x = { "organization": "GeeksForGeeks",
       "city": "Noida",
       "country": "India"
      }

def update_json_value_in_file():
    """ python object to be appended [append single value to json dict """
    z = {"pin": 110096}

    data= None
    # Opening JSON file
    with open('update1.json', 'r+') as file:
        # First we load existing data into a dict.
        file_data = json.load(file)

        # # parsing JSON string:
        # z = json.loads(x)

        # appending the data
        file_data.update(z)

        # the result is a JSON string:
        # print(json.dumps(z))
        file.seek(0)
        json.dump(file_data,file,indent=4)



# function to add to JSON
def write_json(new_data, filename='update2.json'):
    with open(filename, 'r+') as file:
        # First we load existing data into a dict.
        file_data = json.load(file)
        # Join new_data with file_data inside emp_details
        file_data["userdetails"].append(new_data)
        # Sets file's current position at offset.
        file.seek(0)
        # convert back to json.
        json.dump(file_data, file, indent=4)

    # python object to be appended


y = {"name": "Nikhil",
     "email": "nikhil@geeksforgeeks.org",
     }


update_json_value_in_file()
write_json(y)








