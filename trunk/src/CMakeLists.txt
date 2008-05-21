# 当项目比较大, 源文件较多是, 单独用 FILES.cmake 来存放源文件信息会让项目构建更清晰, 方便后期维护
# 项目较小时, 也可以合并 CMakeLists.txt 和 FILES.cmake
INCLUDE(FILES.cmake)

############################# hello static library ####################################
ADD_LIBRARY(hello STATIC ${hello_srcs})

############################# test ####################################

ADD_EXECUTABLE(test ${test_srcs})
TARGET_LINK_LIBRARIES(test hello)
