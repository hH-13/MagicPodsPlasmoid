import QtQuick
import QtWebSockets

Item {
    id: backend

    property bool allowReconnect: true
    property int maxAttempts: 3
    property int reconnectAttempts: 0
    property bool active: false
    property int socketState: WebSocket.Closing
    width: 0
    height: 0

    signal dataReceived(var json)

    Component.onCompleted: {
        if (active) {
            reconnectAttempts = maxAttempts
            socket.active = true
        }
    }

    function connectSocket() {
        reconnectAttempts = maxAttempts
        socket.active = true
    }

    function disconnectSocket() {
        allowReconnect = false
        socket.active = false
    }

    function sendToSocket(str) {
        if (socket.status === WebSocket.Open) {
            socket.sendTextMessage(str)
        }
    }

    function getAll() {
        sendToSocket(JSON.stringify({ method: "GetAll" }))
    }

    function getInfo() {
        sendToSocket(JSON.stringify({ method: "GetDeckyInfo" }))
    }

    function getDevices() {
        sendToSocket(JSON.stringify({ method: "GetDevices" }))
    }

    function getDefaultBluetoothAdapter() {
        sendToSocket(JSON.stringify({ method: "GetDefaultBluetoothAdapter" }))
    }

    function connectDevice(address) {
        sendToSocket(JSON.stringify({
            method: "ConnectDevice",
            arguments: { address: address }
        }))
    }

    function disconnectDevice(address) {
        sendToSocket(JSON.stringify({
            method: "DisconnectDevice",
            arguments: { address: address }
        }))
    }

    function enableDefaultBluetoothAdapter() {
        sendToSocket(JSON.stringify({ method: "EnableDefaultBluetoothAdapter" }))
    }

    function disableDefaultBluetoothAdapter() {
        sendToSocket(JSON.stringify({ method: "DisableDefaultBluetoothAdapter" }))
    }

    function setAnc(address, value) {
        sendToSocket(JSON.stringify({
            method: "SetCapabilities",
            arguments: {
                address: address,
                capabilities: {
                    anc: { selected: value }
                }
            }
        }))
    }

    function setCapability(capability, address, value) {
        var args = {}
        args[capability] = { selected: value }
        sendToSocket(JSON.stringify({
            method: "SetCapabilities",
            arguments: {
                address: address,
                capabilities: args
            }
        }))
    }

    function setLogLevel(value) {
        sendToSocket(JSON.stringify({
            method: "SetLogLevel",
            arguments: { selected: value }
        }))
    }

    WebSocket {
        id: socket
        url: "ws://localhost:2020"
        active: backend.active
        onStatusChanged: {
            backend.socketState = status
            if (status === WebSocket.Open) {
                reconnectTimer.stop()
                backend.getAll()
            } else if (status === WebSocket.Closed || status === WebSocket.Error) {
                if (backend.allowReconnect && backend.reconnectAttempts > 0) {
                    backend.reconnectAttempts -= 1
                    reconnectTimer.restart()
                }
            }
        }

        onTextMessageReceived: message => {
            try {
                const parsed = JSON.parse(message)
                backend.dataReceived(parsed)
            } catch (e) {
                console.log("Backend parse error", e)
            }
        }
    }

    Timer {
        id: reconnectTimer
        interval: 1000
        repeat: false
        onTriggered: {
            if (backend.allowReconnect) {
                socket.active = false
                socket.active = true
            }
        }
    }
}
