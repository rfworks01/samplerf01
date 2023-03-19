# importing the module
import json

def read_json_data():
    # Opening JSON file
    with open('example1.json') as json_file:
         data = json.load(json_file)

         # Print the type of data variable
         print("Type:", type(data))

         # Print the data of dictionary
         print("\nTotal length of data under user1",len(data["user1"]))
         print("\nUser1:", data['user1'])
         print("\nUser2:", data['user2'])