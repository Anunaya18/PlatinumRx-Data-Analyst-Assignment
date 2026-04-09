def remove_dup(s):
    res = ""
    for c in s:
        if c not in res:
            res += c
    return res

print(remove_dup("programming"))
