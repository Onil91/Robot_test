# Robot_test

This is a demo framework for running test cases in Firefox and Chrome

## How to set up

1) Clone the repository to your local machine
2) Install the latest python on your computer. It is tested with version 3.9.6
3) Install the neccessary python packages:
- robotframework-pythonlibcore
- robotframework-seleniumlibrary
- selenium
- robotframework<br />
Or you can use the provided requirements.txt to install them<br />
Use `pip install -r requirements.txt` in command line from the root of the repository.

## How to run it

To run the whole test set either use the following command:<br />
`robot -v browser:Chrome selenium_test.robot` for Chrome<br />
Or<br />
`robot -v browser:FF selenium_test.robot` For Firefox

It is possible to only run selected parts of the test set<br />
The avaiable tests are:
- Registration: `robot -i registration -v browser:Chrome selenium_test.robot`
- Seraching items: `robot -i search -v browser:Chrome selenium_test.robot`
- Shopping cart: `robot -i cart -v browser:Chrome selenium_test.robot`
- Purchasing: `robot -i registration -i purchase -v browser:Chrome selenium_test.robot`

**All of the above command needs to be run from the rood directory of the repository**
