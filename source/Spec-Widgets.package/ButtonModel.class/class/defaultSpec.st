specs
defaultSpec
	<spec>
	^ {#ButtonSpec.
	    		#on:getState:action:label:menu:. 	#model. #state. #action. #label. #nil.
			#getEnabledSelector:. 				#enabled.
			#hResizing:. 						#spaceFill.
			#vResizing:. 						#spaceFill.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#askBeforeChanging:.				#(model askBeforeChanging).
			#setBalloonText:.					{ #model . #help}.
			#eventHandler:.					{	#EventHandler. #on:send:to:. #keyStroke.	#keyStroke:fromMorph:. #model	}}