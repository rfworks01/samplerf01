from faker import Faker


class FakeTestData:
    fake = Faker('en_US')

    def generate_data(self,data_name):

        if(data_name=='${first_name}'):
           return self.fake.first_name()

        if(data_name=='${last_name}'):
           return self.fake.last_name()

        if (data_name == '${street_address}'):
            return self.fake.street_address()

        if (data_name == '${building}'):
            return self.fake.building_number()

        if(data_name == '${user_email}'):
            return self.fake.first_name()+"1234@yopmail.com"