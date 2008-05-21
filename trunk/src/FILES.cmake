#   ADD_SRC_DIR()  --  把整个目录下的源文件添加到目标
#   ADD_SRC_FILE() --  把某个源码文件添加到目标
#   EXCLUDE_SRC_FILE() -- 排除某个源码文件, 通常在调用 ADD_SRC_DIR() 之后
#   
#   添加/删除源码文件后要重新执行 build/gen_xxx.bat 文件以便更新工程文件/Makefiles.

INCLUDE(${CMAKE_SOURCE_DIR}/COMMON.cmake)

############################# hello static library ####################################
ADD_SRC_DIR(hello_srcs hello)
ADD_SRC_DIR(hello_srcs hello/msgbox)


############################# test executable ####################################
ADD_SRC_DIR(test_srcs test)
