

# Notes

## $B%i%$%V%i%j:n@.(B

add_library$B$G%i%$%V%i%j:n@.$r;X<($9$k!#(B
add_library(name ...[STATIC | SHARED ] ... or BUILD_SHARED_LIBS=[ON|OFF]$B$G@EE*%i%$%V%i%j$+F0E*%i%$%V%i%j$+$r;XDj$G$-$k!#(B

## Include$B%G%#%l%/%H%j$N8x3+;XDj(B

target_include_directories$B$G(BInclude$B%G%#%l%/%H%j$N8x3+J}K!$r;XDj$G$-$k!#(B
$B"(%i%$%V%i%j$N>l9g$N$_(B

PUBLIC: $B%3%^%s%I$NFbMF$,(B"$B<+J,<+?H(B"$B$H(B"$B<+J,$K0MB8$9$k%?!<%2%C%H(B"$B$KH?1G$5$l$k(B
PRIVATE: $B%3%^%s%I$NFbMF$,(B"$B<+J,<+?H(B"$B$K$N$_H?1G$5$l$k(B
INTERFACE: $B%3%^%s%I$NFbMF$,(B"$B<+J,$K0MB8$9$k%?!<%2%C%H(B"$B$K$N$_H?1G$5$l$k(B

## so$B$N%P!<%8%g%s(B

CMakeLists.txt$B$N(Bset_target_properties$B$G(BVERSION$B$r;XDj$7$F!"(BBUILD_SHARED_LIBS=ON$B$G(BConfigure$B$9$k$H!"@8@.$5$l$k(Bso$B$K$O%P!<%8%g%sHV9f$,IUM?$5$l$k!#%P!<%8%g%s$J$7(Blib$B$O%P!<%8%g%s$"$j(Blib$B$X$N(Bsymbolic link$B$H$J$k!#(B

	$ cd mylib
	$ touch build
	$ cd build
	$ cmake -DBUILD_SHARED_LIBS=ON ..
	$ cmake --build .
	$ ls
	-rw-r--r-- 1 kenichi kenichi 11326 12$B7n(B  5 23:54 CMakeCache.txt
	drwxr-xr-x 5 kenichi kenichi  4096 12$B7n(B  5 23:54 CMakeFiles/
	-rw-r--r-- 1 kenichi kenichi  4962 12$B7n(B  5 23:54 Makefile
	-rw-r--r-- 1 kenichi kenichi  1556 12$B7n(B  5 23:53 cmake_install.cmake
	lrwxrwxrwx 1 kenichi kenichi    17 12$B7n(B  5 23:54 libmylib.so -> libmylib.so.1.0.0*
	-rwxr-xr-x 1 kenichi kenichi  8736 12$B7n(B  5 23:54 libmylib.so.1.0.0*



