import string
import random
import time
from faker import Faker
import pyautogui
from robot.api.deco import keyword, library



@library
class CustomLib(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_AUTO_KEYWORDS = True
    
    



    @keyword
    def this_is_keyword(self):
        pass

    @keyword(name='This is keyword1')
    def xxx(self):
        pass

    def this_is_not_keyword(self):
        pass


    def get_random_name(self, email_length):
        letters = string.ascii_lowercase[:12]
        return ''.join(random.choice(letters) for i in range(int(email_length)))

    @keyword("Get Random Email Name")
    def generate_random_emails(self, length):
        domains = ["hotmail.com", "gmail.com", "aol.com",
                   "mail.com", "mail.kz", "yahoo.com"]

        return [self.get_random_name(length)+ '@' + random.choice(domains)]

    @keyword("Get Random digits")
    # def generate_random_emails(self,len_, floor=1):
    def generate_random_num(self,digits):
        # rand_digits=f'{self.random.randrange(1, 10**3):03}'
        # return rand_digits
        # top = 10**len_
        # if floor > top:
        #     raise ValueError(f"Floor '{floor}' must be less than requested top '{top}'")
        # return f'{self.random.randrange(floor, top):0{len_}}
        dig = int(digits)
        lower = 10**(dig-1)
        upper = 10**dig - 1
        return f'{random.randint(lower, upper)}'

    @keyword("Get Fake First Name")
    def get_firstName(self):
        fake = Faker().locales("en_US");
        return fake.first_name()

    @keyword("string to char array")
    def get_string_data(self,dataStr):
        myString= "Java2Blog"
        listOfChars = list()
        listOfChars += self.dataStr
        print("The input string is:", self.dataStr)
        print("The list of character is:", listOfChars)
        return listOfChars
    
    @keyword("Get numeric digit from string")
    def get_numeric_data_from_string(self,strdata):
        print("The list of character is:", strdata)
        digitData = ''.join(filter(str.isdigit, strdata))
        return digitData

    @keyword("Enter Keyboard Input")
    def enter_key_data(self,strdata):
        print("The list of character is:", strdata)
        pyautogui.write(strdata, interval=0.25)
    
    @keyword("open tab using hot key")
    def open_browser_tab(self):
        pyautogui.hotkey('ctrl', 't')
        time.sleep(2)
    
    @keyword("Get Random Digits Between Range")
    def random_between_range(self,start=1,end=9):
        return random.randint(start, end)