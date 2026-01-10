pragma Singleton
import QtQml
import org.kde.kirigami as Kirigami

QtObject {
    readonly property string battery_left: i18n("Left")
    readonly property string battery_right: i18n("Right")
    readonly property string battery_case: i18n("Case")
    readonly property string battery_single: i18n("Charge")

    readonly property string disconnected: i18n("Headphones disconnected")
    
    readonly property string socket_error_header: i18n("MagicPodsCore is not running")
    readonly property string socket_error_description: i18n("Start MagicPodsCore or MagicPodsDecky, then press Reconnect")
    readonly property string socket_error_button: i18n("Reconnect")
    
    readonly property string info: i18n("Info")
    readonly property string headphones: i18n("Headphones")
    readonly property string bluetooth: i18n("Bluetooth")
    readonly property string menu: i18n("Menu")
    readonly property string menu_home: i18n("Home page")
    readonly property string menu_issue: i18n("Report issue")
    readonly property string menu_donate: i18n("Donate")
    readonly property string pin: i18n("Keep open")




    readonly property string headphones_empty: i18n("Pair headphones to make them appear in the list")
    readonly property string headphones_disconnected: i18n("Connect headphones to display their battery level and adjust settings")

    readonly property string anc_off: i18n("Off")
    readonly property string anc_anc: i18n("Noise cancellation")
    readonly property string anc_wind: i18n("Wind cancellation")
    readonly property string anc_tra: i18n("Transparency")
    readonly property string anc_adaptive: i18n("Adaptive")
    
    readonly property string devices: i18n("Устройства")
    readonly property string capabilities_header: i18n("Options")

    //bool
    readonly property string conversation_awareness: i18n("Conversation awareness")
    readonly property string personalized_volume: i18n("Personalized volume")
    readonly property string anc_one_airpod: i18n("ANC with one AirPod")
    readonly property string volume_swipe: i18n("Volume swipe")
    
    //combobox
    readonly property string adaptive_audio_noise: i18n("Adaptive mode")
    readonly property string adaptive_audio_noise_more: i18n("More noise")
    readonly property string adaptive_audio_noise_default: i18n("Default")
    readonly property string adaptive_audio_noise_less: i18n("Less noise")

    readonly property string press_and_hold_duration: i18n("Press and hold duration")
    readonly property string press_and_hold_duration_default: i18n("Default")
    readonly property string press_and_hold_duration_shorter: i18n("Shorter")
    readonly property string press_and_hold_duration_shortest: i18n("Shortest")

    readonly property string press_speed: i18n("Press speed")
    readonly property string press_speed_default: i18n("Default")
    readonly property string press_speed_slower: i18n("Slower")
    readonly property string press_speed_slowest: i18n("Slowest")

    
    readonly property string volume_swipe_length: i18n("Volume swipe length")
    readonly property string volume_swipe_length_default: i18n("Default")
    readonly property string volume_swipe_length_longer: i18n("Longer")
    readonly property string volume_swipe_length_longest: i18n("Longest")

    readonly property string end_call: i18n("End call")
    readonly property string end_call_twice: i18n("Press twice")
    readonly property string end_call_once: i18n("Press once")
    readonly property string mute_unmute: i18n("Mute and unmute")

    readonly property string bluetooth_codec: i18n("Bluetooth codec")

    //slider
    readonly property string tone_volume: i18n("Tone volume")
}
