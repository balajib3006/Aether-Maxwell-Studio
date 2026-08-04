include("D:/Projects/Qt/Aether-Maxwell-Studio/app/Studio/build/Desktop_Qt_6_11_0_llvm_mingw_64_bit-Debug/.qt/QtDeploySupport.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/AetherMaxwellStudio-plugins.cmake" OPTIONAL)
set(__QT_DEPLOY_I18N_CATALOGS "qtbase")

qt6_deploy_runtime_dependencies(
    EXECUTABLE "D:/Projects/Qt/Aether-Maxwell-Studio/app/Studio/build/Desktop_Qt_6_11_0_llvm_mingw_64_bit-Debug/AetherMaxwellStudio.exe"
    GENERATE_QT_CONF
)
