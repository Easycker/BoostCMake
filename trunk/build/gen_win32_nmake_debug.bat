:: Author : Yang Yubo
@setlocal ENABLEEXTENSIONS
@echo off

:: �����Ŀ��Ŀ¼
set ROOT=%~dp0..

set CMAKE=cmake.exe

:: ����Ŀ¼
md win32_nmake_debug 2>nul
cd win32_nmake_debug

:: ��ʹ�� ADD_SRC_DIR �궯̬����Դ�ļ��б�ʱ,
:: ��ɾ�� CMakeCache.txt �ᵼ������/ɾ���ļ���, CMake ������Դ�ļ��б�
del /Q /F CMakeCache.txt

:: �رձ�������鹦��: -DCMAKE_CXX_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_FORCED=1 -DCMAKE_C_COMPILER_WORKS=1 -DCMAKE_CXX_COMPILER_WORKS=1
:: CMake Ĭ�Ͽ�����һ������ `GNU Autotools` ���ߵ��Զ����ù���: ���Ҳ����Ա������Ƿ����������뵱ǰԴ��.
:: ������ⷢ������Դ��, ���õ�ǡ��, ���ܱ�֤����ִ��֮ǰ�û���֪���ܲ��ܳɹ�����Դ��, �����ڱ��뵽һ�������ٷ����������±���.
:: �������ڲ�������ֻ���ⷢ���������ļ�, ������������ȶ�, ������ܴ������, �˷�ʱ��.
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
