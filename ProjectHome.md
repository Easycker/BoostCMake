BoostCMake 是一个简洁的 CMake 构建框架, 用来加快项目的部署, 和简化 CMake 构建过程.

BoostCMake 适用于对外发布二进制文件的内部项目开发. 特点:

  * 在桌面GUI软件, 控制台程序, 中大型嵌入式交叉编译系统均应用过, 对简化开发过程,提高 Makefile/DSW工程文件的可维护性作用明显;

  * Visual Studio: 自动根据目录结构创建工程树形文件列表;

  * 支持按目录添加源文件 ( ADD\_SRC\_DIR 宏 );

  * 支持 vxWorks 5.5/6.x ( 见 vxworks 目录, 可以按 vxWorks 的方式自行扩展支持其它嵌入式系统 );

  * 可以修改 BoostCMake 任何文件以支持更复杂的情况;