import os, sys, time
import json, csv
from pathlib import Path

from faker import Faker
from mimesis import Person, Address, Internet
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from FakeDataGenerator import FakeTestData
from mimesis.enums import Gender
# import module
import traceback


# ROOT_DIR_OF_FILE = os.path.dirname(os.path.abspath(__file__))
# ROOT_DIR = os.path.abspath(os.curdir)
#
# print("Full path with file name:", ROOT_DIR_OF_FILE)
# print("Path with current file dir name:", ROOT_DIR)
# print("Path of base project folder:", sys.path[1])
# print(sys.path[0])
#
# from pathlib import Path
# ROOT_DIR1 = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# # ROOT_DIR2 = os.path.dirname(os.path.dirname)
# print(ROOT_DIR1)

# current_dir = Path(__file__)
# project_dir = [p for p in current_dir.parents if p.parts[-1]=='PageObject1'][0]
# print("Project Dir Path", project_dir)

# Abs_path_of_file1 = os.path.abspath(".")
# Abs_path_of_file2 = os.path.abspath("../")
# Abs_path_of_file3 = os.path.abspath("../../")
#
# print("Abs Path:", Abs_path_of_file1)
# print("Abs Path:", Abs_path_of_file2)
# print("Abs Path:", Abs_path_of_file3)

class FileAndDirLibrary(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    current_dir = Path(__file__)
    project_dir = [p for p in current_dir.parents if p.parts[-1] == 'PageObject1'][0]
    base_path = str(project_dir) + "/TestData/data/"  # sys.path[1] + '/TestData/data/'

    def csv_data_iterator(self, iterator):
        # field names
        fields = ['${DATA_ID}']

        # data rows of csv file
        rows = [
            [1],
            [2],
            [3],
            [4]
        ]
        outer_list = []
        for i in range(iterator):
            outer_list.append([i])
        # create number of rows
        rows1 = outer_list

        # name of csv file
        filename = self.base_path + "testID.csv"

        # writing to csv file
        with open(filename, 'w', newline='\n') as csvfile:
            # creating a csv writer object
            csvwriter = csv.writer(csvfile)

            # writing the fields
            csvwriter.writerow(fields)

            # writing the data rows
            csvwriter.writerows(rows1)

    # @keyword("generate ${iterator} data sets of @{args} file")
    def create_csv_data_sets(self, iterator, *args):
        fake = Faker('en_US')
        x = '${FirstName}'
        y = (x.split('${'))[1].split('}')
        print(y[0])
        print(len(args))

        feildList = []
        csv_fields = []
        for arg in args:
            print(arg)
            csv_fields.append(arg)
        # csv_fields.append(feildList)

        for field in csv_fields:
            print(field)

        # # field names
        # fields = ['${DATA_ID}']
        rows = []
        # rows_data=[fake.first_name(),fake.last_name()]
        rows_data = []
        # # data rows of csv file
        # rows = [[1],[2],[3],[4] ]
        fakeObj = FakeTestData();

        # for arg in args:
        #     print("args in dataset",arg)
        #     rows_data.append(FakeTestData().generate_data(arg))
        #
        # print(rows_data)

        for datset in range(iterator):
            rows_data1 = []
            for arg in args:
                rows_data1.insert(datset, FakeTestData().generate_data(arg))
            rows.append(rows_data1)

        rows.append(rows_data1)
        # print(rows_data)
        print(rows)
        # name of csv file
        filename = self.base_path + "dynamic.csv"

        ## writing to csv file
        with open(filename, 'w', newline='\n') as csvfile:
            # creating a csv writer object
            csvwriter = csv.writer(csvfile, delimiter=';')

            # writing the fields
            csvwriter.writerow(csv_fields )

            # writing the data rows
            csvwriter.writerows(rows)

    def example_write_json_data1(self, data_range=1):
        """ writing json data within a range"""
        fake = Faker('en_US')
        # print(fake.name())

        person = Person('en')
        # p1 = person.name(Gender.MALE)
        # p2 = person.full_name()
        # print(p1,p2)

        # Initializing dictionary
        mylist = []
        num = 3
        for i in range(data_range):
            firstName = fake.first_name();
            email = fake.first_name() + "1234@yopmal.com"
            my_dict = {}
            my_dict["email"] = firstName
            my_dict["firstname"] = email
            my_dict["lastname"] = fake.last_name()

            print(my_dict["email"])
            # print(my_dict["zip"])
            mylist.append(my_dict)

        with open(self.base_path + "dump.json", "w") as outfile:
            json.dump(mylist, outfile)

    def read_json_data(self):
        # Opening JSON file
        with open(self.base_path + 'dump.json') as json_file:
            data = json.load(json_file)

            # Print the type of data variable
            print("Type:", type(data))

            # Print the data of dictionary
            print("\nTotal length of data under user1", len(data))
            print("\nUser1:", data[1]["name"])

    def new_csv_writer(self):

        with open(self.base_path + 'innovators.csv', 'w', newline='\n') as file:
            # with open(self.base_path + 'innovators.csv', 'w') as file:
            writer = csv.writer(file)
            writer.writerow(["SN", "Name", "Contribution"])
            writer.writerow([1, "Linus Torvalds", "Linux Kernel"])
            writer.writerow([2, "Tim Berners-Lee", "World Wide Web"])
            writer.writerow([3, "Guido van Rossum", "Python Programming"])

        # @keyword("generate ${iterator} data sets")  # of ${args} file")
        def print_var_to_console(self, iterator):  # ,*args):

            self.built = BuiltIn();
            # for arg in args:
            #    self.built.log_to_console(arg)

    def print_args_data(self, itr, *args):

        dataSetsNum = int(itr)

        BuiltIn().log_to_console(type(args))

        try:
            listArgs = list(args)  # .split(',')
            # BuiltIn().log_to_console(listArgs)

            tupleToListArgs = listArgs[0].split(',')
            # BuiltIn().log_to_console(tupleToListArgs[0])

            convertedArgs = []
            for arg in tupleToListArgs:
                var = '${' + arg + '}'
                # BuiltIn().log_to_console(var)
                convertedArgs.append(var)

            # BuiltIn().log_to_console(convertedArgs)

            feildList = []
            csv_fields = []
            rows = []
            for c_arg in convertedArgs:
                BuiltIn().log_to_console(c_arg)
                csv_fields.append(c_arg)

            BuiltIn().log_to_console(csv_fields)


            for datRow in range(dataSetsNum):
                rows_data1 = []
                for singleRow in convertedArgs:
                    dataToPrint = "Print "+str(datRow)+" row for: "+singleRow+" as:"+FakeTestData().generate_data(singleRow)
                    BuiltIn().log_to_console(dataToPrint)
                    # rows_data1.insert(datRow, FakeTestData().generate_data(singleRow))
                    rows_data1.append(FakeTestData().generate_data(singleRow))
                rows.append(rows_data1)

            rows.append(rows_data1)
            BuiltIn().log_to_console(rows)

            filename = self.base_path + "conv_dynamic.csv"

            ## writing to csv file
            with open(filename, 'w', newline='\n') as csvfile:
                # creating a csv writer object
                csvwriter = csv.writer(csvfile,delimiter=';')

                # writing the fields
                csvwriter.writerow(csv_fields)

                ## writing the data rows
                csvwriter.writerows(rows)

            # for var in args:
            #     i = str(args.index(var))+'-'+var
            #     BuiltIn().log_to_console(i)

            # for self.i in range(int(itr)):
            #     BuiltIn().log_to_console(self.i)
        except:
            # printing stack trace
            traceback.print_exc()

# obj = FileAndDirLibrary()
# obj.csv_data_iterator();
# obj.read_json_data()
# obj.new_csv_writer()
# obj.example_write_json_data1(5)
# obj.create_csv_data_sets(3,'${first_name}','${last_name}')
