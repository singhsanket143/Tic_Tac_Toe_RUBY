puts "Welcome to the Tic Tac Toe Game"
puts "*******************************"

puts "Enter the value of the grid in which you want to play"
n = gets
puts "The grid size you entered is "+n.to_s
n = n.to_i

array=Array.new(n) {Array.new(n)}


counter=0
check = false
choice = "Y"
continue=true


for i in 0...n
	for j in 0...n
		array[i][j]="_______"
	end
end


def gamestatus n,array,counter
	text1=""
	text2=""
	row=0
	col=0
	#test in rows
	if(counter<n*n)
		while(row<n)
			col=0
			while(col<(n-1))
				text1=array[row][col]
				text2=array[row][col+1]
				if((text1 != text2) || text1=="_______")
					break
				end
				col=col+1
			end
			if(col==(n-1))
				if(text1=="___X___")
					puts "X Wins"
					
					return true 
				else
					puts "O Wins"
					return true
				end
			end
			row=  row + 1 
		end

		#test in cols
		col = 0
		while(col < n)
			row = 0
			while(row < n-1)
				text1=array[row][col]
				text2=array[row+1][col]
				if((text1 != text2) || text1=="_______")
					break
				end
				row = row + 1
			end
			if(row == (n-1))
				if(text1=="___X___")
					puts "X Wins"
					
					return true 
				else
					puts "O Wins"
					return true
				end
			end
			col = col + 1
		end

		# test for diag 1

		row = 0
		col = 0
		while(row < (n-1))
			text1=array[row][col]
			text2=array[row+1][col+1]
			if((text1 != text2) || text1=="_______")
				break
			end
			row=row+1
			col=col+1
		end
		if(row == (n-1))
			if(text1=="___X___")
				puts "X Wins"			
				return true 
			else
				puts "O Wins"
				return true
			end
		end

		#test in diag 2
		row = n-1
		col=0
		while(row > 0)
			text1=array[row][col]
			text2=array[row-1][col+1]
			if((text1 != text2) || text1=="_______")
				break
			end
			row=row-1
			col=col+1
		end
		if(row==0)
			if(text1=="___X___")
				puts "X Wins"			
				return true 
			else
				puts "O Wins"
				return true
			end
		end

	else 
		puts "tie"
		return true
	end
end 


def display array,n
	for i in 0...n
		for j in 0...n
			#print array[i][j] 
			print "       |"
		end
		print "\n"
		for j in 0...n
			print array[i][j] 
			print "|"
		end
		print "\n"
		
		
	end
end



def play turn,array,counter,n
	if turn == 1
		puts "Player X Enter your choice "
		choiceR = gets
		choiceC = gets
		choiceR=choiceR.to_i
		choiceC=choiceC.to_i
		if(choiceR>=n || choiceC>=n || array[choiceR][choiceC]=="___X___" || array[choiceR][choiceC]=="___0___"  )
			puts "Invalid Input"
			puts "Please ReEnter Your choice"
			#play turn,array,counter,n
			return 1
		end
		array[choiceR][choiceC]="___X___"
		counter=counter + 1
		
		display array,n

		return 0 
	else 
		puts "Player O Enter your choice "
		choiceR = gets
		choiceC = gets
		choiceR=choiceR.to_i
		choiceC=choiceC.to_i
		if(choiceR>=n || choiceC>=n || array[choiceR][choiceC]=="___X___" || array[choiceR][choiceC]=="___0___"  )
			puts "Invalid Input"
			puts "Please ReEnter Your choice"
			#play turn,array,counter,n
			return 0
		end
		array[choiceR][choiceC]="___0___"
		counter=counter + 1
		
		display array,n
		
		return 1
	end
end

display array,n


#while (continue==true)
	while check != true
		turn = play turn,array,counter,n
		check=gamestatus n,array,counter
	end
	#puts "Do you want to play again ?"
	#choice = gets
	#if (choice=="N" || choice == "n")
	#	check=false	
	#	continue=false
	#end

#end



 puts "Thank You !!!!!!"