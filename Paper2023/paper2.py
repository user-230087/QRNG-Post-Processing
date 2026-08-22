def matr_mult(A, B):
    r = [[0]*len(B[0]) for _ in range(len(A))]
    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(B)):
                r[i][j] += A[i][k] * B[k][j]
    return r

def matr_mult_bit(A, B):
    r = [[0]*len(B[0]) for _ in range(len(A))]
    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(B)):
                r[i][j] ^= A[i][k] & B[k][j]
    return r

def mtr_add(A, B):
    res = []
    for i in range(len(A)):
        ele_a = A[i][0] 
        ele_b = B[i][0] 
        res_ele = ele_a ^ ele_b 
        res.append([res_ele])
    return res

def initialize(m, n):
    matr = [] 
    for i in range(m):
        rw = []
        for j in range(n):
            rw.append(0)
        matr.append(rw)
    return matr

n = 16 
k = 4
nop = n/k 
nop = int(nop)

B = [[1], [0], [1], [0], [1], [1], [0], [0], [1], [1], [1], [0], [0], [1], [0], [1]]        #Input bitstring as a column matrix

A = [[0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1],                                      #Toeplitz matrix
     [1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1],
     [1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0]]



dmatr = []
for i in range(k):
    st = i*k
    ed = i*k + k 
    temp_ele = B[st:ed]
    dmatr.append(temp_ele)

res = initialize(3, 1)
print(res)
print("*"*50)
for i in range(len(dmatr)): 
    toeplitz_temp = []
    for j in A: 
        st = i*k 
        ed = i*k + k 
        toeplitz_temp.append(j[st:ed])
    temp = matr_mult_bit(toeplitz_temp, dmatr[i])
    print(temp)
    res = mtr_add(res, temp)

print("*"*50)
print(res)
