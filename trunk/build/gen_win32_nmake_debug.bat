:: Author : Yang Yubo
@setlocal ENABLEEXTENSIONS
@echo off

:: 获得项目主目录
set ROOT=%~dp0..

set CMAKE=cmake.exe

:: 工程目录
md win32_nmake_debug 2>nul
cd win32_nmake_debug

:: 当使用 ADD_SRC_DIR 宏动态生成源文件列表时,
:: 不删除 CMakeCache.txt 会导致增加/删除文件后, CMake 不更新源文件列表
del /Q /F CMakeCache.txt

:: 关闭编译器检查功能: -DCMAKE_CXX_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_WORKS=1 -DCMAKE_CXX_COMPILER_WORKS=1
:: CMake 默认开启了一个类似 `GNU Autotools` 工具的自动配置功能: 查找并测试编译器是否有能力编译当前源码.
:: 如果对外发布的是源码, 运用的恰当, 它能保证编译执行之前用户就知道能不能成功编译源码, 不至于编译到一半出错后再反复测试重新编译.
:: 但对于内部开发或只对外发布二进制文件, 开发环境相对稳定, 这个功能纯粹多余, 浪费时间.
%CMAKE% -DCMAKE_CXX_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_WORKS=1 -DCMAKE_CXX_COMPILER_WORKS=1 -DCMAKE_BUILD_TYPE=Debug -G "NMake Makefiles" ../../

if %errorlevel% NEQ 0 goto :error
goto :exit

:error
echo ============                                       ============
echo ============ !! ERROR !! Please check CMake output ============
echo ============                                       ============

:exit
pause
endlocal
