package top.guodf.channel_example

import android.annotation.SuppressLint
import android.icu.util.DateInterval
import android.os.Bundle
import android.provider.ContactsContract
import android.util.EventLog

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.*
import io.flutter.plugins.GeneratedPluginRegistrant
import java.nio.ByteBuffer
import java.text.SimpleDateFormat
import java.util.*

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    val binaryMessenger=registrarFor("package top.guodf.channel_example").messenger()
    val channel=MyChannel(binaryMessenger,"mychannel")
    channel.setHandler(MyEventMessageHandler(channel, StringCodec.INSTANCE))
  }
}

class MyBinaryMessageHandler(private val messageCodec: StringCodec) : BinaryMessenger.BinaryMessageHandler {
  override fun onMessage(arg: ByteBuffer?, reply: BinaryMessenger.BinaryReply) {
    val argStr=messageCodec.decodeMessage(arg)
    reply.reply(messageCodec.encodeMessage(argStr))
  }
}

class MyEventMessageHandler(private val channel:MyChannel, private val messageCodec: StringCodec):BinaryMessenger.BinaryMessageHandler {
  @SuppressLint("SimpleDateFormat")
  override fun onMessage(arg: ByteBuffer?, reply: BinaryMessenger.BinaryReply) {
    val formatter = SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss")
    val curDate = Date(System.currentTimeMillis())
    val str = formatter.format(curDate)
    channel.send(str);
    reply.reply(messageCodec.encodeMessage(null))
  }
}
