import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Layouts 1.15


ApplicationWindow {
    id: window
    visible: true
    width: 720
    height: 1600
    title: "Smarthouse"
    background: Rectangle {
           color: "#F0F0F0" // Змініть цей колір на потрібний вам
       }

    InputPanel {
          id: inputPanel
          width: 360
          height: 160
          anchors.bottom: parent.bottom
          visible: false
      }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPageComponent
    }

    Component {
        id: mainPageComponent

        Item {


            Button {
                id: settingsButton // Додали id для кнопки налаштувань
                anchors.top: parent.top
                anchors.left: parent.left
                width: 150 // Змінено ширину кнопки на 100
                height: 50 // Змінено висоту кнопки на 50
                text: qsTr("Налаштування") // Додано текст для кнопки
                onClicked: {
                    stackView.push(settingsPageComponent)
                }
            }


            // Текстове поле
            Rectangle{
                id:mainTextRectangle
                    anchors.top: parent.top
                    anchors.topMargin: 130
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.7
                    height: parent.height * 0.3
                    border.color: "black"
                Text {
                    id: mainText
                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Текст данних")
                    font.pixelSize: 24
                }
            }



            // Колонка кнопок
            Column {
                anchors.top: mainTextRectangle.bottom
                anchors.left: parent.left
                anchors.leftMargin: 55
                spacing: 10

                Button {
                    text: qsTr("Температура дому")
                    onClicked: {
                        stackView.push(temperaturePageComponent)
                    }
                }

                Button {

                    text: qsTr("Полив")
                    onClicked: {
                        stackView.push(wateringPageComponent)
                    }
                }
                Button {
                    text: qsTr("Охорона")
                    onClicked: {
                        stackView.push(securityPageComponent)

                    }
                }
            }
        }
    }
    // Компонент для сторінки "Температура"
    Component {
        id: temperaturePageComponent

        Item {
            id: temperaturePage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            Text {
                text: "Температура в домі"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "Значення датчиків"
                anchors.top: parent.top
                anchors.topMargin: 70
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Колонка з чотирма рядками
            Column {
                anchors.top: parent.top
                anchors.topMargin: 90
                anchors.left: parent.left
                anchors.leftMargin: 15

                Text {
                    text: "Кухня     - значення"
                }

                Text {
                    text: "Кімната - значення"
                }

                Text {
                    text: "Котел     - значення"
                }

                Text {
                    text: "Батареї  - значення"
                }
            }
            Column{
            anchors.top: parent.top
            anchors.topMargin: 250
            anchors.left: parent.left
            anchors.leftMargin: 15
                // Чотири кнопки
            TextField {
                id: nightTariffTextField
                placeholderText: "Налаштування нічного тарифу"
                width: 300
                focus: true
                activeFocusOnPress: true

                onActiveFocusChanged: {
                    inputPanel.visible = nightTariffTextField.activeFocus;
                }
                onAccepted: {
                    var enteredValue = text;
                    // Логіка для обробки введеного значення термостату (enteredValue)
                }
            }

            TextField {
                id: thermostatTextField
                placeholderText: "Налаштування термостату"
                width: 300
                focus: true
                activeFocusOnPress: true
                onActiveFocusChanged: {
                           inputPanel.visible = thermostatTextField.activeFocus;
                       }
                onAccepted: {
                    var enteredValue = text;
                    // Логіка для обробки введеного значення термостату (enteredValue)
                }
            }

            TextField {
                id: timeSettingTextField
                placeholderText: "Налаштування часу"
                width: 300
                focus: true
                activeFocusOnPress: true
                onActiveFocusChanged: {
                           inputPanel.visible = timeSettingTextField.activeFocus;
                       }
                onAccepted: {
                    var enteredValue = text;
                    // Логіка для обробки введеного часу (enteredValue)
                }
            }



                Button {
                    text: "Журнал температури"

                    onClicked: {
                        stackView.push(temperatureJournalPageComponent)
                    }
                }
            }
        }
    }

    // Компонент для сторінки "Журнал температури"
    Component {
        id: temperatureJournalPageComponent

        Item {
            id: temperatureJournalPage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            Text {
                text: "Журнал\nтемператури"
                anchors.top: parent.top
                anchors.topMargin: 30
                 anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Row {
                       anchors.top: parent.top
                       anchors.topMargin: 90
                       anchors.horizontalCenter: parent.horizontalCenter
                       spacing: 15

                       Text { text: "Дата"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Час"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Кухня"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Кімната"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Котел"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Батареї"; horizontalAlignment: Text.AlignHCenter }
                   }

                   Rectangle {
                       id: dataTable
                       anchors.top: parent.top
                       anchors.topMargin: 130
                       anchors.horizontalCenter: parent.horizontalCenter
                       width: parent.width * 0.9
                       height: parent.height * 0.5
                       border.color: "black"

                       GridLayout {
                           columns: 6

                           Repeater {
                               model: yourDataModel

                               Text {
                                   text: modelData.date
                                    width: 50
                                   verticalAlignment: Text.AlignTop
                                   leftPadding: 10
                               }
                               Text {
                                   text: modelData.time
                                    width: 50
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.kichen
                                    width: 50
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.room
                                   width: 50
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.boiler
                                   width: 50
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.batteries
                                   width: 50
                                   verticalAlignment: Text.AlignTop
                               }
                           }
                       }
                   }


                    // Додати рядки з даними тут
                }

}

    // Сторінка для "Полив"
    Component {
        id: wateringPageComponent

        Item {
            id: wateringPage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            // Вертикальна колонка для елементів
            Column {
                anchors.left: parent.left // Вирівнюємо елементи по лівому краю
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter // Вертикально по центру
                spacing: 10  // Відступ між елементами

                Text {
                    text: "Показники датчиків"
                    // Вирівнювання тексту тепер не потрібно, оскільки колонка вирівнює елементи
                }

                Text {
                    text: "Д 1 - значення"
                }

                Text {
                    text: "Д 2 - значення"
                }

                Button {
                    text: "Налаштування часу"
                    onClicked: {
                        // Ваш код тут
                    }
                }

                Button {
                    text: "Розклад поливу"
                    onClicked: {
                        // Ваш код тут
                    }
                }

                Button {
                    text: "Журнал поливу"
                    onClicked: {
                        onClicked: {
                            stackView.push(wateringJournalPageComponent)
                        }

                    }
                }
            }
        }
    }
    // Компонент для сторінки "Журнал поливу"
    Component {
        id: wateringJournalPageComponent

        Item {
            id: wateringJournalPage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            Text {
                text: "Журнал\nполиву"
                anchors.top: parent.top
                anchors.topMargin: 30
                 anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Row {
                       anchors.top: parent.top
                       anchors.topMargin: 90
                       anchors.horizontalCenter: parent.horizontalCenter
                       spacing: window.width * 0.2

                       Text { text: "Дата"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Час"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Д1"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Д2"; horizontalAlignment: Text.AlignHCenter }
                   }

                   Rectangle {
                       id: dataTable
                       anchors.top: parent.top
                       anchors.topMargin: 130
                       anchors.horizontalCenter: parent.horizontalCenter
                       width: parent.width * 0.9
                       height: parent.height * 0.5
                       border.color: "black"

                       GridLayout {
                           columns: 4

                           Repeater {
                               model: yourDataModel

                               Text {
                                   text: modelData.date
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                                   leftPadding: 10
                               }
                               Text {
                                   text: modelData.time
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.d1
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.d2
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                               }
                           }
                       }
                   }


                    // Додати рядки з даними тут
                }

}
    // Сторінка для "Охорона"
    Component {
        id: securityPageComponent

        Item {
            id: securityPage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            Text {
                text: "Охорона"
                anchors.top: parent.top
                anchors.topMargin: 55
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "Показники датчиків"
                anchors.top: parent.top
                anchors.topMargin: 70
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Column {
                anchors.top: parent.top
                anchors.topMargin: 90
                anchors.left: parent.left  // Змінено вирівнювання по лівому краю
                anchors.leftMargin: 15

                Text {
                    text: "Датчик 1 - значення"
                }

                Text {
                    text: "Датчик 2 - значення"
                }

                Text {
                    text: "Датчик 3 - значення"
                }
            }

            Button {
                text: "Журнал охорони"
                anchors.top: parent.top
                anchors.topMargin: 300
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    stackView.push(securityJournalPageComponent)
                }
            }
        }
    }

    // Компонент для сторінки "Журнал охорони"
    Component {
        id: securityJournalPageComponent

        Item {
            id: securityJournalPage

            Button {
                text: "Назад"
                anchors.top: parent.top
                anchors.left: parent.left
                onClicked: {
                    stackView.pop()
                }
            }

            Text {
                text: "Журнал охорони"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Row {
                       anchors.top: parent.top
                       anchors.topMargin: 90
                       anchors.horizontalCenter: parent.horizontalCenter
                       spacing: window.width * 0.2

                       Text { text: "Дата"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Час"; horizontalAlignment: Text.AlignHCenter }
                       Text { text: "Датчик"; horizontalAlignment: Text.AlignHCenter }

                   }

                   Rectangle {
                       id: dataTable
                       anchors.top: parent.top
                       anchors.topMargin: 130
                       anchors.horizontalCenter: parent.horizontalCenter
                       width: parent.width * 0.9
                       height: parent.height * 0.5
                       border.color: "black"

                       GridLayout {
                           columns: 3

                           Repeater {
                               model: yourDataModel

                               Text {
                                   text: modelData.date
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                                   leftPadding: 10
                               }
                               Text {
                                   text: modelData.time
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                               }
                               Text {
                                   text: modelData.sensor
                                   Layout.fillWidth: true
                                   verticalAlignment: Text.AlignTop
                               }

                           }
                       }
                   }


            // Тут можна додавати дані до таблиці
        }
    }





    Component {
        id: settingsPageComponent

        Item {
            id: settingsPage

            Button {
                       text: "Назад"
                       anchors.top: parent.top
                       anchors.left: parent.left
                       onClicked: {
                           stackView.pop()
                       }
            }
            // Вертикальна колонка для вирівнювання по центру
                   Column {
                       anchors.centerIn: parent  // Центруємо колонку в батьківському елементі
                       spacing: 10  // Відступ між елементами

                       Text {
                           text: "Налаштування підключення"
                           horizontalAlignment: Text.AlignHCenter  // Вирівнювання тексту по горизонталі
                       }

                       // Горизонтальний рядок для кнопок
                       Row {
                           spacing: 10  // Відступ між кнопками

                           Button {
                               text: "СМС"
                               onClicked: {
                                   // Логіка для налаштування СМС
                               }
                           }

                           Button {
                               text: "Інтернет"
                               onClicked: {
                                   // Логіка для налаштування Інтернету
                               }
                    }
                }
            }
        }
    }
}
