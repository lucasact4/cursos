# Escreva um programa que leia um NÚMERO N inteiro qualquer e mostre na tela os
# N primeiros elementos de uma SEQUÊNCIA DE FIBONACCI.
# Ex:
# 0 → 1 → 1 → 2 → 3 → 5 → 8
print('=-'*15)
print('-'*15)
print('Sequência de Fibonacci')
print('-'*15)
n = int(input('Quantos termos você quer mostrar? '))
t1 = 0
t2 = 1
print('~'*15)
print(f'{t1} → {t2}', end='')
cont = 3
while cont <= n:
    t3 = t1 + t2
    print(f' → {t3}', end='')
    t1 = t2
    t2 = t3
    cont += 1
print(' → FIM')
print('=-'*15)
