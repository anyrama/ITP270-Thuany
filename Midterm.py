def middle_element (lst):

if len(lst)%2 == 1
	index1 = int(len(lst)/2-0.5)
	indext2 = -(int(len(lst)/2))
	median = (lst[index1]+ lst[index2])/2
	return median
else:
	index= int(len(lst)/2-0.5)
	return lst[index]

print (middle_element([5,2,-4]))

