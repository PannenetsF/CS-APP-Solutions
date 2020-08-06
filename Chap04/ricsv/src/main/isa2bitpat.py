isa = [
    # {'name': ,        'fmt':,         'opcode': ,     'f3': ,     'f7': },   
    {'name': 'ld' ,     'fmt': 'i',     'opcode': 0x03, 'f3': 0x3,  'f7': None},   
    {'name': 'sd' ,     'fmt': 'i',     'opcode': 0x23, 'f3': 0x3,  'f7': None},   
    {'name': 'beq' ,    'fmt': 'sb',    'opcode': 0x63, 'f3': 0x0,  'f7': 0x00},
    {'name': 'add' ,    'fmt': 'r' ,    'opcode': 0x33, 'f3': 0x0,  'f7': 0x00},
    {'name': 'sub' ,    'fmt': 'r' ,    'opcode': 0x33, 'f3': 0x0,  'f7': 0x20},
    {'name': 'and' ,    'fmt': 'r' ,    'opcode': 0x33, 'f3': 0x7,  'f7': 0x00},
    {'name': 'or'  ,    'fmt': 'r' ,    'opcode': 0x33, 'f3': 0x6,  'f7': 0x00}
]

def isa2bitpat(dic):
    if dic['fmt'] == 'r':
        bit7 = bin(dic['f7'])
        bit7 = bit7[2:]
        bit7 = '0' * (7 - len(bit7)) + bit7
        bit3 = bin(dic['f3'])
        bit3 = bit3[2:]
        bit3 = '0'*(3-len(bit3)) + bit3
        op = bin(dic['opcode'])
        op = op[2:]
        op = '0'*(7-len(op)) + op
        b31_25 = bit7 
        b24_15 = '?'*10
        b14_12 = bit3
        b11_7  = '?'*5
        b6_0   = op 
        return 'def     %s = BitPat("b%s")'%(dic['name'].upper(), (b31_25 + b24_15 + b14_12 + b11_7 + b6_0))
    elif dic['fmt'] == 'i' or dic['fmt'] == 's' or dic['fmt'] == 'sb':
        bit3 = bin(dic['f3'])
        bit3 = bit3[2:]
        bit3 = '0'*(3-len(bit3)) + bit3
        op = bin(dic['opcode'])
        op = op[2:]
        op = '0'*(7-len(op)) + op
        b31_25 = '?'*7 
        b24_15 = '?'*10
        b14_12 = bit3
        b11_7  = '?'*5
        b6_0   = op 
        return 'def     %s = BitPat("b%s")'%(dic['name'].upper(), (b31_25 + b24_15 + b14_12 + b11_7 + b6_0))    
    elif dic['fmt'] == 'u' or dic['fmt'] == 'uj':
        op = bin(dic['opcode'])
        op = op[2:]
        op = '0'*(7-len(op)) + op
        b31_25 = '?'*7
        b24_15 = '?'*10
        b14_12 = bit3
        b11_7  = '?'*5
        b6_0   = op 
        return 'def\t%s\t=\tBitPat("b%s")'%(dic['name'].upper(), (b31_25 + b24_15 + b14_12 + b11_7 + b6_0))
    
for i in isa:
    print(isa2bitpat(i))