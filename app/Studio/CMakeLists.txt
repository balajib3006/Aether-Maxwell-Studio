cmake_minimum_required(VERSION 3.19)
project(AetherMaxwellStudio
    VERSION 0.1.0
    HOMEPAGE_URL https://github.com/balajib3006/Aether-Maxwell-Studio.git
    LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Widgets LinguistTools)

qt_standard_project_setup()

qt_add_executable(AetherMaxwellStudio
    WIN32 MACOSX_BUNDLE
    main.cpp
    mainwindow.cpp
    mainwindow.h
    mainwindow.ui
)

qt_add_translations(
    TARGETS AetherMaxwellStudio
    TS_FILES AetherMaxwellStudio_en_IN.ts
)

target_link_libraries(AetherMaxwellStudio
    PRIVATE
        Qt::Core
        Qt::Widgets
)

install(TARGETS AetherMaxwellStudio
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_app_script(
    TARGET AetherMaxwellStudio
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})