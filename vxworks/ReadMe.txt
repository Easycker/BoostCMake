         vxWorks �������֧��˵��

�� PPC (PowerPC) Ϊ��:

 1. ������Ҫ�� vxWorks.cmake �ļ����Ƶ�:
    CMAKE\share\cmake-2.6\Modules\Platform
    Ŀ¼�� ( ���� vxWorks ƽ̨֧���ļ�, �������Ҫ������������
    �޸�����Ӧ���� vxWorks �汾 );

 2. vxworks-gnu-ppc.cmake �� wxWorks PPC �µ� GCC ������
    �����ļ�, ��Ҫ�������Ƶ����� vxWorks Makefiles �� bat 
    /bash �ű�����Ŀ¼��;

 3. ������ Makefiles �� bat/bash �ű��а�����ķ�ʽ����:
    %CMAKE% -DCMAKE_BUILD_TYPE=Debug
            -DCMAKE_C_COMPILER_WORKS=1
            -DCMAKE_CXX_COMPILER_WORKS=1
            -DCMAKE_TOOLCHAIN_FILE=vxworks-gnu-ppc.cmake
            -DBUILD_SPEC=%PRODUCT_CARD%
            -G "Unix Makefiles"
 
 4. ���� WIND_PLATFORM ��������, vxWorks.cmake �ᶨ�����º�:
       VXWORKS
       VXWORKS_5X
       VXWORKS_6X
    ������ CMakeLists.txt �ļ����������ж�:
      # ֻ�� VC ��Ч:
      IF (MSVC)
          TARGET_LINK_LIBRARIES(test ws2_32 wininet)
      ENDIF (MSVC)
      # ��� vxWorks �κΰ汾:
      IF (VXWORKS)
          TARGET_LINK_LIBRARIES(test vxsock)
      ENDIF (VXWORKS)
      # ֻ��� vxWorks 6.x:
      IF (VXWORKS_6X)
          TARGET_LINK_LIBRARIES(nsplib vxsock63)
      ENDIF (VXWORKS)


 5. ע������: ���� Makefile �͹���ʱ, ����Ҫ�� vxWorks ����
    �����½��� (��ȷ����ػ����������Ѿ����ù�);
