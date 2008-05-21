# the name of the target operating system
SET(CMAKE_SYSTEM_NAME vxWorks)

# which compilers to use for C and C++
INCLUDE(CMakeForceCompiler)
CMAKE_FORCE_C_COMPILER("ccppc" GNU)
CMAKE_FORCE_CXX_COMPILER("c++ppc" GNU)
SET(CMAKE_C_COMPILER_ARG1 "ccppc")
SET(CMAKE_CXX_COMPILER_ARG1 "c++ppc")

# binary tools
SET(VXWORKS_AR "arppc")
SET(VXWORKS_RANLIB "ranlibppc")
SET(VXWORKS_STRIP "stripppc")
SET(VXWORKS_LINKER "ldppc")
SET(VXWORKS_NM "nmppc")
SET(VXWORKS_OBJDUMP "objdumpppc")
SET(VXWORKS_OBJCOPY "objcopyppc")
