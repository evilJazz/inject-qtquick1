import QtQuick 1.0

QtObject {
    function calculate() {
        return b * 13;
    }

    property int a: calculate()
    property int b: 3
}

