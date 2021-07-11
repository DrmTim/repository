f = open(r"C:\Users\DrmTim\Downloads\Monefy.Data.22.12.2020.csv", 'r', encoding='UTF8')
line = f.readline()

current_month = ''
current_month_list = ['', 0, 0]
output = list()

while line:
    list_line = line.split(';')

    if (list_line[0] == 'date') or ("Initial" in list_line[2]) or ("To" in list_line[2]) or ("From" in list_line[2]):
        line = f.readline()
        continue

    list_line[0] = '01' + list_line[0][2:]

    if list_line[0] != current_month:

        if current_month != '':
            output.append(list(current_month_list))

        current_month = list_line[0]

        current_month_list[0], current_month_list[1], current_month_list[2] = current_month, 0, 0

    value = float(list_line[5].replace('\xa0', ''))
    if value > 0:
        current_month_list[1] += value
    elif value < 0:
        current_month_list[2] += abs(value)

    line = f.readline()
    if line == '':
        output.append(list(current_month_list))
f.close()

summary = 0
for each in output:
    each[1] = round(each[1], 2)
    each[2] = round(each[2], 2)
    each.append(round(each[1] - each[2], 2))

    summary += each[3]
    each.append(summary)

with open(r"C:\Users\DrmTim\Downloads\Monefy.csv", 'w', encoding='UTF8') as f:
    for line in output:
        string = ''
        for in_line in line:
            string = string + str(in_line).replace('.', ',') + ';'
        print(string[:-1], file=f)

        # print(*line, sep=';', file=f)
