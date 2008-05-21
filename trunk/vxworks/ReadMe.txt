         vxWorks 交叉编译支持说明

以 PPC (PowerPC) 为例:

 1. 首先需要把 vxWorks.cmake 文件复制到:
    CMAKE\share\cmake-2.6\Modules\Platform
    目录下 ( 这是 vxWorks 平台支持文件, 你可能需要对它进行少量
    修改以适应其它 vxWorks 版本 );

 2. vxworks-gnu-ppc.cmake 是 wxWorks PPC 下的 GCC 工具链
    配置文件, 需要把它复制到生成 vxWorks Makefiles 的 bat 
    /bash 脚本所在目录下;

 3. 在生成 Makefiles 的 bat/bash 脚本中按下面的方式调用:
    %CMAKE% -DCMAKE_BUILD_TYPE=Debug
            -DCMAKE_C_COMPILER_WORKS=1
            -DCMAKE_CXX_COMPILER_WORKS=1
            -DCMAKE_TOOLCHAIN_FILE=vxworks-gnu-ppc.cmake
            -DBUILD_SPEC=%PRODUCT_CARD%
            -G "Unix Makefiles"
 
 4. 根据 WIND_PLATFORM 环境变量, vxWorks.cmake 会定义以下宏:
       VXWORKS
       VXWORKS_5X
       VXWORKS_6X
    可以在 CMakeLists.txt 文件中做条件判断:
      # 只对 VC 有效:
      IF (MSVC)
          TARGET_LINK_LIBRARIES(test ws2_32 wininet)
      ENDIF (MSVC)
      # 针对 vxWorks 任何版本:
      IF (VXWORKS)
          TARGET_LINK_LIBRARIES(test vxsock)
      ENDIF (VXWORKS)
      # 只针对 vxWorks 6.x:
      IF (VXWORKS_6X)
          TARGET_LINK_LIBRARIES(nsplib vxsock63)
      ENDIF (VXWORKS)


 5. 注意事项: 生成 Makefile 和构建时, 都需要在 vxWorks 编译
    环境下进行 (即确保相关环境变量都已经设置过);
