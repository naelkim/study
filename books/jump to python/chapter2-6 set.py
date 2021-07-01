s1 = set([1, 2, 3])
# {1, 2, 3}

s2 = set("Hello")
# {'e', 'H', 'l', 'o'}

s1 = set([1, 2, 3])
l1 = list(s1)
# [1, 2, 3]

l1[0] # 1

t1 = tuple(s1)
# (1, 2, 3)

t1[0] # 1


# intersection 
s1, s2 = set([1, 2, 3, 4, 5, 6]), set([4, 5, 6, 7, 8, 9])
s1 & s2
# {4, 5, 6}

s1.intersection(s2)
# {4, 5, 6}


# union
s1 | s2
# {1, 2, 3, 4, 5, 6, 7, 8, 9}

s1.union(s2)
# {1, 2, 3, 4, 5, 6, 7, 8, 9}



# complement / difference
s1 - s2
# {1, 2, 3}

s2 - s1
# {8, 9, 7}

s1.difference(s2)
# {1, 2, 3}

s2.difference(s1)
# {8, 9, 7}


# add
s1 = set([1, 2, 3])
s1.add(4)
# {1, 2, 3, 4}


# update
s1 = set([1, 2, 3])
s1.update([4, 5, 6])
# {1, 2, 3, 4, 5, 6}


# remove 
s1 = set([1, 2, 3])
s1.remove(2)
# {1, 3}


