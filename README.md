# FFExerciseTemplate

This project contains all the following exercises with a solution proposal that can be used as guidance. Bear in mind that we have a variety of ways for solving the same problem.

## Architecture

### 🖥 AR_E1

The goal of this exercise is to grab information from SWAPI https://swapi.dev/ relative to a people (character).
You should first take a look at the API documentation.
In order to achieve this you will need to:

1. Create a Datasource that is capable of fetching all data relative to people with id [1]
2. The datasource will have to request the people/1 and grab information about:
- The 1st Film
- The 1st Specie
- The 1st Vehicle
- The 1st Starship
3. The request should be made by button Request action
4. After you receive your response from the Datasource, you should fill in the textArea as follows:

    Name: Luke Skywalker

    Film: <name_of_the_first_movie>
    
    Specie: <name_of_the_first_specie>
    
    Vehicle: <name_of_the_first_vehicle>
    
    Starship: <name_of_the_first_starship>

Requirements:

- Use the already created StarWarsDatasource for convenience
- The model is already available and they conform to the protocol Decodable
- You MUST use the already availble artefacts (ServiceLayerSW)
- To parse the ID from an hypermedia URL, use the already provided func parsedHypermediaId() -> Int? in StringExtensions.
- The Datasource can only report back to the current ViewController when ALL information is available
- You should create a very clear communication interface between the Datasource and the current ViewController

## UI

### 🖥 UI_E1

1. Create one red UIView with (width: 200, height: 100). It should be at 20px distance from the UINavigationBar.
2. Create one blue UIView with (width: 200, height: 100). It should be at 20px distance from the Bottom.
3. Add a UILabel with the text "FF Candidate". It should be 20px below the red UIView.

Requirements:

- You cannot use Interface Builder (it should be done programatically)
- All views should be centered horizontally
- If you use autolayout, you must define it with the minimum constraints possible
- You should be able to rotate the device and everything should be repositioned
- You can use UI_E1.png as a reference

## Networking

🚧

## Others

### 🖥 OT_E1: Are the letters unique?

Write a function that accepts a String as its only parameter, and returns true if the string has
only unique letters, taking letter case into account.

Sample input and output:

1. The string “No duplicates” should return true.
2. The string “abcdefghijklmnopqrstuvwxyz” should return true.
3. The string “AaBbCc” should return true because the challenge is case-sensitive.
4. The string “Hello, world” should return false because of the double Ls and double Os.

### 🖥 OT_E2: Integer disguised as string

Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits 0 through 9.

Sample input and output:

1. The input “01010101” should return true.
2. The input “123456789” should return true.
3. The letter “9223372036854775808” should return true.
4. The letter “1.01” should return false; “.” is not a number.
5. The letter “123ssd233” should return false; “.” is not a number.

## Unit Testing

### 🖥 UT_E1

The objective is to Unit Test ImageStore's cache mechanism.
We have two URLs to help you do it.

1. Image url: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"
2. Image url: "https://i.annihil.us/u/prod/marvel/i/mg/b/70/4c0035adc7d3a.jpg"

Requirements:

- We want to test the ImageStore API.
- We want to validate that a downloaded image for the first time is not cached.
- Subsequent downloads of the same image must be cached.
- ImageStore cache should be clean at the end.

