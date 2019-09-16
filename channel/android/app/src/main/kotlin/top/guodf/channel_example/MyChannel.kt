package top.guodf.channel_example

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StringCodec
import java.nio.ByteBuffer

class MyChannel(private val binaryMessenger: BinaryMessenger,private val name:String, private val messageCodec: StringCodec= StringCodec.INSTANCE) {

    public fun send(msg:String){
        binaryMessenger.send(name,messageCodec.encodeMessage(msg))
    }

    fun setHandler(binaryMessageHandler: BinaryMessenger.BinaryMessageHandler?) {
        binaryMessenger.setMessageHandler(name, binaryMessageHandler);
    }
}
