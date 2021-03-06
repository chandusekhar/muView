#-------------------------------------------------
#
# Project created by QtCreator 2011-12-26T20:42:08
#
#-------------------------------------------------

#QT       += core gui opengl

TEMPLATE = lib
CONFIG += staticlib
TARGET = data

DESTDIR     = ../../bin/libs
OBJECTS_DIR = ../../bin/build/data_lib/.obj
MOC_DIR     = ../../bin/build/data_lib/.moc
RCC_DIR     = ../../bin/build/data_lib/.rcc
UI_DIR      = ../../bin/build/data_lib/.ui

INCLUDEPATH += ../../../Common/include
INCLUDEPATH += /usr/local/Cellar/gcc/6.3.0_1/lib/gcc/6/gcc/x86_64-apple-darwin16.3.0/6.3.0/include

win32:DEFINES += _CRT_SECURE_NO_WARNINGS

win32:QMAKE_CXXFLAGS += -openmp
unix:QMAKE_CXXFLAGS  += -openmp -L/usr/local/Cellar/gcc/6.3.0_1/lib/gcc/6/gcc/x86_64-apple-darwin16.3.0/6.3.0/libcc

SOURCES += \
    ../../../Common/src/Data/PointData.cpp \
    ../../../Common/src/Data/Mesh/TetMesh.cpp \
    ../../../Common/src/Data/Mesh/TriMesh.cpp \
    ../../../Common/src/Data/Mesh/PointMesh.cpp \
    ../../../Common/src/Data/Mesh/HexMesh.cpp \
    ../../../Common/src/Data/Mesh/QuadMesh.cpp \
    ../../../Common/src/Data/Mesh/KDTree.cpp \
    ../../../Common/src/Data/DistanceField.cpp \
    ../../../Common/src/Data/Mesh/SolidMesh.cpp \
    ../../../Common/src/Data/Mesh/EdgeMesh.cpp \
    ../../../Common/src/Data/MultiDimensionalData.cpp \
    ../../../Common/src/Data/DenseMultiDimensionalData.cpp \
    ../../../Common/src/Data/VolumetricData.cpp \
    ../../../Common/src/Data/Mesh/ColorMesh.cpp \
    ../../../Common/src/Data/Mesh/OrientationMesh.cpp \
    ../../../Common/src/Data/KMeansClustering.cpp \
    ../../../Common/src/Data/MultiDimensionalDataVector.cpp \
    ../../../Common/src/Data/FiberDirectionData.cpp


HEADERS  += \
    ../../../Common/include/Data/PointData.h \
    ../../../Common/include/Data/Mesh/TetMesh.h \
    ../../../Common/include/Data/Mesh/TriMesh.h \
    ../../../Common/include/Data/Mesh/PointMesh.h \
    ../../../Common/include/Data/Mesh/HexMesh.h \
    ../../../Common/include/Data/Mesh/SolidMesh.h \
    ../../../Common/include/Data/Mesh/QuadMesh.h \
    ../../../Common/include/Data/Mesh/KDTree.h \
    ../../../Common/include/Data/FiberDirectionData.h \
    ../../../Common/include/Data/DistanceField.h \
    ../../../Common/include/Data/Mesh/EdgeMesh.h \
    ../../../Common/include/Data/MultiDimensionalData.h \
    ../../../Common/include/Data/DenseMultiDimensionalData.h \
    ../../../Common/include/Data/VolumetricData.h \
    ../../../Common/include/Data/Mesh/ColorMesh.h \
    ../../../Common/include/Data/Mesh/Primitives.h \
    ../../../Common/include/Data/Mesh/OrientationMesh.h \
    ../../../Common/include/Data/KMeansClustering.h \
    ../../../Common/include/Data/MultiDimensionalDataVector.h \
    ../../../Common/include/Data/MappedData.h





