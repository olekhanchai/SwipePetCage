QT = core
QT += serialport

CONFIG += console
CONFIG -= app_bundle

TARGET = cwriterasync
TEMPLATE = app

HEADERS += \
    serialportwriter.h \
    serialportreader.h \

SOURCES += \
    main.cpp \
    serialportwriter.cpp \
    serialportreader.cpp \


