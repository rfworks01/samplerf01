import json
from faker import Faker
from mimesis import Person,Address,Internet
from mimesis.enums import Gender


def example_write_json_data():
    # Initializing dictionary
    mylist = []
    dic_exm1 = {
        "name": "Simplilearn1",
        "roll_no": 1,
        "cgpa": 9.68,
        "phone_num": "1231252123"
    }
    dic_exm2 = {
        "name": "Simplilearn2",
        "roll_no": 1,
        "cgpa": 9.68,
        "phone_num": "1231252123"
    }

    mylist.append(dic_exm1)
    mylist.append(dic_exm2)
    with open("out.json", "w") as outfile:
        json.dump(mylist, outfile)


def example_write_json_data1(data_range=1):
    """ writing json data within a range"""
    fake = Faker('en_US')
    #print(fake.name())

    person = Person('en')
    # p1 = person.name(Gender.MALE)
    # p2 = person.full_name()
    # print(p1,p2)


    # Initializing dictionary
    mylist = []
    num =3
    for i in range(data_range):
        my_dict={}
        my_dict["name"] = fake.name();
        my_dict["zip"] = fake.zipcode()

        print(my_dict["name"])
        print(my_dict["zip"])
        mylist.append(my_dict)

    with open("dump.json", "w") as outfile:
        json.dump(mylist, outfile)



example_write_json_data1(3)