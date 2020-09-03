def bin32(x):
    s = bin(x)
    s = s[2:]
    s = (32-len(s))*'0' + s
    return s

print(bin32(0x3f800000))