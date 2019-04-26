#!/usr/bin/python3

import sys

def brank():
    print('   ', end='')

def bar():
    print('│  ', end='')

def branch():
    print('├', end='')

def right_angle():
    print('└', end='')

def divide(num_list, depth):
    out = []
    temp = []
    for i,num in enumerate(num_list):
        # append if temp is empty
        if len(temp) == 0:
            temp.append(num)
            continue

        if num > depth:
            temp.append(num)
        else:  # else next temp
            out.append(temp)
            temp = [num]
    if len(temp) != 0:
        out.append(temp)
    return out

def output(final):
    for i,bar_bool in enumerate(final):
        if i == len(final)-1:
            if bar_bool:
                right_angle()
            else:
                branch()
        else:
            if bar_bool:
                brank()
            else:
                bar()
    
    global index
    name = list(lines[index].split('|')[-1])
    name.pop(0)
    name[0] = '─ '
    name = ''.join(name)
    print(name, end='')
    index += 1
    return

def my_tree(n_bars, depth, final):
    divided = divide(n_bars, depth)
    if len(divided) == 1:
        if len(list(set(divided[0]))) == 1:
            for i,_ in enumerate(divided[0]):
                if i != len(divided[0])-1:
                    output(final+[False])
                else:
                    output(final+[True])
            return

    for i,n_bars_div in enumerate(divided):
        if i != len(divided)-1:
            next_final = final+[False]
            output(next_final)
        else:
            next_final = final+[True]
            output(next_final)
        n_bars_div.pop(0)
        my_tree(n_bars_div, depth+1, next_final)
    return

def main():
    global lines
    global index
    lines = sys.stdin.readlines()
    index = 0
    
    n_bars = [len(i.split('|'))-1 for i in lines]
    depth=1
    my_tree(n_bars, depth, [])

if __name__ == '__main__':
    main()
