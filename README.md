# BoostCMake v1.1

BoostCMake 是一个简洁的 CMake 构建框架，用来加快项目的部署，和简化 CMake 构建过程。

本项目原本由开发者 @yangyubo 发布于 [Google Code](https://code.google.com/archive/p/boostcmake/)，后因平台停止服务，本人将迁移至 Github。

BoostCMake 适用于对外发布二进制文件的内部项目开发，特点：

* 在桌面 GUI 软件、控制台程序、中大型嵌入式交叉编译系统均应用过, 对简化开发过程，提高 Makefile/DSW 工程文件可维护性的作用明显；
* Visual Studio：自动根据目录结构创建工程树形文件列表；
* 支持按目录添加源文件（ADD_SRC_DIR 宏）；
* 支持 vxWorks 5.5/6.x（见 vxworks 目录，可以按 vxWorks 的方式自行扩展支持其它嵌入式系统）；
* 可以修改 BoostCMake 任何文件以支持更复杂的情况。
     
BoostCMake 包含一个演示项目, 双击 build 目录下的 bat 文件会在相应子目录生成工程文件或 Makefiles :

    gen_win32_mingw_debug.bat   --  MinGW Makefiles
    gen_win32_mingw_release.bat --  MinGW Makefiles
    gen_win32_nmake_debug.bat   --  NMake Makefiles
    gen_win32_nmake_release.bat --  NMake Makefiles
    gen_win32_vs6.bat           --  Visual C++ 6.0
    gen_win32_vs8.bat           --  Visual C++ 2008

BoostCMake 在 BSD 协议下发布。
