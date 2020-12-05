
# Notes

## ライブラリ作成

add_libraryでライブラリ作成を指示する。
add_library(name ...[STATIC | SHARED ] ... or BUILD_SHARED_LIBS=[ON|OFF]で静的ライブラリか動的ライブラリかを指定できる。

## Includeディレクトリの公開指定

target_include_directoriesでIncludeディレクトリの公開方法を指定できる。
※ライブラリの場合のみ

PUBLIC: コマンドの内容が"自分自身"と"自分に依存するターゲット"に反映される
PRIVATE: コマンドの内容が"自分自身"にのみ反映される
INTERFACE: コマンドの内容が"自分に依存するターゲット"にのみ反映される

## soのバージョン

CMakeLists.txtのset_target_propertiesでVERSIONを指定して、BUILD_SHARED_LIBS=ONでConfigureすると、生成されるsoにはバージョン番号が付与される。バージョンなしlibはバージョンありlibへのsymbolic linkとなる。

	$ cd mylib
	$ touch build
	$ cd build
	$ cmake -DBUILD_SHARED_LIBS=ON ..
	$ cmake --build .
	$ ls
	-rw-r--r-- 1 kenichi kenichi 11326 12月  5 23:54 CMakeCache.txt
	drwxr-xr-x 5 kenichi kenichi  4096 12月  5 23:54 CMakeFiles/
	-rw-r--r-- 1 kenichi kenichi  4962 12月  5 23:54 Makefile
	-rw-r--r-- 1 kenichi kenichi  1556 12月  5 23:53 cmake_install.cmake
	lrwxrwxrwx 1 kenichi kenichi    17 12月  5 23:54 libmylib.so -> libmylib.so.1.0.0*
	-rwxr-xr-x 1 kenichi kenichi  8736 12月  5 23:54 libmylib.so.1.0.0*



