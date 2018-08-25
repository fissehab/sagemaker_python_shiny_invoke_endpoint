
library(shiny)

library(reticulate)
library(shinydashboard)
header <- dashboardHeader(
  title = "Invoking Amazon SageMaker Endpoint",
  titleWidth = 800
  
)
dashboardPage(header,skin = "black",
dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
  # Define UI for application that draws a histogram
  fluidPage(

    br(),
    tags$p(' This dashboard makes predictions using a model deployed into production using Amazon SageMaker hosting services. 
           It also shows the steps from data preparation to model deployment and how to invoke the endpoint within SageMaker and outside of SageMaker.'
           ,style="text-align:center;color:#4d4d00;font-size:130%"),
    
    br(),
    br(),

    tabsetPanel(type = "tabs",
                
                tabPanel(h4("Make Predictions"),

                         br(),
                         br(),

                         tags$em("The model was built using hourly rental data spanning two years. The training set is comprised of the first 19 days of each month,
                                 while the test set is the 20th to the end of the month. Here, you can invoke the endpoint deployed using SageMaker to predict for different feature combinations",
                                 style="text-align:center;color:#1a001a;font-size:120%"),

                         br(),
                         br(),
                         br(),
                         br(),




                         fluidRow(
                           column(width = 2,
                                  selectInput("season",
                                              label = em("Season",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = seq(1,4), selected = 3)
                           ),
                           column(width = 1,

                                  selectInput("holiday",
                                              label = em("Holiday",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = c(0,1), selected = 0)
                           ),
                           column(width = 1,

                                  selectInput("workingday",
                                              label = em("Working Day?",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = c(0,1), selected =1)
                           ),
                           column(width = 2,

                                  selectInput("weather",
                                              label = em("Weather",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = seq(1,4), selected =1)
                           ),

                           column(width = 2,
                                  numericInput("temp",
                                              label = em("Temperature",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              30.4, min = 0, max = 40)
                           ),

                           column(width = 2,
                                  numericInput("atemp",
                                              label = em("'Feels Like' Temperature",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              25, min = 0, max = 50)
                           ),
                           column(width = 2,
                                  numericInput("humidity",
                                              label = em("Humidity",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              59, min = 16, max = 100)
                           )
                         ),
                         fluidRow(
                           column(width = 2,
                                  numericInput("windspeed",
                                              label = em("Wind Speed",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              30, min = 0, max = 60)
                           ),



                           column(width = 2,
                                  selectInput("year",
                                              label = em("Year",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = c(2011, 2012), selected =2012)
                           ),

                           column(width = 1,
                                  selectInput("month",
                                              label = em("Month",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = seq(1,12), selected =8)
                           ),

                           column(width = 1,
                                  selectInput("day",
                                              label = em("Day",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = seq(20,31), selected =25)
                           ),



                           column(width = 2,
                                  selectInput("dayofweek",
                                              label = em("Day of Week",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = c(0, 1), selected =1)
                           ),


                           column(width = 2,
                                  selectInput("hour",
                                              label = em("Hour",style="text-align:center;color:#4d4d00;font-size:110%"),
                                              choices = seq(0,23), selected =12)
                           )
                           ),


                         actionButton("go", label = tags$h4("Go",style="text-align:center;color:red;font-size:150%")),

                         fluidRow(
                           #verbatimTextOutput('features'),
                           br(),
                           br(),
                             column(width = 5,
                             textOutput('text')),

                           tags$head(tags$style("#text{color: blue;
                                 font-size: 20px;
                                 font-style: italic;
                                 }"
                         )
              )
                         )
                ),




                
                tabPanel(h4("Data preprocessing"), includeHTML("https://datascience-enthusiast.com/Miscellaneous/data_preprocessing.html")),
                tabPanel(h4("Model Training"), includeHTML("https://datascience-enthusiast.com/Miscellaneous/model_Building.html")),
                tabPanel(h4("Invoke Endpoint in SageMaker"), includeHTML("https://datascience-enthusiast.com/Miscellaneous/using_endpoint_for_inference_in_sagemaker.html")),
                tabPanel(h4("Invoke SageMaker From the Outside World"), includeHTML("https://datascience-enthusiast.com/Miscellaneous/invoke_from_outside.html")),
                tabPanel(h4("R Shiny Code"), includeHTML("https://datascience-enthusiast.com/Miscellaneous/sagemaker_shiny_code.nb.html"))
             
    )
    
    
    
  ))
  )
  