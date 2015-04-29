#!/usr/bin/python

import sys
import csv

if len(sys.argv) == 4 or len(sys.argv) == 5:
	if len(sys.argv) == 4:
		delim = ' '
	else:
		delim = sys.argv[4]

	infile = open(sys.argv[1], 'r')
	outfile = open(sys.argv[2], 'w')
	class_pos = int(sys.argv[3])

	data = csv.reader(infile, delimiter=delim, quotechar='|')

	class_dict = {}
	class_num = 1

	for row in data:		
		line = ''
		count = 0
		feature = 1
		for el in row:
			if count == class_pos:
				if el.isdigit():
					line = el + line
				elif el in class_dict:
					line = class_dict[el] + line
				else:
					class_dict[el] = str(class_num)
					line = class_dict[el] + line
					class_num += 1
			else:
				line = line + ' ' + str(feature) + ':' + el
				feature += 1
			count += 1

		outfile.write(str(line) + '\n')

	outfile.close()
else:
	print('Wrong number of arguments')