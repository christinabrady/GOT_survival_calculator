
shinyServer(function(input, output, session){
	updateSelectizeInput(session, "name", server = TRUE, choices = got_names, selected = NULL)	
	
	observe({
		if(input$submit == 0){
			return()
		}else{
			final_message1 <- character()

			lname <- as.character(input[['name']])

		## set special messages

			if(lname == "h'ghar"){
				final_message1 <- "You can probably escape death. I wouldn't worry about it."
			}else if(lname == "tyrell"){
				final_message1 <- "You won't die, but you will probably be thrown into a dungeon."
			}else if(lname == "snow"){
				final_message1 <- "You will die, but don't worry. Melissandre will bring you back."
			}else if(lname == "baratheon"){
				final_message1 <- "YOU ARE GOING TO DIE. DON'T GO!!!"
			}else if(lname == "melissandre"){
				final_message1 <- "You may have to bring someone back from the dead."
			}
			

		
		### build test data frame, example: test <- data.frame(age = 35, go_to_wedding = "no", children = "no", war = "no", house = "nohouse", gender = "female"

			if(lname %in% got_names[1:9]){
				house <- lname
			}else{
				house <- "nohouse"
			}
		
			isolate({
				test <- data.frame(age = input$age_value, go_to_wedding = input$wed, children = input$children, war = input$war, house = house, gender = input$gender)
				result <- predict(house_mod, newdata = test, type = "response")
	
			})
						

			### render final message
			final_message2 <- sprintf("You have a %s percent chance of surviving your trip.", round(result * 100, 2))
			
			if(length(final_message1) != 0){
				output$fm <- renderUI({  h2(final_message1) })
			}else{
				output$fm <- renderUI({ h2(final_message2) })
			}

		}
	})



})