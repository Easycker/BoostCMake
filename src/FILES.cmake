#   ADD_SRC_DIR()  --  ������Ŀ¼�µ�Դ�ļ���ӵ�Ŀ��
#   ADD_SRC_FILE() --  ��ĳ��Դ���ļ���ӵ�Ŀ��
#   EXCLUDE_SRC_FILE() -- �ų�ĳ��Դ���ļ�, ͨ���ڵ��� ADD_SRC_DIR() ֮��
#   
#   ���/ɾ��Դ���ļ���Ҫ����ִ�� build/gen_xxx.bat �ļ��Ա���¹����ļ�/Makefiles.

INCLUDE(${CMAKE_SOURCE_DIR}/COMMON.cmake)

############################# hello static library ####################################
ADD_SRC_DIR(hello_srcs hello)
ADD_SRC_DIR(hello_srcs hello/msgbox)


############################# test executable ####################################
ADD_SRC_DIR(test_srcs test)
