from sage.all import *
import sympy as sy
import pyperclip

x = var('x')
y = var('y')
z = var('z')
t = var('t')

f = input("What is the function to be integrated: ")
d = input('With respect to: ')
p = input("Press 1 for indefinite and press 2 for definite: ")

if float(p) == 2 :
    a = input("What is the lower bound: ")
    b = input("What is the upper bound: ")
    if d == 'x' :
        i = integrate(f, (x, float(a), float(b)))
    if d == 'y' :
        i = integrate(f, (y, float(a), float(b)))
    if d == 'z' :
        i = integrate(f, (z, float(a), float(b)))
    if d == 't' :
        i = integrate(f, (t, float(a), float(b)))
    if d != 'x' and d != 'y' and d != 'z' and d != 't' :
        print('Can\'t integrate with respect to', d, 'fix the program on your own...')
    
if float(p) == 1 :
    if d == 'x' :
        i = integrate(f, x)
    if d == 'y' :
        i = integrate(f, y)
    if d == 'z' :
        i = integrate(f, z)
    if d == 't' :
        i = integrate(f, t)
    else :
        print('Can\'t integrate with respect to', d, 'fix the program or use a different variable')
 
if float(p) != 1 and float(p) != 2 :
    input('I said 1 or 2: ')

lat = latex(i)

image = input('Do you want an image 1 for yes anything else for no: ')

if image == '1' :
    n = input('What should the path of the file be: ')

    if float(p) == 1 :
        sy.preview(r'$%s + c$' % lat, viewer='file', filename=n, euler=false, dvioptions=['-D','300'])
        copy = '$$' + lat + '+ c' + '$$'
        input(print('$$',lat,'+ c','$$'))
        pyperclip.copy(copy)

    if float(p) == 2: 
        sy.preview(r'$%s$' % lat, viewer='file', filename=n, euler=false, dvioptions=['-D','300'])
        copy = '$$' + lat + '$$'
        input(print('$$',lat,'$$'))
        pyperclip.copy(copy)

