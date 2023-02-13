# this scrips introduced a class named Fast_math
# that i have tested to be faster than the math module
# along with some of back up functions
# that i have tested to be faster than the math module

import Fast_math
p=10**9+7
Mod=p
qpower=Fast_math.qpower
ModFact=Fast_math.ModFact
modinv=Fast_math.modinv
modinv2=Fast_math.modinv2
class Fast_math:
    def __init__(self) -> None:
        self.Mod=[10**9+7]*2

    def qpower(x,y):
        res = 1
        while y:
            if y % 2 != 0:
                res *= (x%p)
                res %= p
            y >>= 1
            x *= (x%p)
            x%=p
        return res

    def extgcd(a, b):
        """ calcule a*x + b*y = gcd(a, b) """
        if b == 0:
            return a, 1, 0
        else:
            d, y, x = Fast_math.extgcd(b, a % b)
            return d, x, y - (a // b) * x

    def modinv(a, m):
        """ calcule a^-1 mod m """
        g, x, y = Fast_math.extgcd(a, m)
        if g != 1:
            raise Exception('modular inverse does not exist')
        return x % m

    def modinv2(a, m):
        """ calcule a^-1 mod m """
        return qpower(a,m-2)%m

    # hand write fact is faster than math.factorial
    # but modfact is slitely faster
    def fact(n,p):
        """ calcule n! mod MOD """
        f = 1
        for i in range(2, n + 1):
            f = (f * i) % p
        return f


    def ModFact(n, p):
        """ calcule n! mod p """
        ans=1
        if n <= p//2:
            #calculate the factorial normally (right argument of range() is exclusive)
            for i in range(2,n+1):
                ans = (ans * i) % p   
        else:
            #Fancypants method for large n
            for i in range(n+1,p):
                ans = (ans * i) % p
            ans = Fast_math.modinv(ans, p)
            ans = -1*ans + p
        return ans % p

    # Combination
    # there's not much difference between the 4 methods

    def comb1(N,M):
        N,M=min(N,M),max(N,M)
        f=Fast_math.fact
        a=f(M,p)%Mod
        b=f(N,p)%Mod
        c=f(M-N,p)%Mod
        return a*qpower(b*c,Mod-2)%Mod

    def comb2(N, M):
        N,M=min(N,M),max(N,M)
        f=Fast_math.fact
        a=f(M,p)%p
        b=qpower(f(N,p),p-2)%p
        c=qpower(f(M-N,p),(p-2))%p
        return a*b*c%p

    def comb3(n, k):
        """ calcule C(n, k) mod p """
        if n < k:
            return 0
        if n == k:
            return 1
        return ModFact(n, p) * modinv(ModFact(k, p) * ModFact(n - k, p) % p, p) % p
        
    def comb4(n, k):
        """ calcule C(n, k) mod p """
        if n < k:
            return 0
        if n == k:
            return 1
        return ModFact(n, p) * modinv2(ModFact(k, p) * ModFact(n - k, p) % p, p) % p