import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Layouts 1.15


ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Smarthouse"

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
                width: 50
                height: 50



                onClicked: {
                    stackView.push(settingsPageComponent)
                }
            }

            // Текстове поле
            Text {
                id: mainText
                anchors.top: settingsButton.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Your text here")
                font.pixelSize: 24
            }

            // Колонка кнопок
            Column {
                anchors.top: mainText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Button {
                    text: qsTr("Температура дому")
                    onClicked: {
                        // ...
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
                        // ...
                    }
                }
            }
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
