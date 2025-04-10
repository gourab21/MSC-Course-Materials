import python as gd #filename
s=gd.code_name #code_name
question='537pq.r'  #to be saved at location      
l=int(input("Line No. "))  #line number to start
n=0
e=0
while True:       
    if s[n]=='\n':
        e+=1

    if e>=l-1:
        a=open(question,'a+') #
        a.write(s[n])
        sw=input()
        a.close()
    n+=1
