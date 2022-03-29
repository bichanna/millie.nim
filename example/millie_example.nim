import ../src/millie

echo(millify(4200)); # prints 4.2K
echo(millify(10000, lowercase=true)); # print 10k
echo(millify(1250000, space=true, lowercase=true, precision=3)); # print 1.25 m
echo(millify(1000040000, precision=6)); # print 1.00004B
echo(millify(100000000000000000)); # print 100P
echo(millify(-7809, precision=3, space=true)); # print -7.809 K