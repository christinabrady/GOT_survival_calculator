library(shiny)
library(shinydashboard)
source("./global.R")


shinyUI(dashboardPage(skin = "blue",
	dashboardHeader(title = ""),
	dashboardSidebar(
		sidebarMenu(
			menuItem("Calculator", tabName = "cal"),
			menuItem("Documentation", tabName = "doc")
		)
	), 

	dashboardBody(
			tabItems(
				tabItem("cal",
					h2("So you're planning a trip to The Known World?"),
					br(),
					h3("Its a dangerous place! Take a short survey to see if you are likely to survive."),
					fluidRow(
						box(width = 4, title = "What is your surname? (choose one or enter your own)",
							selectizeInput(inputId = "name", label = NULL, choices = NULL, options = list(create = TRUE))
						)
					),

					fluidRow(
						box(width = 4, title = "How old are you?",
							numericInput(inputId = "age_value", label = NULL, value = NULL)
						)
					),

					fluidRow(
						box(width = 4, title = "Will you attend a wedding?",
							radioButtons(inputId = "wed", label = NULL, choices = list("Yes" = "yes", "No" = "no"), selected = NULL, inline = TRUE)
						), 

						# box(width = 8, solidHeader = TRUE, title = NULL, 
							uiOutput('fm')	
						# )
					),

					fluidRow(
						box(width = 4, title = "Do you plan to or have you ever started a war?",
							radioButtons(inputId = "war", label = NULL, choices = list("Yes" = "yes", "No" = "no"), selected = NULL, inline = TRUE)
						)
					),

					fluidRow(
						box(width = 4, title = "Do you have children?",
							radioButtons(inputId = "children", label = NULL, choices = list("Yes" = "yes", "No" = "no"), selected = NULL, inline = TRUE)
						)
					), 

					fluidRow(
						box(width = 4, title = "Do you identify as male or female?",
							radioButtons(inputId = "gender", label = NULL, choices = list("Male" = "male", "Female" = "female"), selected = NULL, inline = TRUE)
						)
					), 

					fluidRow(
						column(4, 
							actionButton(inputId = "submit", label = "Submit")
						)
					)
				),

				tabItem("doc", 
					fluidRow(
						# box(width = 8, 
      						includeMarkdown("./include/documentation.md")
    					# )	
					)
					
				)
		
			)
	)
))		
