

library(shiny)
shinyUI(fluidPage(
    
    
    
    navbarPage("Fuel Economy",
    tabPanel("Prediction",
    
    fluidRow(
        
      
       column(3,
               sliderInput("EngDispl","Engine Displacement (in litres)",value=3,min=1,max=8.4,step = 0.1),
           
             selectInput("NumCyl", label = h3("Number of Cylinders"), 
                             choices = list("2 Cylinders" = 2, "3 Cylinders" = 3,
                                            "4 Cylinders" = 4,"5 Cylinders"=5,"6 Cylinders"=6,
                                            "8 Cylinders"=8,"10 Cylinders"=10,"12 Cylinders"=12,"16 Cylinders"=16), 
                                                selected = 4),
                 selectInput("Transmission", label = h3("Transmission"), 
                             choices = list("A4" = "A4", "A5" = "A5",
                                            "A6" = "A6","A7"="A7","AM6"="AM6",
                                            "AM7"="AM7","AV"="AV","AVS6"="AVS6","M5"="M5",
                                            "M6"="M6","S4"="S4","S5"="S5","S6"="S6","S7"="S7","S8"="S8","Other"="Other"), 
                                         selected = 4),
                    selectInput("IntakeValvePerCyl", label = h3("Intake Valve per Cylinder"), 
                   choices = list("None" = 0, "One" = 1,
                                  "Two" = 2,"Three"=3),selected = 1)),
            
    
       
                
       column(3,         
                
                radioButtons("AirAspirationMethod", label = h3("Air Aspiration Method"),
                              choices = list("Turbocharged" = "Turbocharged", "Naturally Aspirated" = "NaturallyAspirated",
                                             "Supercharged" = "Supercharged"),selected = "Turbocharged"),
                 radioButtons("TransLockup", label = h3("Transmission Lockup"),
                              choices = list("Yes" = 1, "No" = 0),selected = 1),
                 radioButtons("TransCreeperGear", label = h3("Transmission Creeper Gear"),
                              choices = list("Yes" = 1, "No" = 0),selected = 1)),
       column(3,           
       
                selectInput("DriveDesc", label = h3("Drive"), 
                             choices = list("Rear Wheel Drive" = "TwoWheelDriveRear", "Front Wheel Drive" = "TwoWheelDriveFront",
                                            "All Wheel Drive" = "AllWheelDrive","Four Wheel Drive"="FourWheelDrive",
                                            "Part Time Four Wheel Drive"="ParttimeFourWheelDrive"),selected = 1),
                selectInput("CarlineClassDesc", label = h3("Carline Description"), 
                            choices = list("Two Seaters" = "2Seaters", "Mini compact" = "MinicompactCars",
                                           "Subcompact" = "SubcompactCars","Compact"="CompactCars","Midsize"="MidsizeCars",
                                           "Large"="LargeCars","Small Station Wagons"="SmallStationWagons","Other"="Other",
                                           "Small Pickup Trucks 2WD"="SmallPickupTrucks2WD",
                                           "Small Pickup Trucks 4WD"="SmallPickupTrucks4WD","Standard Pickup Trucks 2WD"="StandardPickupTrucks2WD",
                                           "Standard Pickup Trucks 4WD"="StandardPickupTrucks4WD","Vans Cargo Types"="VansCargoTypes",
                                           "Vans Passenger Type"="VansPassengerType",
                                           "Special Purpose Vehicle minivan 2WD"="SpecialPurposeVehicleminivan2WD",
                                           "Special Purpose Vehicle SUV 2WD"="SpecialPurposeVehicleSUV2WD",
                                           "Special Purpose Vehicle SUV 4WD"="SpecialPurposeVehicleSUV4WD"), 
                            selected = 1),
                radioButtons("VarValveLift", label = h3("Variable Valve Lift"),
                             choices = list("Yes" = 1, "No" = 0),selected = 1)),
       
       actionButton("actionButton", "Predict Fuel Economy"),
       br(),
       br(),
       
       br(),
       h4("The Predicted Fuel Economy is:"),
       #textOutput("prediction")
       
       # verbatimTextOutput("prediction"),   
       verbatimTextOutput("prediction")
    )
    ),
    
    tabPanel("Summary",
    h1("Summary of the",strong("cars2010"), "Dataset"),
    #h2("Summary of",strong("mtcars"),"dataset")
    verbatimTextOutput("summary")       
             
             
             
     ),
    
             
    tabPanel("Data and Model", 
             h1("Description of the Data"),
             h4("I used the cars2010 dataset in the AppliedPredictiveModeling package. The data includes information about the fuel economy of cars in 2010."),
             h3("More info on the data set can be found here"),
             helpText(   a("http://rpackages.ianhowson.com/cran/AppliedPredictiveModeling/man/FuelEconomy.html",     
                           href="http://rpackages.ianhowson.com/cran/AppliedPredictiveModeling/man/FuelEconomy.html")),
             
             br(),
             h1("The Model Used"),
             h4("I used multivariable regression to predict the dependency of fuel economy in cars on: engine displacement, number of cylinders, transmission, 
                air aspiration method, transmission lockup, transmission creeper gear, the drive type, intake valve per cylinder, description of the carline and variable valve lift. 
                The model was chosen after using stepwise regression and the the 'gears' effect was removed due to his co-linearity with the 'Transmission' effect."),
              h3("Anova of the model"),
             verbatimTextOutput("anova")       
             
                
            
    )
               
            
        )
        

    )
)


