
 library(AppliedPredictiveModeling)
 data(FuelEconomy)
 cars2010$TransLockup<-factor(cars2010$TransLockup)
 cars2010$TransCreeperGear<-factor(cars2010$TransCreeperGear)
 cars2010$VarValveLift<-factor(cars2010$VarValveLift)
 cars2010$IntakeValvePerCyl<-factor(cars2010$IntakeValvePerCyl)
 

 best_model <- lm(FE~EngDispl+NumCyl+Transmission+AirAspirationMethod+TransLockup
                 +TransCreeperGear+DriveDesc+IntakeValvePerCyl+CarlineClassDesc+VarValveLift,
                 data=cars2010)


shinyServer(function(input, output) {
    
    
    
    output$prediction <- renderText({ 
        
       if( input$actionButton>0)
        isolate({
          
            newdata = data.frame(EngDispl=input$EngDispl,NumCyl=integer(input$NumCyl), Transmission=input$Transmission,
                                 AirAspirationMethod=input$AirAspirationMethod,TransLockup=factor(input$TransLockup), 
                                 TransCreeperGear=factor(input$TransCreeperGear),DriveDesc=input$DriveDesc,
                                 IntakeValvePerCyl=factor(input$IntakeValvePerCyl), CarlineClassDesc=input$CarlineClassDesc,
                                 VarValveLift=factor(input$VarValveLift))
             prediction  <- predict(best_model,newdata)[1]
            
        })
    })
    
    output$summary <- renderPrint({
        summary(cars2010)
       
    })
    output$anova<-renderPrint({
        anova(best_model)
        
    })

 })