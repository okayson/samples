## キャッシュ変数設定

	set(<variable name> <value> CACHE <type> <description>)
	
	# BOOLのみ
	option(<variable name> <description> [initial value])

type: BOOL, PATH, FILEPATH, STRING, INTERNAL, UNINITIALIZED
  INTERNAL: ccmakeなどで表示されない。


## 利用例

	cmake            #step1.setで指定したデフォルト値が使用される
	cmake -DVAR1=hey #step2.Cache変数上書き 
	cmake            #step3.step2で指定した値が使用される

## Cache変数上書き 

1. cmake -DVAR1=hey
1. ccmake


