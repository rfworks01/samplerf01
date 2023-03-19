from faker import Faker

fake = Faker('en_US')

fname= fake.first_name()
lname=fake.last_name()

