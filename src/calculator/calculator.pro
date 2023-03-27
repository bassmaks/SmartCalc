QT       += core gui printsupport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    ../parser.c \
    ../smartcalc.c \
    ../stack.c \
    main.cpp \
    qcustomplot.cpp \
    smartcalc_v1.cpp

HEADERS += \
    ../smartcalc.h \
    qcustomplot.h \
    smartcalc_v1.h

FORMS += \
    smartcalc_v1.ui

TRANSLATIONS += \
    calculator_en_001.ts
CONFIG += release
CONFIG += embed_translations

win32: RC_ICONS += calculator_icon.ico
unix: RC_ICONS += calculator_icon.png
macx: ICON = calculator_icon.icns

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    calculator_icon.ico \
    calculator_icon.png
