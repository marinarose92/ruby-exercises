def bubble_sort(arr)
# increment variable
x = 0
	# this loop runs for the length of the array
	while x < arr.length
	# increments once per loop
	x += 1
		# runs through the array
		arr.each_with_index do |number, i|
			# prevents from adding one extra to the last number in array
			if arr[i + 1] != nil
				# if the first number is higher than the second number
				if arr[i] > arr[i + 1]
					# swap places
					arr[i + 1], arr[i] = arr[i], arr[i + 1]
				end
			end
		end
	end
	return arr
end

def bubble_sort_by(arr)
	x = 0
	# this loop runs for the length of the array
	while x < arr.length
	# increments once per loop
	x += 1
		# runs through the array of strings
		arr.each_with_index do |string, i|
				# prevents from adding one extra to the last number in array
				if arr[i + 1] != nil
					# yield to block below
					value = yield(arr[i + 1],arr[i])
					# if return value is less than zero
					if value < 0
						# swap places
						arr[i + 1], arr[i] = arr[i], arr[i + 1]
					end
				end
			end
		return arr
	end
end


# Use this to test the first method 

bubble_sort([4,3,78,2,0,2])

# Use this to test the second method

# bubble_sort_by(["hi","hello","hey"]) do |left,right|
#     left.length - right.length
#     end


#Below is original code I refactored for the first method.
    # if arr[-1] < arr[-2]
    # arr[-1], arr[-2] = arr[-2], arr[-1]
    # end
    # if arr[-2] < arr[-3]
    # arr[-2], arr[-3] = arr[-3], arr[-2]
    # end
    # if arr[-3] < arr[-4]
    # arr[-3], arr[-4] = arr[-4], arr[-3]
    # end
    # if arr[-4] < arr[-5]
    # arr[-4], arr[-5] = arr[-5], arr[-4]
    # end
    # if arr[-5] < arr[-6]
    # arr[-5], arr[-6] = arr[-6], arr[-5]
    # end