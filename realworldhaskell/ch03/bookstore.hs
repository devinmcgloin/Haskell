data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

-- We will introduce the CustomerID type shortly.

data BookReview = BookReview BookInfo CustomerID String

-- Better way to go about defining review.
type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

{-- Can also create more indepth record, this is combo of two
to pass around a more complete type. --}
type BookRecord = (BookInfo, BookReview)

--Algabraic constructors
data Bool = False | True

-- here is a way we might represent billing info using algabraic types
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

--Easier getters for each value.
data Customer = Customer {
      customerID      :: CustomerID
    , customerName    :: String
    , customerAddress :: Address
    } deriving (Show)


--Simple constructor utilizing the above
customer1 = Customer 271828 "J.R. Hacker" ["255 Syntax Ct","Milpitas, CA 95134","USA"]

--Constructor that uses record syntax in which order does not matter.
customer2 = Customer {
              customerID = 271828
            , customerAddress = ["1048576 Disk Drive",
                                 "Milpitas, CA 95134",
                                 "USA"]
            , customerName = "Jane Q. Citizen"
            }
