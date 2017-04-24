a = []
b = []
c = []
n = []
g = []
t = []
e = 5

f = open("data.txt", "r")

for i in xrange(e):
    a.append(ZZ(f.readline()))
    b.append(ZZ(f.readline()))
    c.append(ZZ(f.readline()))
    n.append(ZZ(f.readline()))
    aii = inverse_mod(a[i], n[i])
    g.append((x + b[i] * aii)^e - c[i] * aii^5)

for i in xrange(e):
    tl = []
    for j in xrange(e):
        if i == j:
            tl.append(1)
        else:
            tl.append(0)
    t.append(crt(tl, n))

N = prod(n)

K = Zmod(N)
P.<x> = PolynomialRing(K, implementation='NTL')

pol = 0
for i in xrange(e):
    pol += t[i] * g[i]

pp = 0
for coeff, deg in pol.coefficients():
    pp += ZZ(Mod(coeff, N)) * x^deg

for r in pp.small_roots():
    flag = hex(int(r)).replace("0x", "").replace("L", "").decode("hex")
    print "flag: {}".format(flag)
