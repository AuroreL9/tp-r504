def puissance(a,b):
	if (not type(a) is int) or (not type(b) is int):
		raise TypeError("seul des int peuvent être allouer")
	return a ** b
