data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)

main = do 
        print $ Monday
        print $ Friday == Friday
        print $ Sunday > Saturday
        print $ Person {firstName = "Michael", lastName = "Diamond", age = 43}


