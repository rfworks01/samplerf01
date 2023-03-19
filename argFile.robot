#""" Argument file to pass arguments to tests from external source """
--doc This is an example (where "special characters" are ok!)
#    run test in specific order
  
--metadata X:Value with spaces
--variable VAR:Hello, world!
# This is a comment
# run from command line: robot --argumentfile argfile.robot
--name An Example
tests/GoogleTC01.robot
tests/FakerLibTests.robot