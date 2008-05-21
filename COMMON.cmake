# Author: Yang Yubo
# COMMON.cmake -- Convient cmake macros

SET(ROOT ${CMAKE_SOURCE_DIR})
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS ON)

# Add all source files at specified dir to target
MACRO(ADD_SRC_DIR srcs_var dir)
    FILE(GLOB _mcaddsrc_src_ ${dir}/*.cpp ${dir}/*.c ${dir}/*.h ${dir}/*.hpp)
    
    LIST(LENGTH _mcaddsrc_src_ srcs_count)
    
    IF (srcs_count GREATER 0)
        _ADD_SRC_FILES_(${srcs_var} ${dir} ${_mcaddsrc_src_})
        MESSAGE("Added source directory [${dir}] to [${srcs_var}]")
    ENDIF()
ENDMACRO()


# Exlude source file from already added source dir
MACRO (EXCLUDE_SRC_FILE srcs_var file)
    GET_FILENAME_COMPONENT(abs_file_path ${file} ABSOLUTE)
    
    LIST(LENGTH ${srcs_var} srcs_count)
    
    SET(i 0)
    WHILE (i LESS ${srcs_count})
        LIST(GET ${srcs_var} ${i} src_file)
        GET_FILENAME_COMPONENT(abs_src_path ${src_file} ABSOLUTE)
        
        IF (abs_file_path STREQUAL ${abs_src_path})
            LIST(REMOVE_AT ${srcs_var} ${i}) # remove file from srcs list
            MATH(EXPR i "${i}+${srcs_count}") # break the loop
            MESSAGE("Excluded source file [${file}] from [${srcs_var}]")
        ENDIF()
        
        MATH(EXPR i "${i}+1")
    ENDWHILE()
ENDMACRO()

# Add source file to target
MACRO(ADD_SRC_FILE srcs_var file)
    GET_FILENAME_COMPONENT(dir ${file} PATH)
    _ADD_SRC_FILES_(${srcs_var} ${dir} ${file})
    MESSAGE("Added source file [${file}] to [${srcs_var}]")
ENDMACRO()

# Add include dir to compiler search path, and also add to Visual Studio file group browser
MACRO(ADD_INC_DIR srcs_var dir)
    FILE(GLOB _mcaddsrc_src_ ${dir}/*.h ${dir}/*.hpp ${dir}/fixbug_vs6.fake)
    
    LIST(LENGTH _mcaddsrc_src_ srcs_count)
    
    IF (srcs_count GREATER 0)
        # LIST(APPEND ${srcs_var} ${_mcaddsrc_src_})
        INCLUDE_DIRECTORIES(SYSTEM ${dir})
        _ADD_SRC_FILES_(${srcs_var} ${dir} ${_mcaddsrc_src_})
        MESSAGE("Added include directory [${dir}] to [${srcs_var}]")
    ENDIF()
ENDMACRO()

# FOR INERNAL USE
MACRO(_ADD_SRC_FILES_ srcs_var dir) # files are in the ${ARGN}
    LIST(APPEND ${srcs_var} ${ARGN})
    # remove ../ and ./
    GET_FILENAME_COMPONENT(group ${dir} ABSOLUTE)
    FILE(RELATIVE_PATH group ${CMAKE_SOURCE_DIR} ${group})
    
    STRING(REPLACE "../" "" group ${group})
    STRING(REPLACE "./" "" group ${group})
    # change / to "\\"
    STRING(REPLACE "/" "\\" group ${group})
    SOURCE_GROUP(${group} FILES ${ARGN})
ENDMACRO()
