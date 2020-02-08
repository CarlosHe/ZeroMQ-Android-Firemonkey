
unit Android.JeroMQ;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Java.Net,
  Androidapi.JNI.JavaTypes;

type
// ===== Forward declarations =====

  JDataInput = interface;//java.io.DataInput
  JFilterInputStream = interface;//java.io.FilterInputStream
  JDataInputStream = interface;//java.io.DataInputStream
  JDataOutputStream = interface;//java.io.DataOutputStream
  JAtomicInteger = interface;//java.util.concurrent.atomic.AtomicInteger
  JSocketType = interface;//org.zeromq.SocketType
  JUncheckedZMQException = interface;//org.zeromq.UncheckedZMQException
  Jzeromq_Utils = interface;//org.zeromq.Utils
  JZStar = interface;//org.zeromq.ZStar
  JZActor = interface;//org.zeromq.ZActor
  JZActor_Actor = interface;//org.zeromq.ZActor$Actor
  JZActor_Duo = interface;//org.zeromq.ZActor$Duo
  JZActor_SimpleActor = interface;//org.zeromq.ZActor$SimpleActor
  JZAgent = interface;//org.zeromq.ZAgent
  JZAgent_Creator = interface;//org.zeromq.ZAgent$Creator
  JZAgent_SelectorCreator = interface;//org.zeromq.ZAgent$SelectorCreator
  JZAgent_SimpleAgent = interface;//org.zeromq.ZAgent$SimpleAgent
  JZAuth = interface;//org.zeromq.ZAuth
  JZAuth_Auth = interface;//org.zeromq.ZAuth$Auth
  JZAuth_SimpleCurveAuth = interface;//org.zeromq.ZAuth$SimpleCurveAuth
  JZAuth_SimpleNullAuth = interface;//org.zeromq.ZAuth$SimpleNullAuth
  JZAuth_SimplePlainAuth = interface;//org.zeromq.ZAuth$SimplePlainAuth
  JZAuth_ZapReply = interface;//org.zeromq.ZAuth$ZapReply
  JZAuth_ZapRequest = interface;//org.zeromq.ZAuth$ZapRequest
  JZBeacon = interface;//org.zeromq.ZBeacon
  JZBeacon_Builder = interface;//org.zeromq.ZBeacon$Builder
  JZBeacon_Listener = interface;//org.zeromq.ZBeacon$Listener
  JZCert = interface;//org.zeromq.ZCert
  JZCertStore = interface;//org.zeromq.ZCertStore
  JZCertStore_Fingerprinter = interface;//org.zeromq.ZCertStore$Fingerprinter
  JZCertStore_Hasher = interface;//org.zeromq.ZCertStore$Hasher
  JZCertStore_Timestamper = interface;//org.zeromq.ZCertStore$Timestamper
  JZConfig = interface;//org.zeromq.ZConfig
  JZConfig_ReadException = interface;//org.zeromq.ZConfig$ReadException
  JZContext = interface;//org.zeromq.ZContext
  JZFrame = interface;//org.zeromq.ZFrame
  JZLoop = interface;//org.zeromq.ZLoop
  JZLoop_IZLoopHandler = interface;//org.zeromq.ZLoop$IZLoopHandler
  JZMQ = interface;//org.zeromq.ZMQ
  JZMQ_Context = interface;//org.zeromq.ZMQ$Context
  JZMQ_Curve = interface;//org.zeromq.ZMQ$Curve
  JCurve_KeyPair = interface;//org.zeromq.ZMQ$Curve$KeyPair
  JZMQ_Error = interface;//org.zeromq.ZMQ$Error
  JZMQ_Event = interface;//org.zeromq.ZMQ$Event
  JZMQ_PollItem = interface;//org.zeromq.ZMQ$PollItem
  JZMQ_Poller = interface;//org.zeromq.ZMQ$Poller
  JZMQ_Socket = interface;//org.zeromq.ZMQ$Socket
  JSocket_Mechanism = interface;//org.zeromq.ZMQ$Socket$Mechanism
  JZMQException = interface;//org.zeromq.ZMQException
  JZMQQueue = interface;//org.zeromq.ZMQQueue
  JZMonitor = interface;//org.zeromq.ZMonitor
  JZMonitor_Event = interface;//org.zeromq.ZMonitor$Event
  JZMonitor_ZEvent = interface;//org.zeromq.ZMonitor$ZEvent
  JZMsg = interface;//org.zeromq.ZMsg
  JZPoller = interface;//org.zeromq.ZPoller
  JZPoller_ComposeEventsHandler = interface;//org.zeromq.ZPoller$ComposeEventsHandler
  JZPoller_EventsHandler = interface;//org.zeromq.ZPoller$EventsHandler
  JZPoller_ItemCreator = interface;//org.zeromq.ZPoller$ItemCreator
  JZPoller_ItemHolder = interface;//org.zeromq.ZPoller$ItemHolder
  JZPoller_SimpleCreator = interface;//org.zeromq.ZPoller$SimpleCreator
  JZPoller_ZPollItem = interface;//org.zeromq.ZPoller$ZPollItem
  JZProxy = interface;//org.zeromq.ZProxy
  JZProxy_Command = interface;//org.zeromq.ZProxy$Command
  JZProxy_Plug = interface;//org.zeromq.ZProxy$Plug
  JZProxy_Proxy = interface;//org.zeromq.ZProxy$Proxy
  JProxy_SimpleProxy = interface;//org.zeromq.ZProxy$Proxy$SimpleProxy
  JZProxy_Pump = interface;//org.zeromq.ZProxy$Pump
  JZProxy_State = interface;//org.zeromq.ZProxy$State
  JZProxy_ZPump = interface;//org.zeromq.ZProxy$ZPump
  JZPump_Transformer = interface;//org.zeromq.ZProxy$ZPump$Transformer
  JZSocket = interface;//org.zeromq.ZSocket
  JZStar_TimeTaker = interface;//org.zeromq.ZStar$TimeTaker
  JZStar_Entourage = interface;//org.zeromq.ZStar$Entourage
  JZStar_Exit = interface;//org.zeromq.ZStar$Exit
  JZStar_Fortune = interface;//org.zeromq.ZStar$Fortune
  JZStar_Set = interface;//org.zeromq.ZStar$Set
  JZStar_SimpleSet = interface;//org.zeromq.ZStar$SimpleSet
  JZStar_Star = interface;//org.zeromq.ZStar$Star
  JZThread = interface;//org.zeromq.ZThread
  JZThread_IAttachedRunnable = interface;//org.zeromq.ZThread$IAttachedRunnable
  JZThread_IDetachedRunnable = interface;//org.zeromq.ZThread$IDetachedRunnable
  JZTimer = interface;//org.zeromq.ZTimer
  JTimers_Handler = interface;//zmq.util.Timers$Handler
  JTimerHandler = interface;//org.zeromq.timer.TimerHandler
  JZTimer_Handler = interface;//org.zeromq.ZTimer$Handler
  JZTimer_Timer = interface;//org.zeromq.ZTimer$Timer
  JZNeedle = interface;//org.zeromq.proto.ZNeedle
  JZPicture = interface;//org.zeromq.proto.ZPicture
  JZTicker = interface;//org.zeromq.timer.ZTicker
  JZTicket = interface;//org.zeromq.timer.ZTicket
  JZTicket_Ticket = interface;//org.zeromq.timer.ZTicket$Ticket
  Jtimer_ZTimer = interface;//org.zeromq.timer.ZTimer
  Jtimer_ZTimer_Timer = interface;//org.zeromq.timer.ZTimer$Timer
  JZData = interface;//org.zeromq.util.ZData
  JZDigest = interface;//org.zeromq.util.ZDigest
  JZMetadata = interface;//org.zeromq.util.ZMetadata
  JCommand = interface;//zmq.Command
  JCommand_Type = interface;//zmq.Command$Type
  Jzmq_Config = interface;//zmq.Config
  JCtx = interface;//zmq.Ctx
  JCtx_Endpoint = interface;//zmq.Ctx$Endpoint
  JMailbox = interface;//zmq.Mailbox
  JMsg = interface;//zmq.Msg
  JMsg_Builder = interface;//zmq.Msg$Builder
  JOptions = interface;//zmq.Options
  JZObject = interface;//zmq.ZObject
  JOwn = interface;//zmq.Own
  JSocketBase = interface;//zmq.SocketBase
  Jzmq_Utils = interface;//zmq.Utils
  JZError = interface;//zmq.ZError
  JZError_CtxTerminatedException = interface;//zmq.ZError$CtxTerminatedException
  JZError_IOException = interface;//zmq.ZError$IOException
  JZError_InstantiationException = interface;//zmq.ZError$InstantiationException
  Jzmq_ZMQ = interface;//zmq.ZMQ
  Jzmq_ZMQ_Event = interface;//zmq.ZMQ$Event
  JEngineNotImplemented = interface;//zmq.io.EngineNotImplemented
  JIEngine = interface;//zmq.io.IEngine
  JIOObject = interface;//zmq.io.IOObject
  JIOThread = interface;//zmq.io.IOThread
  Jio_Metadata = interface;//zmq.io.Metadata
  JMetadata_ParseListener = interface;//zmq.io.Metadata$ParseListener
  JMsgs = interface;//zmq.io.Msgs
  JSessionBase = interface;//zmq.io.SessionBase
  JStreamEngine = interface;//zmq.io.StreamEngine
  JStreamEngine_ErrorReason = interface;//zmq.io.StreamEngine$ErrorReason
  JDecoderBase = interface;//zmq.io.coder.DecoderBase
  Jcoder_Decoder = interface;//zmq.io.coder.Decoder
  JEncoderBase = interface;//zmq.io.coder.EncoderBase
  Jcoder_Encoder = interface;//zmq.io.coder.Encoder
  JIDecoder = interface;//zmq.io.coder.IDecoder
  JIDecoder_Step = interface;//zmq.io.coder.IDecoder$Step
  JStep_Result = interface;//zmq.io.coder.IDecoder$Step$Result
  JIEncoder = interface;//zmq.io.coder.IEncoder
  JRawDecoder = interface;//zmq.io.coder.raw.RawDecoder
  JRawEncoder = interface;//zmq.io.coder.raw.RawEncoder
  JV1Decoder = interface;//zmq.io.coder.v1.V1Decoder
  JV1Encoder = interface;//zmq.io.coder.v1.V1Encoder
  JV1Protocol = interface;//zmq.io.coder.v1.V1Protocol
  JV2Decoder = interface;//zmq.io.coder.v2.V2Decoder
  JV2Encoder = interface;//zmq.io.coder.v2.V2Encoder
  JV2Protocol = interface;//zmq.io.coder.v2.V2Protocol
  JMechanism = interface;//zmq.io.mechanism.Mechanism
  JMechanism_Status = interface;//zmq.io.mechanism.Mechanism$Status
  JMechanisms = interface;//zmq.io.mechanism.Mechanisms
  JCurve = interface;//zmq.io.mechanism.curve.Curve
  JCurveClientMechanism = interface;//zmq.io.mechanism.curve.CurveClientMechanism
  JCurveServerMechanism = interface;//zmq.io.mechanism.curve.CurveServerMechanism
  JGssapiClientMechanism = interface;//zmq.io.mechanism.gssapi.GssapiClientMechanism
  JGssapiServerMechanism = interface;//zmq.io.mechanism.gssapi.GssapiServerMechanism
  JPlainClientMechanism = interface;//zmq.io.mechanism.plain.PlainClientMechanism
  JPlainServerMechanism = interface;//zmq.io.mechanism.plain.PlainServerMechanism
  Jnet_Address = interface;//zmq.io.net.Address
  JAddress_IZAddress = interface;//zmq.io.net.Address$IZAddress
  JNetProtocol = interface;//zmq.io.net.NetProtocol
  Jnet_ProtocolFamily = interface;//zmq.io.net.ProtocolFamily
  JSelectorProviderChooser = interface;//zmq.io.net.SelectorProviderChooser
  Jnet_StandardProtocolFamily = interface;//zmq.io.net.StandardProtocolFamily
  JIpcAddress = interface;//zmq.io.net.ipc.IpcAddress
  JTcpAddress = interface;//zmq.io.net.tcp.TcpAddress
  JIpcAddress_IpcAddressMask = interface;//zmq.io.net.ipc.IpcAddress$IpcAddressMask
  JTcpConnecter = interface;//zmq.io.net.tcp.TcpConnecter
  JIpcConnecter = interface;//zmq.io.net.ipc.IpcConnecter
  JTcpListener = interface;//zmq.io.net.tcp.TcpListener
  JIpcListener = interface;//zmq.io.net.ipc.IpcListener
  JNormEngine = interface;//zmq.io.net.norm.NormEngine
  JPgmReceiver = interface;//zmq.io.net.pgm.PgmReceiver
  JPgmSender = interface;//zmq.io.net.pgm.PgmSender
  JSocksConnecter = interface;//zmq.io.net.tcp.SocksConnecter
  JTcpAddress_TcpAddressMask = interface;//zmq.io.net.tcp.TcpAddress$TcpAddressMask
  JTcpUtils = interface;//zmq.io.net.tcp.TcpUtils
  JTipcConnecter = interface;//zmq.io.net.tipc.TipcConnecter
  JTipcListener = interface;//zmq.io.net.tipc.TipcListener
  JMsgAllocator = interface;//zmq.msg.MsgAllocator
  JMsgAllocatorDirect = interface;//zmq.msg.MsgAllocatorDirect
  JMsgAllocatorHeap = interface;//zmq.msg.MsgAllocatorHeap
  JMsgAllocatorThreshold = interface;//zmq.msg.MsgAllocatorThreshold
  Jpipe_Pipe = interface;//zmq.pipe.Pipe
  JPipe_IPipeEvents = interface;//zmq.pipe.Pipe$IPipeEvents
  JYPipe = interface;//zmq.pipe.YPipe
  JYPipeBase = interface;//zmq.pipe.YPipeBase
  JYPipeConflate = interface;//zmq.pipe.YPipeConflate
  JIPollEvents = interface;//zmq.poll.IPollEvents
  JPollItem = interface;//zmq.poll.PollItem
  JPoller = interface;//zmq.poll.Poller
  JPoller_Handle = interface;//zmq.poll.Poller$Handle
  JFQ = interface;//zmq.socket.FQ
  JLB = interface;//zmq.socket.LB
  Jsocket_Pair = interface;//zmq.socket.Pair
  JSockets = interface;//zmq.socket.Sockets
  Jsocket_Stream = interface;//zmq.socket.Stream
  JPull = interface;//zmq.socket.pipeline.Pull
  JPush = interface;//zmq.socket.pipeline.Push
  JMtrie_IMtrieHandler = interface;//zmq.socket.pubsub.Mtrie$IMtrieHandler
  JXPub = interface;//zmq.socket.pubsub.XPub
  JPub = interface;//zmq.socket.pubsub.Pub
  JXSub = interface;//zmq.socket.pubsub.XSub
  JSub = interface;//zmq.socket.pubsub.Sub
  JTrie_ITrieHandler = interface;//zmq.socket.pubsub.Trie$ITrieHandler
  JDealer = interface;//zmq.socket.reqrep.Dealer
  JRouter = interface;//zmq.socket.reqrep.Router
  JRep = interface;//zmq.socket.reqrep.Rep
  JReq = interface;//zmq.socket.reqrep.Req
  JReq_ReqSession = interface;//zmq.socket.reqrep.Req$ReqSession
  Jutil_Blob = interface;//zmq.util.Blob
  Jutil_Clock = interface;//zmq.util.Clock
  JDraft = interface;//zmq.util.Draft
  JErrno = interface;//zmq.util.Errno
  JMultiMap = interface;//zmq.util.MultiMap
  Jutil_Objects = interface;//zmq.util.Objects
  JTimers = interface;//zmq.util.Timers
  JTimers_Timer = interface;//zmq.util.Timers$Timer
  Jutil_Utils = interface;//zmq.util.Utils
  JValueReference = interface;//zmq.util.ValueReference
  Jutil_Wire = interface;//zmq.util.Wire
  JZ85 = interface;//zmq.util.Z85
  Jfunction_BiFunction = interface;//zmq.util.function.BiFunction
  Jfunction_Consumer = interface;//zmq.util.function.Consumer
  Jfunction_Function = interface;//zmq.util.function.Function
  Jfunction_Supplier = interface;//zmq.util.function.Supplier

// ===== Interface declarations =====

  JDataInputClass = interface(IJavaClass)
    ['{DE6CE794-6EE2-4768-AA83-2B4831F9E318}']
    {class} function readByte: Byte; cdecl;
    {class} function readChar: Char; cdecl;
    {class} function readDouble: Double; cdecl;
    {class} function readInt: Integer; cdecl;
    {class} function readLine: JString; cdecl;
    {class} function readLong: Int64; cdecl;
    {class} function readUnsignedShort: Integer; cdecl;
    {class} function skipBytes(count: Integer): Integer; cdecl;
  end;

  [JavaSignature('java/io/DataInput')]
  JDataInput = interface(IJavaInstance)
    ['{531D4DB8-9C0C-435C-938F-91007288CE8D}']
    function readBoolean: Boolean; cdecl;
    function readFloat: Single; cdecl;
    procedure readFully(dst: TJavaArray<Byte>); cdecl; overload;
    procedure readFully(dst: TJavaArray<Byte>; offset: Integer; byteCount: Integer); cdecl; overload;
    function readShort: SmallInt; cdecl;
    function readUTF: JString; cdecl;
    function readUnsignedByte: Integer; cdecl;
  end;
  TJDataInput = class(TJavaGenericImport<JDataInputClass, JDataInput>) end;

  JFilterInputStreamClass = interface(JInputStreamClass)
    ['{F86EBD21-681A-43DA-BDF9-A28ACD4A7EE5}']
    {class} function markSupported: Boolean; cdecl;
    {class} function read: Integer; cdecl; overload;
  end;

  [JavaSignature('java/io/FilterInputStream')]
  JFilterInputStream = interface(JInputStream)
    ['{9F9FA98A-C38C-4DDE-9600-073E9DA3BA85}']
    function available: Integer; cdecl;
    procedure close; cdecl;
    procedure mark(readlimit: Integer); cdecl;
    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
    procedure reset; cdecl;
    function skip(byteCount: Int64): Int64; cdecl;
  end;
  TJFilterInputStream = class(TJavaGenericImport<JFilterInputStreamClass, JFilterInputStream>) end;

  JDataInputStreamClass = interface(JFilterInputStreamClass)
    ['{63A3E0C6-D830-4711-8A5B-563F95DEDBD5}']
    {class} function init(in_: JInputStream): JDataInputStream; cdecl;//Deprecated
    {class} function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;//Deprecated
    {class} function readDouble: Double; cdecl;//Deprecated
    {class} function readFloat: Single; cdecl;//Deprecated
    {class} procedure readFully(dst: TJavaArray<Byte>); cdecl; overload;//Deprecated
    {class} function readLong: Int64; cdecl;
    {class} function readShort: SmallInt; cdecl;
    {class} function readUTF: JString; cdecl; overload;
    {class} function readUTF(in_: JDataInput): JString; cdecl; overload;
    {class} function skipBytes(count: Integer): Integer; cdecl;
  end;

  [JavaSignature('java/io/DataInputStream')]
  JDataInputStream = interface(JFilterInputStream)
    ['{76AFD071-40B2-49D6-9C88-FBDE64374D14}']
    function readBoolean: Boolean; cdecl;//Deprecated
    function readByte: Byte; cdecl;//Deprecated
    function readChar: Char; cdecl;//Deprecated
    procedure readFully(dst: TJavaArray<Byte>; offset: Integer; byteCount: Integer); cdecl; overload;
    function readInt: Integer; cdecl;
    function readLine: JString; cdecl;//Deprecated
    function readUnsignedByte: Integer; cdecl;
    function readUnsignedShort: Integer; cdecl;
  end;
  TJDataInputStream = class(TJavaGenericImport<JDataInputStreamClass, JDataInputStream>) end;

  JDataOutputStreamClass = interface(JFilterOutputStreamClass)
    ['{BBF8F504-2C62-424E-80F5-C3806D75B104}']
    {class} function init(out_: JOutputStream): JDataOutputStream; cdecl;//Deprecated
    {class} procedure flush; cdecl;//Deprecated
    {class} function size: Integer; cdecl;//Deprecated
    {class} procedure writeByte(val: Integer); cdecl;//Deprecated
    {class} procedure writeBytes(str: JString); cdecl;//Deprecated
    {class} procedure writeChar(val: Integer); cdecl;//Deprecated
    {class} procedure writeInt(val: Integer); cdecl;
    {class} procedure writeLong(val: Int64); cdecl;
    {class} procedure writeShort(val: Integer); cdecl;
  end;

  [JavaSignature('java/io/DataOutputStream')]
  JDataOutputStream = interface(JFilterOutputStream)
    ['{3267CB91-F587-402B-AE7B-61F726D56A02}']
    procedure write(buffer: TJavaArray<Byte>; offset: Integer; count: Integer); cdecl; overload;//Deprecated
    procedure write(oneByte: Integer); cdecl; overload;//Deprecated
    procedure writeBoolean(val: Boolean); cdecl;//Deprecated
    procedure writeChars(str: JString); cdecl;
    procedure writeDouble(val: Double); cdecl;
    procedure writeFloat(val: Single); cdecl;
    procedure writeUTF(str: JString); cdecl;
  end;
  TJDataOutputStream = class(TJavaGenericImport<JDataOutputStreamClass, JDataOutputStream>) end;

  JAtomicIntegerClass = interface(JNumberClass)
    ['{78B413EA-199D-4F10-96FC-9E8BB0D02FFB}']
    {class} function init(initialValue: Integer): JAtomicInteger; cdecl; overload;//Deprecated
    {class} function init: JAtomicInteger; cdecl; overload;//Deprecated
    {class} function doubleValue: Double; cdecl;
    {class} function floatValue: Single; cdecl;
    {class} function &get: Integer; cdecl;
    {class} function getAndSet(newValue: Integer): Integer; cdecl;//Deprecated
    {class} function incrementAndGet: Integer; cdecl;//Deprecated
    {class} function intValue: Integer; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} function weakCompareAndSet(expect: Integer; update: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('java/util/concurrent/atomic/AtomicInteger')]
  JAtomicInteger = interface(JNumber)
    ['{183BF9D0-5B48-4323-853B-7594791BB7EC}']
    function addAndGet(delta: Integer): Integer; cdecl;
    function compareAndSet(expect: Integer; update: Integer): Boolean; cdecl;
    function decrementAndGet: Integer; cdecl;
    function getAndAdd(delta: Integer): Integer; cdecl;//Deprecated
    function getAndDecrement: Integer; cdecl;//Deprecated
    function getAndIncrement: Integer; cdecl;//Deprecated
    procedure lazySet(newValue: Integer); cdecl;//Deprecated
    function longValue: Int64; cdecl;//Deprecated
    procedure &set(newValue: Integer); cdecl;//Deprecated
  end;
  TJAtomicInteger = class(TJavaGenericImport<JAtomicIntegerClass, JAtomicInteger>) end;

  JSocketTypeClass = interface(JEnumClass)
    ['{8328CD18-D012-4ABF-80CE-1C27875D0573}']
    {class} function _GetDEALER: JSocketType; cdecl;
    {class} function _GetPAIR: JSocketType; cdecl;
    {class} function _GetPUB: JSocketType; cdecl;
    {class} function _GetPULL: JSocketType; cdecl;
    {class} function _GetPUSH: JSocketType; cdecl;
    {class} function _GetREP: JSocketType; cdecl;
    {class} function _GetREQ: JSocketType; cdecl;
    {class} function _GetROUTER: JSocketType; cdecl;
    {class} function _GetSTREAM: JSocketType; cdecl;
    {class} function _GetSUB: JSocketType; cdecl;
    {class} function _GetXPUB: JSocketType; cdecl;
    {class} function _GetXSUB: JSocketType; cdecl;
    {class} function &type(baseType: Integer): JSocketType; cdecl; overload;//Deprecated
    {class} function valueOf(name: JString): JSocketType; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JSocketType>; cdecl;//Deprecated
    {class} property DEALER: JSocketType read _GetDEALER;
    {class} property PAIR: JSocketType read _GetPAIR;
    {class} property PUB: JSocketType read _GetPUB;
    {class} property PULL: JSocketType read _GetPULL;
    {class} property PUSH: JSocketType read _GetPUSH;
    {class} property REP: JSocketType read _GetREP;
    {class} property REQ: JSocketType read _GetREQ;
    {class} property ROUTER: JSocketType read _GetROUTER;
    {class} property STREAM: JSocketType read _GetSTREAM;
    {class} property SUB: JSocketType read _GetSUB;
    {class} property XPUB: JSocketType read _GetXPUB;
    {class} property XSUB: JSocketType read _GetXSUB;
  end;

  [JavaSignature('org/zeromq/SocketType')]
  JSocketType = interface(JEnum)
    ['{2A7A0D76-9E2F-4107-8DD5-E523BB06E008}']
    function _Gettype: Integer; cdecl;
    function &type: Integer; cdecl; overload;//Deprecated
    property &type: Integer read _Gettype;
  end;
  TJSocketType = class(TJavaGenericImport<JSocketTypeClass, JSocketType>) end;

  JUncheckedZMQExceptionClass = interface(JRuntimeExceptionClass)
    ['{E73EB4D7-E008-4C2C-8DB2-B5E58467A1F7}']
    {class} function init: JUncheckedZMQException; cdecl; overload;//Deprecated
    {class} function init(message: JString): JUncheckedZMQException; cdecl; overload;//Deprecated
    {class} function init(cause: JThrowable): JUncheckedZMQException; cdecl; overload;//Deprecated
    {class} function init(message: JString; cause: JThrowable): JUncheckedZMQException; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/UncheckedZMQException')]
  JUncheckedZMQException = interface(JRuntimeException)
    ['{8C1A0C3F-56B0-4D79-A7A4-16852F887305}']
  end;
  TJUncheckedZMQException = class(TJavaGenericImport<JUncheckedZMQExceptionClass, JUncheckedZMQException>) end;

  Jzeromq_UtilsClass = interface(JObjectClass)
    ['{5F9A7788-19E4-44BD-84CA-3854A280490F}']
    {class} procedure checkArgument(expression: Boolean; errorMessage: JString); cdecl;
    {class} function findOpenPort: Integer; cdecl;
  end;

  [JavaSignature('org/zeromq/Utils')]
  Jzeromq_Utils = interface(JObject)
    ['{C233C73E-BF2E-4AB1-B93A-0ADD8C5F93FB}']
  end;
  TJzeromq_Utils = class(TJavaGenericImport<Jzeromq_UtilsClass, Jzeromq_Utils>) end;

  JZStarClass = interface(JObjectClass)
    ['{42D05902-1E56-464B-BDE4-4C2E8DD70276}']
    {class} procedure close; cdecl;//Deprecated
    {class} procedure party(time: Int64; unit_: JTimeUnit); cdecl;//Deprecated
    {class} function recv: JZMsg; cdecl; overload;//Deprecated
    {class} function recv(timeout: Integer): JZMsg; cdecl; overload;//Deprecated
    {class} function send(message: JZMsg): Boolean; cdecl; overload;//Deprecated
    {class} function send(word: JString): Boolean; cdecl; overload;//Deprecated
    {class} function sign: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZStar')]
  JZStar = interface(JObject)
    ['{105E2E70-E9D2-4B58-829C-1510FEE9DC2D}']
    function agent: JZAgent; cdecl;//Deprecated
    function exit: JZStar_Exit; cdecl;//Deprecated
    function pipe: JZMQ_Socket; cdecl;//Deprecated
    function recv(wait: Boolean): JZMsg; cdecl; overload;//Deprecated
    function send(msg: JZMsg; destroy: Boolean): Boolean; cdecl; overload;//Deprecated
    function send(word: JString; more: Boolean): Boolean; cdecl; overload;//Deprecated
  end;
  TJZStar = class(TJavaGenericImport<JZStarClass, JZStar>) end;

  JZActorClass = interface(JZStarClass)
    ['{4299E796-28B1-429F-A96C-ECD8E629F0BE}']
  end;

  [JavaSignature('org/zeromq/ZActor')]
  JZActor = interface(JZStar)
    ['{179CB4CE-1486-4BE6-A058-8876135383E8}']
  end;
  TJZActor = class(TJavaGenericImport<JZActorClass, JZActor>) end;

  JZActor_ActorClass = interface(IJavaClass)
    ['{3DCC31B1-AEC4-421B-82DA-4AA913178C13}']
    {class} function backstage(pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;//Deprecated
    {class} procedure closed(socket: JZMQ_Socket); cdecl;//Deprecated
    {class} function looped(pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;//Deprecated
    {class} function looping(pipe: JZMQ_Socket; poller: JZPoller): Int64; cdecl;//Deprecated
    {class} function premiere(pipe: JZMQ_Socket): JString; cdecl;//Deprecated
    {class} function stage(socket: JZMQ_Socket; pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZActor$Actor')]
  JZActor_Actor = interface(IJavaInstance)
    ['{ED3DDD9E-5F2E-4FD6-8DEB-8A409270E4CD}']
    function destroyed(ctx: JZContext; pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;//Deprecated
    function finished(pipe: JZMQ_Socket): Boolean; cdecl;//Deprecated
    procedure start(pipe: JZMQ_Socket; sockets: JList; poller: JZPoller); cdecl;
  end;
  TJZActor_Actor = class(TJavaGenericImport<JZActor_ActorClass, JZActor_Actor>) end;

  JZActor_DuoClass = interface(JObjectClass)
    ['{FBFB47AE-31D3-4166-B997-89C53CA951A4}']
    {class} function init(main: JZActor_Actor; shadow: JZActor_Actor): JZActor_Duo; cdecl;//Deprecated
    {class} function finished(pipe: JZMQ_Socket): Boolean; cdecl;
    {class} function looped(pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;
    {class} function looping(pipe: JZMQ_Socket; poller: JZPoller): Int64; cdecl;
    {class} function premiere(pipe: JZMQ_Socket): JString; cdecl;
  end;

  [JavaSignature('org/zeromq/ZActor$Duo')]
  JZActor_Duo = interface(JObject)
    ['{31231D07-98E2-4F02-9CE1-B5A159E5DA34}']
    function backstage(pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;
    procedure closed(socket: JZMQ_Socket); cdecl;
    function destroyed(ctx: JZContext; pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;
    function stage(socket: JZMQ_Socket; pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;//Deprecated
    procedure start(pipe: JZMQ_Socket; sockets: JList; poller: JZPoller); cdecl;//Deprecated
  end;
  TJZActor_Duo = class(TJavaGenericImport<JZActor_DuoClass, JZActor_Duo>) end;

  JZActor_SimpleActorClass = interface(JObjectClass)
    ['{F0EE557E-A500-44D4-8F8F-B012C2DA449A}']
    {class} function init: JZActor_SimpleActor; cdecl;//Deprecated
    {class} function backstage(pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;
    {class} procedure closed(socket: JZMQ_Socket); cdecl;
    {class} function looped(pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;//Deprecated
    {class} function looping(pipe: JZMQ_Socket; poller: JZPoller): Int64; cdecl;//Deprecated
    {class} function premiere(pipe: JZMQ_Socket): JString; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZActor$SimpleActor')]
  JZActor_SimpleActor = interface(JObject)
    ['{7249EDB8-3FBC-4C01-B7B8-77F7C5009653}']
    function destroyed(ctx: JZContext; pipe: JZMQ_Socket; poller: JZPoller): Boolean; cdecl;//Deprecated
    function finished(pipe: JZMQ_Socket): Boolean; cdecl;//Deprecated
    function stage(socket: JZMQ_Socket; pipe: JZMQ_Socket; poller: JZPoller; events: Integer): Boolean; cdecl;//Deprecated
    procedure start(pipe: JZMQ_Socket; sockets: JList; poller: JZPoller); cdecl;//Deprecated
  end;
  TJZActor_SimpleActor = class(TJavaGenericImport<JZActor_SimpleActorClass, JZActor_SimpleActor>) end;

  JZAgentClass = interface(IJavaClass)
    ['{2CA158EA-D28C-4D0A-BCD9-EB29A81ADF84}']
    {class} function pipe: JZMQ_Socket; cdecl;
    {class} function recv: JZMsg; cdecl; overload;
    {class} function recv(timeout: Integer): JZMsg; cdecl; overload;
    {class} function send(word: JString): Boolean; cdecl; overload;//Deprecated
    {class} function send(word: JString; more: Boolean): Boolean; cdecl; overload;//Deprecated
    {class} function sign: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAgent')]
  JZAgent = interface(IJavaInstance)
    ['{3D39727B-A2FC-4CAC-A122-9EF1D889DC55}']
    procedure close; cdecl;
    function recv(wait: Boolean): JZMsg; cdecl; overload;//Deprecated
    function send(message: JZMsg): Boolean; cdecl; overload;//Deprecated
    function send(msg: JZMsg; destroy: Boolean): Boolean; cdecl; overload;//Deprecated
  end;
  TJZAgent = class(TJavaGenericImport<JZAgentClass, JZAgent>) end;

  JZAgent_CreatorClass = interface(JObjectClass)
    ['{F0F4E715-1F40-4978-9A44-F075EB87D14E}']
    {class} function create(pipe: JZMQ_Socket; lock: JString): JZAgent; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAgent$Creator')]
  JZAgent_Creator = interface(JObject)
    ['{4EEDAF91-1252-41D7-8387-D39CBE6F6275}']
  end;
  TJZAgent_Creator = class(TJavaGenericImport<JZAgent_CreatorClass, JZAgent_Creator>) end;

  JZAgent_SelectorCreatorClass = interface(IJavaClass)
    ['{D9AAFFEE-1BDB-42A3-99EE-A897FE19B2EB}']
    {class} function create: JSelector; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAgent$SelectorCreator')]
  JZAgent_SelectorCreator = interface(IJavaInstance)
    ['{9B63B1B6-B791-40C7-B1D4-7F5843576BD7}']
    procedure destroy(selector: JSelector); cdecl;//Deprecated
  end;
  TJZAgent_SelectorCreator = class(TJavaGenericImport<JZAgent_SelectorCreatorClass, JZAgent_SelectorCreator>) end;

  JZAgent_SimpleAgentClass = interface(JObjectClass)
    ['{DDCF6511-274A-46A8-863B-FE40B4C240F4}']
    {class} function init(pipe: JZMQ_Socket; lock: JString): JZAgent_SimpleAgent; cdecl;//Deprecated
    {class} function pipe: JZMQ_Socket; cdecl;
    {class} function recv: JZMsg; cdecl; overload;
    {class} function send(word: JString): Boolean; cdecl; overload;
    {class} function send(word: JString; more: Boolean): Boolean; cdecl; overload;
    {class} function send(msg: JZMsg; destroy: Boolean): Boolean; cdecl; overload;
  end;

  [JavaSignature('org/zeromq/ZAgent$SimpleAgent')]
  JZAgent_SimpleAgent = interface(JObject)
    ['{C5A5762D-8A63-4C79-AF34-47F99973A62F}']
    procedure close; cdecl;
    function recv(timeout: Integer): JZMsg; cdecl; overload;
    function recv(wait: Boolean): JZMsg; cdecl; overload;
    function send(message: JZMsg): Boolean; cdecl; overload;
    function sign: Boolean; cdecl;
  end;
  TJZAgent_SimpleAgent = class(TJavaGenericImport<JZAgent_SimpleAgentClass, JZAgent_SimpleAgent>) end;

  JZAuthClass = interface(JObjectClass)
    ['{5BA62C3E-2D09-4036-86CE-DA9B1C0F1029}']
    {class} function _GetCURVE_ALLOW_ANY: JString; cdecl;
    {class} function init(ctx: JZContext): JZAuth; cdecl; overload;//Deprecated
    {class} function init(ctx: JZContext; fingerprinter: JZCertStore_Fingerprinter): JZAuth; cdecl; overload;//Deprecated
    {class} function init(ctx: JZContext; actorName: JString): JZAuth; cdecl; overload;//Deprecated
    {class} function init(ctx: JZContext; actorName: JString; auths: JMap): JZAuth; cdecl; overload;//Deprecated
    {class} function allow(address: JString): JZAuth; cdecl;//Deprecated
    {class} procedure close; cdecl;//Deprecated
    {class} procedure destroy; cdecl;//Deprecated
    {class} function nextReply: JZAuth_ZapReply; cdecl; overload;//Deprecated
    {class} function nextReply(wait: Boolean): JZAuth_ZapReply; cdecl; overload;//Deprecated
    {class} function setVerbose(verbose: Boolean): JZAuth; cdecl;//Deprecated
    {class} function verbose(verbose: Boolean): JZAuth; cdecl;//Deprecated
    {class} property CURVE_ALLOW_ANY: JString read _GetCURVE_ALLOW_ANY;
  end;

  [JavaSignature('org/zeromq/ZAuth')]
  JZAuth = interface(JObject)
    ['{5E927082-28BD-410A-9A93-0E61F78847A0}']
    function configureCurve(location: JString): JZAuth; cdecl;//Deprecated
    function configurePlain(domain: JString; filename: JString): JZAuth; cdecl;//Deprecated
    function deny(address: JString): JZAuth; cdecl;//Deprecated
    function nextReply(timeout: Integer): JZAuth_ZapReply; cdecl; overload;//Deprecated
    function replies(enable: Boolean): JZAuth; cdecl;//Deprecated
  end;
  TJZAuth = class(TJavaGenericImport<JZAuthClass, JZAuth>) end;

  JZAuth_AuthClass = interface(IJavaClass)
    ['{2A0E0794-E7CA-4DA5-83DD-A93825FB5BD3}']
    {class} function configure(msg: JZMsg; verbose: Boolean): Boolean; cdecl;
  end;

  [JavaSignature('org/zeromq/ZAuth$Auth')]
  JZAuth_Auth = interface(IJavaInstance)
    ['{BF58EAAC-A62D-4E3A-839F-A60B3C44E7D0}']
    function authorize(request: JZAuth_ZapRequest; verbose: Boolean): Boolean; cdecl;
  end;
  TJZAuth_Auth = class(TJavaGenericImport<JZAuth_AuthClass, JZAuth_Auth>) end;

  JZAuth_SimpleCurveAuthClass = interface(JObjectClass)
    ['{906C426F-E658-483A-89C4-E626D81320FA}']
    {class} function init: JZAuth_SimpleCurveAuth; cdecl; overload;//Deprecated
    {class} function init(fingerprinter: JZCertStore_Fingerprinter): JZAuth_SimpleCurveAuth; cdecl; overload;//Deprecated
    {class} function configure(configuration: JZMsg; verbose: Boolean): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAuth$SimpleCurveAuth')]
  JZAuth_SimpleCurveAuth = interface(JObject)
    ['{2DDDFE36-7671-411D-896F-1D2EFFD0239A}']
    function authorize(request: JZAuth_ZapRequest; verbose: Boolean): Boolean; cdecl;//Deprecated
  end;
  TJZAuth_SimpleCurveAuth = class(TJavaGenericImport<JZAuth_SimpleCurveAuthClass, JZAuth_SimpleCurveAuth>) end;

  JZAuth_SimpleNullAuthClass = interface(JObjectClass)
    ['{0150FEAF-3275-4606-A12E-8C4DE2A83214}']
    {class} function init: JZAuth_SimpleNullAuth; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAuth$SimpleNullAuth')]
  JZAuth_SimpleNullAuth = interface(JObject)
    ['{C47BFAC7-7371-4E9E-A8C8-D738D05998BF}']
    function authorize(request: JZAuth_ZapRequest; verbose: Boolean): Boolean; cdecl;//Deprecated
    function configure(configuration: JZMsg; verbose: Boolean): Boolean; cdecl;//Deprecated
  end;
  TJZAuth_SimpleNullAuth = class(TJavaGenericImport<JZAuth_SimpleNullAuthClass, JZAuth_SimpleNullAuth>) end;

  JZAuth_SimplePlainAuthClass = interface(JObjectClass)
    ['{466254C9-B297-4E73-A244-5D35658EA52B}']
    {class} function init: JZAuth_SimplePlainAuth; cdecl;//Deprecated
    {class} function authorize(request: JZAuth_ZapRequest; verbose: Boolean): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZAuth$SimplePlainAuth')]
  JZAuth_SimplePlainAuth = interface(JObject)
    ['{64BC3367-37C1-4204-BED5-95757886482B}']
    function configure(msg: JZMsg; verbose: Boolean): Boolean; cdecl;//Deprecated
  end;
  TJZAuth_SimplePlainAuth = class(TJavaGenericImport<JZAuth_SimplePlainAuthClass, JZAuth_SimplePlainAuth>) end;

  JZAuth_ZapReplyClass = interface(JObjectClass)
    ['{9E3CD5BF-A3FA-422F-AA82-7982A662ADE5}']
    {class} function _Getsequence: JString; cdecl;
    {class} function _GetstatusCode: Integer; cdecl;
    {class} function _GetstatusText: JString; cdecl;
    {class} function toString: JString; cdecl;
    {class} property sequence: JString read _Getsequence;
    {class} property statusCode: Integer read _GetstatusCode;
    {class} property statusText: JString read _GetstatusText;
  end;

  [JavaSignature('org/zeromq/ZAuth$ZapReply')]
  JZAuth_ZapReply = interface(JObject)
    ['{E740786D-7A53-42B7-AC24-4F61D66689FA}']
    function _Getaddress: JString; cdecl;
    function _Getidentity: JString; cdecl;
    function _Getmetadata: JZMetadata; cdecl;
    function _GetuserId: JString; cdecl;
    function _Getversion: JString; cdecl;
    property address: JString read _Getaddress;
    property identity: JString read _Getidentity;
    property metadata: JZMetadata read _Getmetadata;
    property userId: JString read _GetuserId;
    property version: JString read _Getversion;
  end;
  TJZAuth_ZapReply = class(TJavaGenericImport<JZAuth_ZapReplyClass, JZAuth_ZapReply>) end;

  JZAuth_ZapRequestClass = interface(JObjectClass)
    ['{52374613-1866-4F4C-AF1E-DC43B5D14CCB}']
    {class} function _GetclientKey: JString; cdecl;
    {class} function _Getdomain: JString; cdecl;
    {class} function _Getidentity: JString; cdecl;
    {class} function _Getprincipal: JString; cdecl;
    {class} function _Getsequence: JString; cdecl;
    {class} function _GetuserId: JString; cdecl;
    {class} procedure _SetuserId(Value: JString); cdecl;
    {class} property clientKey: JString read _GetclientKey;
    {class} property domain: JString read _Getdomain;
    {class} property identity: JString read _Getidentity;
    {class} property principal: JString read _Getprincipal;
    {class} property sequence: JString read _Getsequence;
    {class} property userId: JString read _GetuserId write _SetuserId;
  end;

  [JavaSignature('org/zeromq/ZAuth$ZapRequest')]
  JZAuth_ZapRequest = interface(JObject)
    ['{C51ACEDF-0324-49A9-997E-6649B483DDEB}']
    function _Getaddress: JString; cdecl;
    function _Getmechanism: JString; cdecl;
    function _Getmetadata: JZMetadata; cdecl;
    function _Getpassword: JString; cdecl;
    function _Getusername: JString; cdecl;
    function _Getversion: JString; cdecl;
    property address: JString read _Getaddress;
    property mechanism: JString read _Getmechanism;
    property metadata: JZMetadata read _Getmetadata;
    property password: JString read _Getpassword;
    property username: JString read _Getusername;
    property version: JString read _Getversion;
  end;
  TJZAuth_ZapRequest = class(TJavaGenericImport<JZAuth_ZapRequestClass, JZAuth_ZapRequest>) end;

  JZBeaconClass = interface(JObjectClass)
    ['{BF9392E4-E36F-47F2-A2A4-2B6704522B59}']
    {class} function _GetDEFAULT_BROADCAST_HOST: JString; cdecl;
    {class} function _GetDEFAULT_BROADCAST_INTERVAL: Int64; cdecl;
    {class} function init(port: Integer; beacon: TJavaArray<Byte>): JZBeacon; cdecl; overload;//Deprecated
    {class} function init(host: JString; port: Integer; beacon: TJavaArray<Byte>): JZBeacon; cdecl; overload;//Deprecated
    {class} function init(host: JString; port: Integer; beacon: TJavaArray<Byte>; ignoreLocalAddress: Boolean): JZBeacon; cdecl; overload;//Deprecated
    {class} function init(host: JString; port: Integer; beacon: TJavaArray<Byte>; ignoreLocalAddress: Boolean; blocking: Boolean): JZBeacon; cdecl; overload;//Deprecated
    {class} function init(broadcastAddress: JString; serverAddress: TJavaArray<Byte>; port: Integer; beacon: TJavaArray<Byte>; broadcastInterval: Int64; ignoreLocalAddress: Boolean; blocking: Boolean): JZBeacon; cdecl; overload;//Deprecated
    {class} function getBroadcastInterval: Int64; cdecl;//Deprecated
    {class} function getListener: JZBeacon_Listener; cdecl;//Deprecated
    {class} function getPrefix: TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure setPrefix(prefix: TJavaArray<Byte>); cdecl;//Deprecated
    {class} procedure setUncaughtExceptionHandlers(clientHandler: JThread_UncaughtExceptionHandler; serverHandler: JThread_UncaughtExceptionHandler); cdecl;//Deprecated
    {class} procedure start; cdecl;//Deprecated
    {class} property DEFAULT_BROADCAST_HOST: JString read _GetDEFAULT_BROADCAST_HOST;
    {class} property DEFAULT_BROADCAST_INTERVAL: Int64 read _GetDEFAULT_BROADCAST_INTERVAL;
  end;

  [JavaSignature('org/zeromq/ZBeacon')]
  JZBeacon = interface(JObject)
    ['{FAAE2CAC-2A4F-4E4B-BBF5-5C329D0E77BC}']
    function getBeacon: TJavaArray<Byte>; cdecl;//Deprecated
    procedure setBeacon(beacon: TJavaArray<Byte>); cdecl;//Deprecated
    procedure setBroadcastInterval(broadcastInterval: Int64); cdecl;//Deprecated
    procedure setListener(listener: JZBeacon_Listener); cdecl;//Deprecated
    procedure startClient; cdecl;//Deprecated
    procedure startServer; cdecl;//Deprecated
    procedure stop; cdecl;//Deprecated
  end;
  TJZBeacon = class(TJavaGenericImport<JZBeaconClass, JZBeacon>) end;

  JZBeacon_BuilderClass = interface(JObjectClass)
    ['{00E6EB58-CA44-46D6-801D-4491EE4EC236}']
    {class} function init: JZBeacon_Builder; cdecl;//Deprecated
    {class} function beacon(beacon: TJavaArray<Byte>): JZBeacon_Builder; cdecl;//Deprecated
    {class} function client(host: JString): JZBeacon_Builder; cdecl;//Deprecated
    {class} function ignoreLocalAddress(ignoreLocalAddress: Boolean): JZBeacon_Builder; cdecl;//Deprecated
    {class} function port(port: Integer): JZBeacon_Builder; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZBeacon$Builder')]
  JZBeacon_Builder = interface(JObject)
    ['{E4C13BC9-810A-4114-9D4B-3BE22DE5C9E5}']
    function blocking(blocking: Boolean): JZBeacon_Builder; cdecl;//Deprecated
    function broadcastInterval(broadcastInterval: Int64): JZBeacon_Builder; cdecl;//Deprecated
    function build: JZBeacon; cdecl;//Deprecated
    function server(addr: TJavaArray<Byte>): JZBeacon_Builder; cdecl;//Deprecated
  end;
  TJZBeacon_Builder = class(TJavaGenericImport<JZBeacon_BuilderClass, JZBeacon_Builder>) end;

  JZBeacon_ListenerClass = interface(IJavaClass)
    ['{73430435-C33D-4764-B777-B989307E865D}']
    {class} procedure onBeacon(sender: JInetAddress; beacon: TJavaArray<Byte>); cdecl;
  end;

  [JavaSignature('org/zeromq/ZBeacon$Listener')]
  JZBeacon_Listener = interface(IJavaInstance)
    ['{720ABD7D-22E1-4231-8BDD-FC3AC09A08F2}']
  end;
  TJZBeacon_Listener = class(TJavaGenericImport<JZBeacon_ListenerClass, JZBeacon_Listener>) end;

  JZCertClass = interface(JObjectClass)
    ['{A80D67D3-A606-4AFE-83B3-9B250F833066}']
    {class} function init: JZCert; cdecl; overload;//Deprecated
    {class} function init(publicKey: JString): JZCert; cdecl; overload;//Deprecated
    {class} function init(keypair: JCurve_KeyPair): JZCert; cdecl; overload;//Deprecated
    {class} function init(publicKey: TJavaArray<Byte>; secretKey: TJavaArray<Byte>): JZCert; cdecl; overload;//Deprecated
    {class} function init(publicKey: JString; secretKey: JString): JZCert; cdecl; overload;//Deprecated
    {class} function getMetadata: JZMetadata; cdecl;
    {class} function getPublicKey: TJavaArray<Byte>; cdecl;
    {class} function getPublicKeyAsZ85: JString; cdecl;
    {class} procedure savePublic(writer: JWriter); cdecl; overload;
    {class} function saveSecret(filename: JString): JFile; cdecl; overload;
    {class} procedure saveSecret(writer: JWriter); cdecl; overload;
  end;

  [JavaSignature('org/zeromq/ZCert')]
  JZCert = interface(JObject)
    ['{3C369A61-F955-458E-ABB1-F8505F2D6E23}']
    procedure apply(socket: JZMQ_Socket); cdecl;
    function getMeta(key: JString): JString; cdecl;
    function getSecretKey: TJavaArray<Byte>; cdecl;
    function getSecretKeyAsZ85: JString; cdecl;
    function savePublic(filename: JString): JFile; cdecl; overload;
    procedure setMeta(key: JString; value: JString); cdecl;
    procedure unsetMeta(key: JString); cdecl;
  end;
  TJZCert = class(TJavaGenericImport<JZCertClass, JZCert>) end;

  JZCertStoreClass = interface(JObjectClass)
    ['{9EB87D1D-571D-41A0-B5B3-0C3C7922005B}']
    {class} function init(location: JString): JZCertStore; cdecl; overload;//Deprecated
    {class} function init(location: JString; fingerprinter: JZCertStore_Fingerprinter): JZCertStore; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZCertStore')]
  JZCertStore = interface(JObject)
    ['{D8C4C6F7-D82C-4580-B1A6-F85ECF01AF35}']
    function containsPublicKey(publicKey: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function containsPublicKey(publicKey: JString): Boolean; cdecl; overload;//Deprecated
    function getMetadata(publicKey: JString): JZMetadata; cdecl;//Deprecated
  end;
  TJZCertStore = class(TJavaGenericImport<JZCertStoreClass, JZCertStore>) end;

  JZCertStore_FingerprinterClass = interface(IJavaClass)
    ['{7A2EB3DB-EBC5-414B-B934-C09482B5DF1B}']
    {class} function print(path: JFile): TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('org/zeromq/ZCertStore$Fingerprinter')]
  JZCertStore_Fingerprinter = interface(IJavaInstance)
    ['{F5D4574B-FC10-4C14-851D-D3BC7ABC1D98}']
  end;
  TJZCertStore_Fingerprinter = class(TJavaGenericImport<JZCertStore_FingerprinterClass, JZCertStore_Fingerprinter>) end;

  JZCertStore_HasherClass = interface(JObjectClass)
    ['{2D1C41C4-055E-4EBA-9CE2-6B2E186E8DEF}']
    {class} function init: JZCertStore_Hasher; cdecl;//Deprecated
    {class} function print(path: JFile): TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('org/zeromq/ZCertStore$Hasher')]
  JZCertStore_Hasher = interface(JObject)
    ['{3474EA4F-EC14-4A7D-AD41-CBDE14AE95B5}']
  end;
  TJZCertStore_Hasher = class(TJavaGenericImport<JZCertStore_HasherClass, JZCertStore_Hasher>) end;

  JZCertStore_TimestamperClass = interface(JObjectClass)
    ['{AA244160-D30C-41AB-9F39-EC2334C10680}']
    {class} function init: JZCertStore_Timestamper; cdecl;//Deprecated
    {class} function print(path: JFile): TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('org/zeromq/ZCertStore$Timestamper')]
  JZCertStore_Timestamper = interface(JObject)
    ['{ADC925E6-9D24-4C06-AEAA-A03E8FF9943D}']
  end;
  TJZCertStore_Timestamper = class(TJavaGenericImport<JZCertStore_TimestamperClass, JZCertStore_Timestamper>) end;

  JZConfigClass = interface(JObjectClass)
    ['{5A2CECA4-C010-4008-997E-0C8D8E9361C5}']
    {class} function init(name: JString; parent: JZConfig): JZConfig; cdecl;//Deprecated
    {class} procedure addComment(comment: JString); cdecl;//Deprecated
    {class} function getChild(name: JString): JZConfig; cdecl;//Deprecated
    {class} function getValues: JMap; cdecl;//Deprecated
    {class} function load(filename: JString): JZConfig; cdecl;//Deprecated
    {class} function pathExists(path: JString): Boolean; cdecl;//Deprecated
    {class} procedure save(writer: JWriter); cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZConfig')]
  JZConfig = interface(JObject)
    ['{040CC452-80D3-43BE-AA7B-B80F552344B7}']
    function getName: JString; cdecl;//Deprecated
    function getValue(path: JString): JString; cdecl; overload;//Deprecated
    function getValue(path: JString; defaultValue: JString): JString; cdecl; overload;//Deprecated
    function putValue(path: JString; value: JString): JZConfig; cdecl;//Deprecated
    procedure putValues(src: JZConfig); cdecl;//Deprecated
    function save(filename: JString): JFile; cdecl; overload;//Deprecated
  end;
  TJZConfig = class(TJavaGenericImport<JZConfigClass, JZConfig>) end;

  JZConfig_ReadExceptionClass = interface(JRuntimeExceptionClass)
    ['{B8115113-6028-4AE3-A14A-852C4EAD6530}']
    {class} function init(message: JString; currentLine: JString; currentLineNumber: JAtomicInteger): JZConfig_ReadException; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZConfig$ReadException')]
  JZConfig_ReadException = interface(JRuntimeException)
    ['{360F2BB8-0B63-4222-B924-B85E1B9F3AE3}']
    function _GetcurrentLine: JString; cdecl;
    function _GetcurrentLineNumber: Integer; cdecl;
    property currentLine: JString read _GetcurrentLine;
    property currentLineNumber: Integer read _GetcurrentLineNumber;
  end;
  TJZConfig_ReadException = class(TJavaGenericImport<JZConfig_ReadExceptionClass, JZConfig_ReadException>) end;

  JZContextClass = interface(JObjectClass)
    ['{2964E499-7B88-4901-8DD0-15AB95348104}']
    {class} function init: JZContext; cdecl; overload;//Deprecated
    {class} function init(ioThreads: Integer): JZContext; cdecl; overload;//Deprecated
    {class} procedure close; cdecl;
    {class} procedure closeSelector(selector: JSelector); cdecl;//Deprecated
    {class} function createPoller(size: Integer): JZMQ_Poller; cdecl;
    {class} procedure destroy; cdecl;//Deprecated
    {class} procedure destroySocket(s: JZMQ_Socket); cdecl;//Deprecated
    {class} function getLinger: Integer; cdecl;//Deprecated
    {class} function getSockets: JList; cdecl;//Deprecated
    {class} function isClosed: Boolean; cdecl;//Deprecated
    {class} procedure setLinger(linger: Integer); cdecl;//Deprecated
    {class} procedure setMain(main: Boolean); cdecl;//Deprecated
    {class} procedure setRcvHWM(rcvhwm: Integer); cdecl;//Deprecated
    {class} function shadow(ctx: JZContext): JZContext; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZContext')]
  JZContext = interface(JObject)
    ['{1AD6AD4E-E814-47FC-8B96-B4E01CEEE338}']
    function createSelector: JSelector; cdecl;//Deprecated
    function createSocket(type_: JSocketType): JZMQ_Socket; cdecl; overload;
    function createSocket(type_: Integer): JZMQ_Socket; cdecl; overload;//Deprecated
    function getContext: JZMQ_Context; cdecl;//Deprecated
    function getIoThreads: Integer; cdecl;//Deprecated
    function isMain: Boolean; cdecl;//Deprecated
    procedure setContext(ctx: JZMQ_Context); cdecl;//Deprecated
    procedure setIoThreads(ioThreads: Integer); cdecl;//Deprecated
    procedure setSndHWM(sndhwm: Integer); cdecl;//Deprecated
  end;
  TJZContext = class(TJavaGenericImport<JZContextClass, JZContext>) end;

  JZFrameClass = interface(JObjectClass)
    ['{22C14A3A-1452-4C9A-8DC7-2F3F0517B081}']
    {class} function _GetDONTWAIT: Integer; cdecl;
    {class} function _GetMORE: Integer; cdecl;
    {class} function _GetREUSE: Integer; cdecl;
    {class} function init(data: TJavaArray<Byte>): JZFrame; cdecl; overload;//Deprecated
    {class} function init(data: JString): JZFrame; cdecl; overload;//Deprecated
    {class} function duplicate: JZFrame; cdecl;
    {class} function equals(o: JObject): Boolean; cdecl;
    {class} function getData: TJavaArray<Byte>; cdecl;
    {class} function hasSameData(other: JZFrame): Boolean; cdecl;
    {class} function hashCode: Integer; cdecl;
    {class} procedure print(prefix: JString); cdecl;//Deprecated
    {class} function recvFrame(socket: JZMQ_Socket): JZFrame; cdecl; overload;
    {class} function recvFrame(socket: JZMQ_Socket; flags: Integer): JZFrame; cdecl; overload;//Deprecated
    {class} function sendAndDestroy(socket: JZMQ_Socket): Boolean; cdecl; overload;
    {class} function sendAndKeep(socket: JZMQ_Socket; flags: Integer): Boolean; cdecl; overload;
    {class} function sendAndKeep(socket: JZMQ_Socket): Boolean; cdecl; overload;
    {class} property DONTWAIT: Integer read _GetDONTWAIT;
    {class} property MORE: Integer read _GetMORE;
    {class} property REUSE: Integer read _GetREUSE;
  end;

  [JavaSignature('org/zeromq/ZFrame')]
  JZFrame = interface(JObject)
    ['{4DC27A29-069F-4672-BB77-349348B83DFB}']
    procedure destroy; cdecl;
    function getString(charset: JCharset): JString; cdecl;
    function hasData: Boolean; cdecl;
    function hasMore: Boolean; cdecl;
    procedure reset(data: JString); cdecl; overload;//Deprecated
    procedure reset(data: TJavaArray<Byte>); cdecl; overload;//Deprecated
    function send(socket: JZMQ_Socket; flags: Integer): Boolean; cdecl;//Deprecated
    function sendAndDestroy(socket: JZMQ_Socket; flags: Integer): Boolean; cdecl; overload;
    function size: Integer; cdecl;
    function streq(str: JString): Boolean; cdecl;
    function strhex: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJZFrame = class(TJavaGenericImport<JZFrameClass, JZFrame>) end;

  JZLoopClass = interface(JObjectClass)
    ['{CB237981-02CA-43D6-AF8C-E925973E8EB3}']
    {class} function init(context: JZMQ_Context): JZLoop; cdecl; overload;//Deprecated
    {class} function init(ctx: JZContext): JZLoop; cdecl; overload;//Deprecated
    {class} function addPoller(pollItem: JZMQ_PollItem; handler: JZLoop_IZLoopHandler; arg: JObject): Integer; cdecl;//Deprecated
    {class} function removeTimer(arg: JObject): Integer; cdecl;//Deprecated
    {class} procedure verbose(verbose: Boolean); cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZLoop')]
  JZLoop = interface(JObject)
    ['{F93D3A64-43A8-48FC-9025-02C987190139}']
    function addTimer(delay: Integer; times: Integer; handler: JZLoop_IZLoopHandler; arg: JObject): Integer; cdecl;//Deprecated
    procedure destroy; cdecl;//Deprecated
    procedure removePoller(pollItem: JZMQ_PollItem); cdecl;//Deprecated
    function start: Integer; cdecl;//Deprecated
  end;
  TJZLoop = class(TJavaGenericImport<JZLoopClass, JZLoop>) end;

  JZLoop_IZLoopHandlerClass = interface(IJavaClass)
    ['{94261768-8227-4D3D-A824-F10B9E4007F3}']
  end;

  [JavaSignature('org/zeromq/ZLoop$IZLoopHandler')]
  JZLoop_IZLoopHandler = interface(IJavaInstance)
    ['{CEAEB3C1-CA16-4CB5-91B9-7D8FD76E78EC}']
    function handle(loop: JZLoop; item: JZMQ_PollItem; arg: JObject): Integer; cdecl;//Deprecated
  end;
  TJZLoop_IZLoopHandler = class(TJavaGenericImport<JZLoop_IZLoopHandlerClass, JZLoop_IZLoopHandler>) end;

  JZMQClass = interface(JObjectClass)
    ['{AEF63554-D428-4062-B4F7-D5454B16251C}']
    {class} function _GetCHARSET: JCharset; cdecl;
    {class} function _GetDEALER: Integer; cdecl;
    {class} function _GetDONTWAIT: Integer; cdecl;
    {class} function _GetDOWNSTREAM: Integer; cdecl;
    {class} function _GetEVENT_ACCEPTED: Integer; cdecl;
    {class} function _GetEVENT_ACCEPT_FAILED: Integer; cdecl;
    {class} function _GetEVENT_ALL: Integer; cdecl;
    {class} function _GetEVENT_BIND_FAILED: Integer; cdecl;
    {class} function _GetEVENT_CLOSED: Integer; cdecl;
    {class} function _GetEVENT_CLOSE_FAILED: Integer; cdecl;
    {class} function _GetEVENT_CONNECTED: Integer; cdecl;
    {class} function _GetEVENT_CONNECT_DELAYED: Integer; cdecl;
    {class} function _GetEVENT_CONNECT_RETRIED: Integer; cdecl;
    {class} function _GetEVENT_DELAYED: Integer; cdecl;
    {class} function _GetEVENT_DISCONNECTED: Integer; cdecl;
    {class} function _GetEVENT_HANDSHAKE_PROTOCOL: Integer; cdecl;
    {class} function _GetEVENT_LISTENING: Integer; cdecl;
    {class} function _GetEVENT_MONITOR_STOPPED: Integer; cdecl;
    {class} function _GetEVENT_RETRIED: Integer; cdecl;
    {class} function _GetFORWARDER: Integer; cdecl;
    {class} function _GetMESSAGE_SEPARATOR: TJavaArray<Byte>; cdecl;
    {class} function _GetNOBLOCK: Integer; cdecl;
    {class} function _GetPAIR: Integer; cdecl;
    {class} function _GetPROXY_PAUSE: TJavaArray<Byte>; cdecl;
    {class} function _GetPROXY_RESUME: TJavaArray<Byte>; cdecl;
    {class} function _GetPROXY_TERMINATE: TJavaArray<Byte>; cdecl;
    {class} function _GetPUB: Integer; cdecl;
    {class} function _GetPULL: Integer; cdecl;
    {class} function _GetPUSH: Integer; cdecl;
    {class} function _GetQUEUE: Integer; cdecl;
    {class} function _GetREP: Integer; cdecl;
    {class} function _GetREQ: Integer; cdecl;
    {class} function _GetROUTER: Integer; cdecl;
    {class} function _GetSNDMORE: Integer; cdecl;
    {class} function _GetSTREAM: Integer; cdecl;
    {class} function _GetSTREAMER: Integer; cdecl;
    {class} function _GetSUB: Integer; cdecl;
    {class} function _GetSUBSCRIPTION_ALL: TJavaArray<Byte>; cdecl;
    {class} function _GetUPSTREAM: Integer; cdecl;
    {class} function _GetXPUB: Integer; cdecl;
    {class} function _GetXREP: Integer; cdecl;
    {class} function _GetXREQ: Integer; cdecl;
    {class} function _GetXSUB: Integer; cdecl;
    {class} function context(ioThreads: Integer): JZMQ_Context; cdecl;//Deprecated
    {class} function device(type_: Integer; frontend: JZMQ_Socket; backend: JZMQ_Socket): Boolean; cdecl;//Deprecated
    {class} function getFullVersion: Integer; cdecl;//Deprecated
    {class} function getMajorVersion: Integer; cdecl;//Deprecated
    {class} function getMinorVersion: Integer; cdecl;//Deprecated
    {class} function getPatchVersion: Integer; cdecl;//Deprecated
    {class} function getVersionString: JString; cdecl;//Deprecated
    {class} function makeVersion(major: Integer; minor: Integer; patch: Integer): Integer; cdecl;
    {class} procedure msleep(millis: Int64); cdecl;//Deprecated
    {class} function poll(selector: JSelector; items: TJavaObjectArray<JZMQ_PollItem>; timeout: Int64): Integer; cdecl; overload;
    {class} function poll(selector: JSelector; items: TJavaObjectArray<JZMQ_PollItem>; count: Integer; timeout: Int64): Integer; cdecl; overload;
    {class} function proxy(frontend: JZMQ_Socket; backend: JZMQ_Socket; capture: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    {class} function proxy(frontend: JZMQ_Socket; backend: JZMQ_Socket; capture: JZMQ_Socket; control: JZMQ_Socket): Boolean; cdecl; overload;
    {class} procedure sleep(seconds: Int64); cdecl; overload;
    {class} procedure sleep(amount: Int64; unit_: JTimeUnit); cdecl; overload;
    {class} property CHARSET: JCharset read _GetCHARSET;
    {class} property DEALER: Integer read _GetDEALER;
    {class} property DONTWAIT: Integer read _GetDONTWAIT;
    {class} property DOWNSTREAM: Integer read _GetDOWNSTREAM;
    {class} property EVENT_ACCEPTED: Integer read _GetEVENT_ACCEPTED;
    {class} property EVENT_ACCEPT_FAILED: Integer read _GetEVENT_ACCEPT_FAILED;
    {class} property EVENT_ALL: Integer read _GetEVENT_ALL;
    {class} property EVENT_BIND_FAILED: Integer read _GetEVENT_BIND_FAILED;
    {class} property EVENT_CLOSED: Integer read _GetEVENT_CLOSED;
    {class} property EVENT_CLOSE_FAILED: Integer read _GetEVENT_CLOSE_FAILED;
    {class} property EVENT_CONNECTED: Integer read _GetEVENT_CONNECTED;
    {class} property EVENT_CONNECT_DELAYED: Integer read _GetEVENT_CONNECT_DELAYED;
    {class} property EVENT_CONNECT_RETRIED: Integer read _GetEVENT_CONNECT_RETRIED;
    {class} property EVENT_DELAYED: Integer read _GetEVENT_DELAYED;
    {class} property EVENT_DISCONNECTED: Integer read _GetEVENT_DISCONNECTED;
    {class} property EVENT_HANDSHAKE_PROTOCOL: Integer read _GetEVENT_HANDSHAKE_PROTOCOL;
    {class} property EVENT_LISTENING: Integer read _GetEVENT_LISTENING;
    {class} property EVENT_MONITOR_STOPPED: Integer read _GetEVENT_MONITOR_STOPPED;
    {class} property EVENT_RETRIED: Integer read _GetEVENT_RETRIED;
    {class} property FORWARDER: Integer read _GetFORWARDER;
    {class} property MESSAGE_SEPARATOR: TJavaArray<Byte> read _GetMESSAGE_SEPARATOR;
    {class} property NOBLOCK: Integer read _GetNOBLOCK;
    {class} property PAIR: Integer read _GetPAIR;
    {class} property PROXY_PAUSE: TJavaArray<Byte> read _GetPROXY_PAUSE;
    {class} property PROXY_RESUME: TJavaArray<Byte> read _GetPROXY_RESUME;
    {class} property PROXY_TERMINATE: TJavaArray<Byte> read _GetPROXY_TERMINATE;
    {class} property PUB: Integer read _GetPUB;
    {class} property PULL: Integer read _GetPULL;
    {class} property PUSH: Integer read _GetPUSH;
    {class} property QUEUE: Integer read _GetQUEUE;
    {class} property REP: Integer read _GetREP;
    {class} property REQ: Integer read _GetREQ;
    {class} property ROUTER: Integer read _GetROUTER;
    {class} property SNDMORE: Integer read _GetSNDMORE;
    {class} property STREAM: Integer read _GetSTREAM;
    {class} property STREAMER: Integer read _GetSTREAMER;
    {class} property SUB: Integer read _GetSUB;
    {class} property SUBSCRIPTION_ALL: TJavaArray<Byte> read _GetSUBSCRIPTION_ALL;
    {class} property UPSTREAM: Integer read _GetUPSTREAM;
    {class} property XPUB: Integer read _GetXPUB;
    {class} property XREP: Integer read _GetXREP;
    {class} property XREQ: Integer read _GetXREQ;
    {class} property XSUB: Integer read _GetXSUB;
  end;

  [JavaSignature('org/zeromq/ZMQ')]
  JZMQ = interface(JObject)
    ['{588DA08C-A487-48A2-A6EF-C9A0A89B4535}']
  end;
  TJZMQ = class(TJavaGenericImport<JZMQClass, JZMQ>) end;

  JZMQ_ContextClass = interface(JObjectClass)
    ['{C2765A21-0719-49DE-A8E0-06FE87ADD7F7}']
    {class} function close(selector: JSelector): Boolean; cdecl; overload;
    {class} function getIPv6: Boolean; cdecl;//Deprecated
    {class} function getMaxSockets: Integer; cdecl;//Deprecated
    {class} function isBlocky: Boolean; cdecl;//Deprecated
    {class} function isTerminated: Boolean; cdecl;//Deprecated
    {class} function poller: JZMQ_Poller; cdecl; overload;//Deprecated
    {class} function poller(size: Integer): JZMQ_Poller; cdecl; overload;//Deprecated
    {class} function setIPv6(ipv6: Boolean): Boolean; cdecl;//Deprecated
    {class} function setMaxSockets(maxSockets: Integer): Boolean; cdecl;//Deprecated
    {class} function socket(type_: JSocketType): JZMQ_Socket; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZMQ$Context')]
  JZMQ_Context = interface(JObject)
    ['{0385F0F6-7EEB-4F5C-9652-32CE81E15A35}']
    procedure close; cdecl; overload;
    function getBlocky: Boolean; cdecl;//Deprecated
    function getIOThreads: Integer; cdecl;
    function isClosed: Boolean; cdecl;//Deprecated
    function isIPv6: Boolean; cdecl;//Deprecated
    function selector: JSelector; cdecl;//Deprecated
    function setBlocky(block: Boolean): Boolean; cdecl;//Deprecated
    function setIOThreads(ioThreads: Integer): Boolean; cdecl;//Deprecated
    function socket(type_: Integer): JZMQ_Socket; cdecl; overload;//Deprecated
    procedure term; cdecl;//Deprecated
  end;
  TJZMQ_Context = class(TJavaGenericImport<JZMQ_ContextClass, JZMQ_Context>) end;

  JZMQ_CurveClass = interface(JObjectClass)
    ['{2876462D-D3E5-4C55-ADCF-86FFC3EA0BD9}']
    {class} function _GetKEY_SIZE: Integer; cdecl;
    {class} function _GetKEY_SIZE_Z85: Integer; cdecl;
    {class} function init: JZMQ_Curve; cdecl;//Deprecated
    {class} function generateKeyPair: JCurve_KeyPair; cdecl;
    {class} function z85Decode(key: JString): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function z85Encode(key: TJavaArray<Byte>): JString; cdecl;//Deprecated
    {class} property KEY_SIZE: Integer read _GetKEY_SIZE;
    {class} property KEY_SIZE_Z85: Integer read _GetKEY_SIZE_Z85;
  end;

  [JavaSignature('org/zeromq/ZMQ$Curve')]
  JZMQ_Curve = interface(JObject)
    ['{F7C14E1D-641D-4A3B-9B73-37A24D0CB794}']
  end;
  TJZMQ_Curve = class(TJavaGenericImport<JZMQ_CurveClass, JZMQ_Curve>) end;

  JCurve_KeyPairClass = interface(JObjectClass)
    ['{D6EAC843-9F01-45A9-A115-02695BE955FB}']
    {class} function _GetsecretKey: JString; cdecl;
    {class} function init(publicKey: JString; secretKey: JString): JCurve_KeyPair; cdecl;//Deprecated
    {class} property secretKey: JString read _GetsecretKey;
  end;

  [JavaSignature('org/zeromq/ZMQ$Curve$KeyPair')]
  JCurve_KeyPair = interface(JObject)
    ['{066D3816-BCD4-4C84-92CB-9517B0BB883C}']
    function _GetpublicKey: JString; cdecl;
    property publicKey: JString read _GetpublicKey;
  end;
  TJCurve_KeyPair = class(TJavaGenericImport<JCurve_KeyPairClass, JCurve_KeyPair>) end;

  JZMQ_ErrorClass = interface(JEnumClass)
    ['{70CC3A77-8EA9-4CEB-A3A8-A19F2FCC3D8E}']
    {class} function _GetEACCESS: JZMQ_Error; cdecl;
    {class} function _GetEADDRINUSE: JZMQ_Error; cdecl;
    {class} function _GetEADDRNOTAVAIL: JZMQ_Error; cdecl;
    {class} function _GetEAFNOSUPPORT: JZMQ_Error; cdecl;
    {class} function _GetEAGAIN: JZMQ_Error; cdecl;
    {class} function _GetECONNABORTED: JZMQ_Error; cdecl;
    {class} function _GetECONNREFUSED: JZMQ_Error; cdecl;
    {class} function _GetECONNRESET: JZMQ_Error; cdecl;
    {class} function _GetEFAULT: JZMQ_Error; cdecl;
    {class} function _GetEFSM: JZMQ_Error; cdecl;
    {class} function _GetEHOSTUNREACH: JZMQ_Error; cdecl;
    {class} function _GetEINPROGRESS: JZMQ_Error; cdecl;
    {class} function _GetEINTR: JZMQ_Error; cdecl;
    {class} function _GetEINVAL: JZMQ_Error; cdecl;
    {class} function _GetEIOEXC: JZMQ_Error; cdecl;
    {class} function _GetEISCONN: JZMQ_Error; cdecl;
    {class} function _GetEMFILE: JZMQ_Error; cdecl;
    {class} function _GetEMSGSIZE: JZMQ_Error; cdecl;
    {class} function _GetEMTHREAD: JZMQ_Error; cdecl;
    {class} function _GetENETDOWN: JZMQ_Error; cdecl;
    {class} function _GetENETRESET: JZMQ_Error; cdecl;
    {class} function _GetENETUNREACH: JZMQ_Error; cdecl;
    {class} function _GetENOBUFS: JZMQ_Error; cdecl;
    {class} function _GetENOCOMPATPROTO: JZMQ_Error; cdecl;
    {class} function _GetENOENT: JZMQ_Error; cdecl;
    {class} function _GetENOTCONN: JZMQ_Error; cdecl;
    {class} function _GetENOTSOCK: JZMQ_Error; cdecl;
    {class} function _GetENOTSUP: JZMQ_Error; cdecl;
    {class} function _GetEPROTO: JZMQ_Error; cdecl;
    {class} function _GetEPROTONOSUPPORT: JZMQ_Error; cdecl;
    {class} function _GetESOCKET: JZMQ_Error; cdecl;
    {class} function _GetETERM: JZMQ_Error; cdecl;
    {class} function _GetETIMEDOUT: JZMQ_Error; cdecl;
    {class} function findByCode(code: Integer): JZMQ_Error; cdecl;//Deprecated
    {class} function valueOf(name: JString): JZMQ_Error; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JZMQ_Error>; cdecl;//Deprecated
    {class} property EACCESS: JZMQ_Error read _GetEACCESS;
    {class} property EADDRINUSE: JZMQ_Error read _GetEADDRINUSE;
    {class} property EADDRNOTAVAIL: JZMQ_Error read _GetEADDRNOTAVAIL;
    {class} property EAFNOSUPPORT: JZMQ_Error read _GetEAFNOSUPPORT;
    {class} property EAGAIN: JZMQ_Error read _GetEAGAIN;
    {class} property ECONNABORTED: JZMQ_Error read _GetECONNABORTED;
    {class} property ECONNREFUSED: JZMQ_Error read _GetECONNREFUSED;
    {class} property ECONNRESET: JZMQ_Error read _GetECONNRESET;
    {class} property EFAULT: JZMQ_Error read _GetEFAULT;
    {class} property EFSM: JZMQ_Error read _GetEFSM;
    {class} property EHOSTUNREACH: JZMQ_Error read _GetEHOSTUNREACH;
    {class} property EINPROGRESS: JZMQ_Error read _GetEINPROGRESS;
    {class} property EINTR: JZMQ_Error read _GetEINTR;
    {class} property EINVAL: JZMQ_Error read _GetEINVAL;
    {class} property EIOEXC: JZMQ_Error read _GetEIOEXC;
    {class} property EISCONN: JZMQ_Error read _GetEISCONN;
    {class} property EMFILE: JZMQ_Error read _GetEMFILE;
    {class} property EMSGSIZE: JZMQ_Error read _GetEMSGSIZE;
    {class} property EMTHREAD: JZMQ_Error read _GetEMTHREAD;
    {class} property ENETDOWN: JZMQ_Error read _GetENETDOWN;
    {class} property ENETRESET: JZMQ_Error read _GetENETRESET;
    {class} property ENETUNREACH: JZMQ_Error read _GetENETUNREACH;
    {class} property ENOBUFS: JZMQ_Error read _GetENOBUFS;
    {class} property ENOCOMPATPROTO: JZMQ_Error read _GetENOCOMPATPROTO;
    {class} property ENOENT: JZMQ_Error read _GetENOENT;
    {class} property ENOTCONN: JZMQ_Error read _GetENOTCONN;
    {class} property ENOTSOCK: JZMQ_Error read _GetENOTSOCK;
    {class} property ENOTSUP: JZMQ_Error read _GetENOTSUP;
    {class} property EPROTO: JZMQ_Error read _GetEPROTO;
    {class} property EPROTONOSUPPORT: JZMQ_Error read _GetEPROTONOSUPPORT;
    {class} property ESOCKET: JZMQ_Error read _GetESOCKET;
    {class} property ETERM: JZMQ_Error read _GetETERM;
    {class} property ETIMEDOUT: JZMQ_Error read _GetETIMEDOUT;
  end;

  [JavaSignature('org/zeromq/ZMQ$Error')]
  JZMQ_Error = interface(JEnum)
    ['{4E2FD458-A257-4CC3-949F-B7B664F092B0}']
    function getCode: Integer; cdecl;//Deprecated
    function getMessage: JString; cdecl;//Deprecated
  end;
  TJZMQ_Error = class(TJavaGenericImport<JZMQ_ErrorClass, JZMQ_Error>) end;

  JZMQ_EventClass = interface(JObjectClass)
    ['{7FE024EB-FBFD-4093-B656-C23168000638}']
    {class} function init(event: Integer; value: JObject; address: JString): JZMQ_Event; cdecl;//Deprecated
    {class} function getAddress: JString; cdecl;
    {class} function getEvent: Integer; cdecl;
    {class} function recv(socket: JZMQ_Socket; flags: Integer): JZMQ_Event; cdecl; overload;
    {class} function recv(socket: JZMQ_Socket): JZMQ_Event; cdecl; overload;
  end;

  [JavaSignature('org/zeromq/ZMQ$Event')]
  JZMQ_Event = interface(JObject)
    ['{353BA007-F3DE-411E-AD18-16B887D055D2}']
    function getValue: JObject; cdecl;
  end;
  TJZMQ_Event = class(TJavaGenericImport<JZMQ_EventClass, JZMQ_Event>) end;

  JZMQ_PollItemClass = interface(JObjectClass)
    ['{E559EA4E-E88E-4B1D-84A3-FC5B39541DC8}']
    {class} function init(socket: JZMQ_Socket; ops: Integer): JZMQ_PollItem; cdecl; overload;//Deprecated
    {class} function init(channel: JSelectableChannel; ops: Integer): JZMQ_PollItem; cdecl; overload;//Deprecated
    {class} function equals(obj: JObject): Boolean; cdecl;
    {class} function getRawSocket: JSelectableChannel; cdecl;
    {class} function hashCode: Integer; cdecl;
  end;

  [JavaSignature('org/zeromq/ZMQ$PollItem')]
  JZMQ_PollItem = interface(JObject)
    ['{F775C3EE-B62D-4B5E-AD7C-6B696219863E}']
    function getSocket: JZMQ_Socket; cdecl;
    function isError: Boolean; cdecl;
    function isReadable: Boolean; cdecl;
    function isWritable: Boolean; cdecl;
    function readyOps: Integer; cdecl;
  end;
  TJZMQ_PollItem = class(TJavaGenericImport<JZMQ_PollItemClass, JZMQ_PollItem>) end;

  JZMQ_PollerClass = interface(JObjectClass)
    ['{10CB33BE-C899-4D56-BCD7-F20A96B7EE1F}']
    {class} function _GetPOLLERR: Integer; cdecl;
    {class} function _GetPOLLIN: Integer; cdecl;
    {class} function _GetPOLLOUT: Integer; cdecl;
    {class} procedure close; cdecl;//Deprecated
    {class} function getItem(index: Integer): JZMQ_PollItem; cdecl;//Deprecated
    {class} function getNext: Integer; cdecl;//Deprecated
    {class} function poll: Integer; cdecl; overload;//Deprecated
    {class} function poll(tout: Int64): Integer; cdecl; overload;
    {class} function pollerr(index: Integer): Boolean; cdecl;//Deprecated
    {class} function pollin(index: Integer): Boolean; cdecl;//Deprecated
    {class} function register(channel: JSelectableChannel; events: Integer): Integer; cdecl; overload;//Deprecated
    {class} procedure setTimeout(timeout: Int64); cdecl;//Deprecated
    {class} procedure unregister(socket: JZMQ_Socket); cdecl; overload;//Deprecated
    {class} property POLLERR: Integer read _GetPOLLERR;
    {class} property POLLIN: Integer read _GetPOLLIN;
    {class} property POLLOUT: Integer read _GetPOLLOUT;
  end;

  [JavaSignature('org/zeromq/ZMQ$Poller')]
  JZMQ_Poller = interface(JObject)
    ['{FCFADA10-D5CE-4C92-B3BB-2B44260BC016}']
    function getSize: Integer; cdecl;//Deprecated
    function getSocket(index: Integer): JZMQ_Socket; cdecl;//Deprecated
    function getTimeout: Int64; cdecl;//Deprecated
    function pollout(index: Integer): Boolean; cdecl;//Deprecated
    function register(socket: JZMQ_Socket): Integer; cdecl; overload;
    function register(channel: JSelectableChannel): Integer; cdecl; overload;//Deprecated
    function register(socket: JZMQ_Socket; events: Integer): Integer; cdecl; overload;//Deprecated
    function register(item: JZMQ_PollItem): Integer; cdecl; overload;
    procedure unregister(channel: JSelectableChannel); cdecl; overload;//Deprecated
  end;
  TJZMQ_Poller = class(TJavaGenericImport<JZMQ_PollerClass, JZMQ_Poller>) end;

  JZMQ_SocketClass = interface(JObjectClass)
    ['{3571E6DA-4B89-469F-A7AC-1DD8E1A92E01}']
    {class} function bindToRandomPort(addr: JString): Integer; cdecl; overload;
    {class} function bindToRandomPort(addr: JString; min: Integer; max: Integer): Integer; cdecl; overload;
    {class} procedure close; cdecl;
    {class} function errno: Integer; cdecl;//Deprecated
    {class} function getAsServerCurve: Boolean; cdecl;//Deprecated
    {class} function getBacklog: Integer; cdecl;//Deprecated
    {class} function getConflate: Boolean; cdecl;//Deprecated
    {class} function getCurveSecretKey: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function getCurveServerKey: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function getDelayAttachOnConnect: Boolean; cdecl;//Deprecated
    {class} function getFD: JSelectableChannel; cdecl;//Deprecated
    {class} function getHWM: Integer; cdecl;//Deprecated
    {class} function getHandshakeIvl: Integer; cdecl;
    {class} function getHeartbeatTtl: Integer; cdecl;
    {class} function getIPv4Only: Boolean; cdecl;//Deprecated
    {class} function getIPv6: Boolean; cdecl;
    {class} function getIdentity: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function getMsgAllocationHeapThreshold: Integer; cdecl;//Deprecated
    {class} function getMulticastHops: Int64; cdecl;//Deprecated
    {class} function getPlainServer: Boolean; cdecl;//Deprecated
    {class} function getRate: Int64; cdecl;
    {class} function getReceiveTimeOut: Integer; cdecl;
    {class} function getReconnectIVL: Integer; cdecl;
    {class} function getReconnectIVLMax: Integer; cdecl;
    {class} function getReqCorrelate: Boolean; cdecl;//Deprecated
    {class} function getSocketType: JSocketType; cdecl;
    {class} function getSocksProxy: JString; cdecl;//Deprecated
    {class} function getSwap: Int64; cdecl;//Deprecated
    {class} function getTCPKeepAliveIdle: Int64; cdecl;//Deprecated
    {class} function getTCPKeepAliveInterval: Int64; cdecl;//Deprecated
    {class} function getTCPKeepAliveSetting: Int64; cdecl;//Deprecated
    {class} function getType: Integer; cdecl;//Deprecated
    {class} function getZapDomain: JString; cdecl;
    {class} function hasReceiveMore: Boolean; cdecl;
    {class} function isAsServerPlain: Boolean; cdecl;//Deprecated
    {class} function isConflate: Boolean; cdecl;//Deprecated
    {class} function isImmediate: Boolean; cdecl;//Deprecated
    {class} function monitor(addr: JString; events: Integer): Boolean; cdecl;//Deprecated
    {class} function recvBinaryPicture(picture: JString): TJavaObjectArray<JObject>; cdecl;
    {class} function recvByteBuffer(buffer: JByteBuffer; flags: Integer): Integer; cdecl;
    {class} function recvPicture(picture: JString): TJavaObjectArray<JObject>; cdecl;
    {class} function send(data: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    {class} function send(data: TJavaArray<Byte>; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function send(data: TJavaArray<Byte>; off: Integer; length: Integer; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function setAffinity(value: Int64): Boolean; cdecl;
    {class} function setAsServerCurve(server: Boolean): Boolean; cdecl;//Deprecated
    {class} function setAsServerPlain(server: Boolean): Boolean; cdecl;//Deprecated
    {class} function setBacklog(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setCurvePublicKey(key: TJavaArray<Byte>): Boolean; cdecl;
    {class} function setCurveServerKey(key: TJavaArray<Byte>): Boolean; cdecl;//Deprecated
    {class} function setDecoder(cls: Jlang_Class): Boolean; cdecl;//Deprecated
    {class} function setDelayAttachOnConnect(value: Boolean): Boolean; cdecl;//Deprecated
    {class} function setHWM(hwm: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setHWM(hwm: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function setHeartbeatContext(pingContext: TJavaArray<Byte>): Boolean; cdecl;//Deprecated
    {class} function setHeartbeatTimeout(heartbeatTimeout: Integer): Boolean; cdecl;//Deprecated
    {class} function setLinger(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setLinger(value: Integer): Boolean; cdecl; overload;
    {class} function setMaxMsgSize(value: Int64): Boolean; cdecl;//Deprecated
    {class} function setMsgAllocationHeapThreshold(threshold: Integer): Boolean; cdecl;
    {class} function setMulticastHops(value: Int64): Boolean; cdecl;
    {class} function setPlainUsername(username: JString): Boolean; cdecl; overload;
    {class} function setProbeRouter(probe: Boolean): Boolean; cdecl;//Deprecated
    {class} function setRate(value: Int64): Boolean; cdecl;//Deprecated
    {class} function setRcvHWM(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setRcvHWM(value: Integer): Boolean; cdecl; overload;
    {class} function setReconnectIVL(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setReconnectIVL(value: Integer): Boolean; cdecl; overload;
    {class} function setReconnectIVLMax(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setReqCorrelate(correlate: Boolean): Boolean; cdecl;
    {class} function setReqRelaxed(relaxed: Boolean): Boolean; cdecl;
    {class} function setRouterHandover(handover: Boolean): Boolean; cdecl;
    {class} function setSelectorChooser(chooser: JSelectorProviderChooser): Boolean; cdecl;//Deprecated
    {class} function setSendBufferSize(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setSendBufferSize(value: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function setSndHWM(value: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function setSocksProxy(proxy: JString): Boolean; cdecl; overload;//Deprecated
    {class} function setTCPKeepAlive(value: Int64): Boolean; cdecl; overload;//Deprecated
    {class} function setTCPKeepAlive(optVal: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function setTCPKeepAliveCount(value: Int64): Boolean; cdecl;//Deprecated
    {class} function setXpubManual(manual: Boolean): Boolean; cdecl;//Deprecated
    {class} function setXpubNoDrop(noDrop: Boolean): Boolean; cdecl;//Deprecated
    {class} function setXpubVerbose(verbose: Boolean): Boolean; cdecl;//Deprecated
    {class} function setZapDomain(domain: JString): Boolean; cdecl; overload;
    {class} function setZapDomain(domain: TJavaArray<Byte>): Boolean; cdecl; overload;
    {class} function toString: JString; cdecl;
    {class} function unbind(addr: JString): Boolean; cdecl;
  end;

  [JavaSignature('org/zeromq/ZMQ$Socket')]
  JZMQ_Socket = interface(JObject)
    ['{ACBB633A-6582-4754-AC49-889BC45FF662}']
    function base: JSocketBase; cdecl;
    function bind(addr: JString): Boolean; cdecl;//Deprecated
    function connect(addr: JString): Boolean; cdecl;//Deprecated
    function disconnect(addr: JString): Boolean; cdecl;
    function getAffinity: Int64; cdecl;
    function getAsServerPlain: Boolean; cdecl;//Deprecated
    function getCurvePublicKey: TJavaArray<Byte>; cdecl;//Deprecated
    function getCurveServer: Boolean; cdecl;//Deprecated
    function getEvents: Integer; cdecl;//Deprecated
    function getHeartbeatContext: TJavaArray<Byte>; cdecl;
    function getHeartbeatIvl: Integer; cdecl;
    function getHeartbeatTimeout: Integer; cdecl;
    function getImmediate: Boolean; cdecl;//Deprecated
    function getLastEndpoint: JString; cdecl;
    function getLinger: Integer; cdecl;//Deprecated
    function getMaxMsgSize: Int64; cdecl;//Deprecated
    function getMechanism: JSocket_Mechanism; cdecl;
    function getPlainPassword: JString; cdecl;
    function getPlainUsername: JString; cdecl;//Deprecated
    function getRcvHWM: Integer; cdecl;//Deprecated
    function getReceiveBufferSize: Integer; cdecl;//Deprecated
    function getRecoveryInterval: Int64; cdecl;
    function getReqRelaxed: Boolean; cdecl;//Deprecated
    function getSelectorProviderChooser: JSelectorProviderChooser; cdecl;
    function getSendBufferSize: Integer; cdecl;
    function getSendTimeOut: Integer; cdecl;
    function getSndHWM: Integer; cdecl;
    function getTCPKeepAlive: Integer; cdecl;//Deprecated
    function getTCPKeepAliveCount: Int64; cdecl;//Deprecated
    function getTos: Integer; cdecl;//Deprecated
    function getZAPDomain: JString; cdecl;//Deprecated
    function hasMulticastLoop: Boolean; cdecl;//Deprecated
    function isAsServerCurve: Boolean; cdecl;//Deprecated
    function isIPv6: Boolean; cdecl;
    function recv: TJavaArray<Byte>; cdecl; overload;
    function recv(flags: Integer): TJavaArray<Byte>; cdecl; overload;//Deprecated
    function recv(buffer: TJavaArray<Byte>; offset: Integer; len: Integer; flags: Integer): Integer; cdecl; overload;
    function recvStr: JString; cdecl; overload;
    function recvStr(flags: Integer): JString; cdecl; overload;//Deprecated
    function send(data: JString): Boolean; cdecl; overload;//Deprecated
    function send(data: JString; flags: Integer): Boolean; cdecl; overload;
    function sendByteBuffer(data: JByteBuffer; flags: Integer): Integer; cdecl;
    function sendMore(data: JString): Boolean; cdecl; overload;//Deprecated
    function sendMore(data: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function setBacklog(value: Integer): Boolean; cdecl; overload;
    function setConflate(conflate: Boolean): Boolean; cdecl;
    function setConnectRid(rid: JString): Boolean; cdecl; overload;//Deprecated
    function setConnectRid(rid: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function setCurveSecretKey(key: TJavaArray<Byte>): Boolean; cdecl;
    function setCurveServer(server: Boolean): Boolean; cdecl;
    function setEncoder(cls: Jlang_Class): Boolean; cdecl;//Deprecated
    function setHandshakeIvl(maxHandshakeIvl: Integer): Boolean; cdecl;//Deprecated
    function setHeartbeatIvl(heartbeatIvl: Integer): Boolean; cdecl;//Deprecated
    function setHeartbeatTtl(heartbeatTtl: Integer): Boolean; cdecl;//Deprecated
    function setIPv4Only(v4only: Boolean): Boolean; cdecl;//Deprecated
    function setIPv6(v6: Boolean): Boolean; cdecl;//Deprecated
    function setIdentity(identity: TJavaArray<Byte>): Boolean; cdecl;//Deprecated
    function setImmediate(value: Boolean): Boolean; cdecl;//Deprecated
    function setMsgAllocator(allocator: JMsgAllocator): Boolean; cdecl;//Deprecated
    function setMulticastLoop(multicastLoop: Boolean): Boolean; cdecl;//Deprecated
    function setPlainPassword(password: JString): Boolean; cdecl; overload;
    function setPlainPassword(password: TJavaArray<Byte>): Boolean; cdecl; overload;
    function setPlainServer(server: Boolean): Boolean; cdecl;//Deprecated
    function setPlainUsername(username: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function setReceiveBufferSize(value: Int64): Boolean; cdecl; overload;//Deprecated
    function setReceiveBufferSize(value: Integer): Boolean; cdecl; overload;
    function setReceiveTimeOut(value: Integer): Boolean; cdecl;
    function setReconnectIVLMax(value: Integer): Boolean; cdecl; overload;
    function setRecoveryInterval(value: Int64): Boolean; cdecl;
    function setRouterMandatory(mandatory: Boolean): Boolean; cdecl;
    function setRouterRaw(raw: Boolean): Boolean; cdecl;
    function setSendTimeOut(value: Integer): Boolean; cdecl;//Deprecated
    function setSndHWM(value: Int64): Boolean; cdecl; overload;//Deprecated
    function setSocksProxy(proxy: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function setSwap(value: Int64): Boolean; cdecl;//Deprecated
    function setTCPKeepAliveIdle(value: Int64): Boolean; cdecl;//Deprecated
    function setTCPKeepAliveInterval(value: Int64): Boolean; cdecl;//Deprecated
    function setTos(value: Integer): Boolean; cdecl;//Deprecated
    function setXpubVerboser(verboser: Boolean): Boolean; cdecl;//Deprecated
    function setZAPDomain(domain: JString): Boolean; cdecl; overload;//Deprecated
    function setZAPDomain(domain: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function subscribe(topic: TJavaArray<Byte>): Boolean; cdecl; overload;
    function subscribe(topic: JString): Boolean; cdecl; overload;
    function unsubscribe(topic: TJavaArray<Byte>): Boolean; cdecl; overload;
    function unsubscribe(topic: JString): Boolean; cdecl; overload;
  end;
  TJZMQ_Socket = class(TJavaGenericImport<JZMQ_SocketClass, JZMQ_Socket>) end;

  JSocket_MechanismClass = interface(JEnumClass)
    ['{0820A6B0-806F-4071-9334-EE4CE0E23723}']
    {class} function _GetCURVE: JSocket_Mechanism; cdecl;
    {class} function _GetNULL: JSocket_Mechanism; cdecl;
    {class} function _GetPLAIN: JSocket_Mechanism; cdecl;
    {class} function valueOf(name: JString): JSocket_Mechanism; cdecl;
    {class} function values: TJavaObjectArray<JSocket_Mechanism>; cdecl;
    {class} property CURVE: JSocket_Mechanism read _GetCURVE;
    {class} 
    {class} property PLAIN: JSocket_Mechanism read _GetPLAIN;
  end;

  [JavaSignature('org/zeromq/ZMQ$Socket$Mechanism')]
  JSocket_Mechanism = interface(JEnum)
    ['{A3F4424A-06E4-4D30-987C-1DE948A1EE9B}']
  end;
  TJSocket_Mechanism = class(TJavaGenericImport<JSocket_MechanismClass, JSocket_Mechanism>) end;

  JZMQExceptionClass = interface(JUncheckedZMQExceptionClass)
    ['{62AD2E14-C0F8-4710-B476-7938087E1D3A}']
    {class} function init(errno: Integer): JZMQException; cdecl; overload;//Deprecated
    {class} function init(message: JString; errno: Integer): JZMQException; cdecl; overload;//Deprecated
    {class} function init(message: JString; errno: Integer; cause: JThrowable): JZMQException; cdecl; overload;//Deprecated
    {class} function getErrorCode: Integer; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZMQException')]
  JZMQException = interface(JUncheckedZMQException)
    ['{3DAD37DA-1C22-41FA-8A3F-5002357E7479}']
  end;
  TJZMQException = class(TJavaGenericImport<JZMQExceptionClass, JZMQException>) end;

  JZMQQueueClass = interface(JObjectClass)
    ['{940AB510-3503-4F7A-974E-2019062336DD}']
    {class} function init(context: JZMQ_Context; inSocket: JZMQ_Socket; outSocket: JZMQ_Socket): JZMQQueue; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZMQQueue')]
  JZMQQueue = interface(JObject)
    ['{92F3404A-8DCB-45D9-BECD-F4B316903A57}']
    procedure run; cdecl;//Deprecated
  end;
  TJZMQQueue = class(TJavaGenericImport<JZMQQueueClass, JZMQQueue>) end;

  JZMonitorClass = interface(JObjectClass)
    ['{119939BC-FB39-4D76-982C-A80EF42EE2C0}']
    {class} function init(ctx: JZContext; socket: JZMQ_Socket): JZMonitor; cdecl;//Deprecated
    {class} procedure close; cdecl;//Deprecated
    {class} procedure destroy; cdecl;//Deprecated
    {class} function nextEvent(timeout: Integer): JZMonitor_ZEvent; cdecl; overload;
    {class} function start: JZMonitor; cdecl;
  end;

  [JavaSignature('org/zeromq/ZMonitor')]
  JZMonitor = interface(JObject)
    ['{AA72A986-9034-4443-A728-F0EAD2C6AB57}']
    function nextEvent: JZMonitor_ZEvent; cdecl; overload;
    function nextEvent(wait: Boolean): JZMonitor_ZEvent; cdecl; overload;//Deprecated
    function verbose(verbose: Boolean): JZMonitor; cdecl;//Deprecated
  end;
  TJZMonitor = class(TJavaGenericImport<JZMonitorClass, JZMonitor>) end;

  JZMonitor_EventClass = interface(JEnumClass)
    ['{210AD7C0-7742-4630-A940-67DCBE767AE4}']
    {class} function _GetACCEPTED: JZMonitor_Event; cdecl;
    {class} function _GetACCEPT_FAILED: JZMonitor_Event; cdecl;
    {class} function _GetALL: JZMonitor_Event; cdecl;
    {class} function _GetBIND_FAILED: JZMonitor_Event; cdecl;
    {class} function _GetCLOSED: JZMonitor_Event; cdecl;
    {class} function _GetCLOSE_FAILED: JZMonitor_Event; cdecl;
    {class} function _GetCONNECTED: JZMonitor_Event; cdecl;
    {class} function _GetCONNECT_DELAYED: JZMonitor_Event; cdecl;
    {class} function _GetCONNECT_RETRIED: JZMonitor_Event; cdecl;
    {class} function _GetDISCONNECTED: JZMonitor_Event; cdecl;
    {class} function _GetHANDSHAKE_PROTOCOL: JZMonitor_Event; cdecl;
    {class} function _GetLISTENING: JZMonitor_Event; cdecl;
    {class} function _GetMONITOR_STOPPED: JZMonitor_Event; cdecl;
    {class} function valueOf(name: JString): JZMonitor_Event; cdecl;
    {class} function values: TJavaObjectArray<JZMonitor_Event>; cdecl;
    {class} property ACCEPTED: JZMonitor_Event read _GetACCEPTED;
    {class} property ACCEPT_FAILED: JZMonitor_Event read _GetACCEPT_FAILED;
    {class} property ALL: JZMonitor_Event read _GetALL;
    {class} property BIND_FAILED: JZMonitor_Event read _GetBIND_FAILED;
    {class} property CLOSED: JZMonitor_Event read _GetCLOSED;
    {class} property CLOSE_FAILED: JZMonitor_Event read _GetCLOSE_FAILED;
    {class} property CONNECTED: JZMonitor_Event read _GetCONNECTED;
    {class} property CONNECT_DELAYED: JZMonitor_Event read _GetCONNECT_DELAYED;
    {class} property CONNECT_RETRIED: JZMonitor_Event read _GetCONNECT_RETRIED;
    {class} property DISCONNECTED: JZMonitor_Event read _GetDISCONNECTED;
    {class} property HANDSHAKE_PROTOCOL: JZMonitor_Event read _GetHANDSHAKE_PROTOCOL;
    {class} property LISTENING: JZMonitor_Event read _GetLISTENING;
    {class} property MONITOR_STOPPED: JZMonitor_Event read _GetMONITOR_STOPPED;
  end;

  [JavaSignature('org/zeromq/ZMonitor$Event')]
  JZMonitor_Event = interface(JEnum)
    ['{293E267C-A8D0-4263-92F8-DC1EDD256499}']
  end;
  TJZMonitor_Event = class(TJavaGenericImport<JZMonitor_EventClass, JZMonitor_Event>) end;

  JZMonitor_ZEventClass = interface(JObjectClass)
    ['{DD9C9EA4-3E35-43BA-AB68-2A86B6BEE2D5}']
    {class} function _Getcode: Integer; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
    {class} property code: Integer read _Getcode;
  end;

  [JavaSignature('org/zeromq/ZMonitor$ZEvent')]
  JZMonitor_ZEvent = interface(JObject)
    ['{9B77DF33-4642-40D2-9833-0E24BEBAFB77}']
    function _Getaddress: JString; cdecl;
    function _Gettype: JZMonitor_Event; cdecl;
    function _Getvalue: JString; cdecl;
    property address: JString read _Getaddress;
    property &type: JZMonitor_Event read _Gettype;
    property value: JString read _Getvalue;
  end;
  TJZMonitor_ZEvent = class(TJavaGenericImport<JZMonitor_ZEventClass, JZMonitor_ZEvent>) end;

  JZMsgClass = interface(JObjectClass)
    ['{04819E13-C863-4A02-88ED-BFF5BD73E1AF}']
    {class} function init: JZMsg; cdecl;//Deprecated
    {class} function addAll(arg0: JCollection): Boolean; cdecl;//Deprecated
    {class} function addFirst(stringValue: JString): JZMsg; cdecl; overload;//Deprecated
    {class} function addFirst(data: TJavaArray<Byte>): JZMsg; cdecl; overload;//Deprecated
    {class} procedure addLast(e: JZFrame); cdecl; overload;//Deprecated
    {class} function addString(str: JString): JZMsg; cdecl;//Deprecated
    {class} function append(stringValue: JString): JZMsg; cdecl; overload;//Deprecated
    {class} function &contains(o: JObject): Boolean; cdecl;
    {class} function containsAll(arg0: JCollection): Boolean; cdecl;
    {class} function contentSize: Int64; cdecl;
    {class} function dump: JZMsg; cdecl; overload;
    {class} function duplicate: JZMsg; cdecl;
    {class} function element: JZFrame; cdecl;
    {class} function hashCode: Integer; cdecl;
    {class} function isEmpty: Boolean; cdecl;
    {class} function load(file_: JDataInputStream): JZMsg; cdecl;
    {class} function offer(e: JZFrame): Boolean; cdecl;
    {class} function offerFirst(e: JZFrame): Boolean; cdecl;
    {class} function offerLast(e: JZFrame): Boolean; cdecl;
    {class} function poll: JZFrame; cdecl;//Deprecated
    {class} function pollFirst: JZFrame; cdecl;//Deprecated
    {class} function pollLast: JZFrame; cdecl;//Deprecated
    {class} function push(data: TJavaArray<Byte>): JZMsg; cdecl; overload;//Deprecated
    {class} procedure push(e: JZFrame); cdecl; overload;//Deprecated
    {class} function recvMsg(socket: JZMQ_Socket): JZMsg; cdecl; overload;//Deprecated
    {class} function recvMsg(socket: JZMQ_Socket; wait: Boolean): JZMsg; cdecl; overload;//Deprecated
    {class} function recvMsg(socket: JZMQ_Socket; flag: Integer): JZMsg; cdecl; overload;//Deprecated
    {class} procedure recvMsg(socket: JZMQ_Socket; flags: Integer; handler: Jfunction_Consumer; exceptionHandler: Jfunction_Consumer); cdecl; overload;//Deprecated
    {class} procedure recvMsg(socket: JZMQ_Socket; flags: Integer; handler: Jfunction_Consumer); cdecl; overload;//Deprecated
    {class} function remove: JZFrame; cdecl; overload;//Deprecated
    {class} function remove(o: JObject): Boolean; cdecl; overload;//Deprecated
    {class} function removeLast: JZFrame; cdecl;//Deprecated
    {class} function removeLastOccurrence(o: JObject): Boolean; cdecl;//Deprecated
    {class} function retainAll(arg0: JCollection): Boolean; cdecl;//Deprecated
    {class} function save(msg: JZMsg; file_: JDataOutputStream): Boolean; cdecl;//Deprecated
    {class} function send(socket: JZMQ_Socket; destroy: Boolean): Boolean; cdecl; overload;
    {class} function size: Integer; cdecl;
    {class} function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    {class} function wrap(frame: JZFrame): JZMsg; cdecl;
  end;

  [JavaSignature('org/zeromq/ZMsg')]
  JZMsg = interface(JObject)
    ['{67EACF86-5DD4-402B-B9CD-F8F0ACF369C3}']
    function add(stringValue: JString): Boolean; cdecl; overload;//Deprecated
    function add(data: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    function add(e: JZFrame): Boolean; cdecl; overload;//Deprecated
    procedure addFirst(e: JZFrame); cdecl; overload;//Deprecated
    function addLast(stringValue: JString): JZMsg; cdecl; overload;//Deprecated
    function addLast(data: TJavaArray<Byte>): JZMsg; cdecl; overload;//Deprecated
    function append(data: TJavaArray<Byte>): JZMsg; cdecl; overload;//Deprecated
    function append(msg: JZMsg): JZMsg; cdecl; overload;//Deprecated
    procedure clear; cdecl;//Deprecated
    function descendingIterator: JIterator; cdecl;
    procedure destroy; cdecl;
    function dump(out_: JAppendable): JZMsg; cdecl; overload;
    function equals(o: JObject): Boolean; cdecl;
    function getFirst: JZFrame; cdecl;
    function getLast: JZFrame; cdecl;
    function iterator: JIterator; cdecl;
    function peek: JZFrame; cdecl;
    function peekFirst: JZFrame; cdecl;
    function peekLast: JZFrame; cdecl;
    function pop: JZFrame; cdecl;//Deprecated
    function popString: JString; cdecl;//Deprecated
    function push(str: JString): JZMsg; cdecl; overload;//Deprecated
    function removeAll(arg0: JCollection): Boolean; cdecl;//Deprecated
    function removeFirst: JZFrame; cdecl;//Deprecated
    function removeFirstOccurrence(o: JObject): Boolean; cdecl;//Deprecated
    function send(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    function toArray(arg0: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
    function toString: JString; cdecl;
    function unwrap: JZFrame; cdecl;
  end;
  TJZMsg = class(TJavaGenericImport<JZMsgClass, JZMsg>) end;

  JZPollerClass = interface(JObjectClass)
    ['{CC2BCDDB-A2FF-4E53-A9C0-FB365EE86DBD}']
    {class} function _GetERR: Integer; cdecl;
    {class} function _GetIN: Integer; cdecl;
    {class} function _GetOUT: Integer; cdecl;
    {class} function _GetPOLLERR: Integer; cdecl;
    {class} function _GetPOLLIN: Integer; cdecl;
    {class} function _GetPOLLOUT: Integer; cdecl;
    {class} function _GetREADABLE: Integer; cdecl;
    {class} function _GetWRITABLE: Integer; cdecl;
    {class} function init(poller: JZPoller): JZPoller; cdecl; overload;//Deprecated
    {class} function init(selector: JSelector): JZPoller; cdecl; overload;//Deprecated
    {class} function init(context: JZContext): JZPoller; cdecl; overload;//Deprecated
    {class} function init(creator: JZPoller_ItemCreator; poller: JZPoller): JZPoller; cdecl; overload;//Deprecated
    {class} function init(creator: JZPoller_ItemCreator; context: JZContext): JZPoller; cdecl; overload;//Deprecated
    {class} function init(creator: JZPoller_ItemCreator; selector: JSelector): JZPoller; cdecl; overload;//Deprecated
    {class} procedure close; cdecl;
    {class} procedure destroy; cdecl;
    {class} function dispatch: Boolean; cdecl;
    {class} function getGlobalHandler: JZPoller_EventsHandler; cdecl;//Deprecated
    {class} function isError(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    {class} function isError(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    {class} function isWritable(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    {class} function poll(timeout: Int64): Integer; cdecl;//Deprecated
    {class} function pollerr(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    {class} function pollout(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    {class} function pollout(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    {class} function readable(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    {class} function register(socket: JZMQ_Socket; handler: JZPoller_EventsHandler; events: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function register(socket: JZMQ_Socket; handler: JZPoller_EventsHandler): Boolean; cdecl; overload;//Deprecated
    {class} function register(socket: JZMQ_Socket; events: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function register(channel: JSelectableChannel; events: Integer): Boolean; cdecl; overload;
    {class} function register(item: JZPoller_ItemHolder): Boolean; cdecl; overload;
    {class} function writable(socket: JZMQ_Socket): Boolean; cdecl; overload;
    {class} function writable(socketOrChannel: JObject): Boolean; cdecl; overload;
    {class} property ERR: Integer read _GetERR;
    {class} property &IN: Integer read _GetIN;
    {class} property &OUT: Integer read _GetOUT;
    {class} property POLLERR: Integer read _GetPOLLERR;
    {class} property POLLIN: Integer read _GetPOLLIN;
    {class} property POLLOUT: Integer read _GetPOLLOUT;
    {class} property READABLE: Integer read _GetREADABLE;
    {class} property WRITABLE: Integer read _GetWRITABLE;
  end;

  [JavaSignature('org/zeromq/ZPoller')]
  JZPoller = interface(JObject)
    ['{C8D942E0-6539-4BA0-90F5-B70131302E4E}']
    function error(channel: JSelectableChannel): Boolean; cdecl; overload;
    function error(socket: JZMQ_Socket): Boolean; cdecl; overload;
    function error(socketOrChannel: JObject): Boolean; cdecl; overload;
    function isReadable(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    function isReadable(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    function isWritable(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    function pollerr(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    function pollin(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    function pollin(channel: JSelectableChannel): Boolean; cdecl; overload;//Deprecated
    function readable(socket: JZMQ_Socket): Boolean; cdecl; overload;//Deprecated
    function readable(socketOrChannel: JObject): Boolean; cdecl; overload;//Deprecated
    function register(socket: JZMQ_Socket; handler: Jfunction_BiFunction; events: Integer): Boolean; cdecl; overload;//Deprecated
    function register(channel: JSelectableChannel; handler: Jfunction_BiFunction; events: Integer): Boolean; cdecl; overload;//Deprecated
    function register(channel: JSelectableChannel; handler: JZPoller_EventsHandler; events: Integer): Boolean; cdecl; overload;//Deprecated
    function register(channel: JSelectableChannel; handler: JZPoller_EventsHandler): Boolean; cdecl; overload;//Deprecated
    procedure setGlobalHandler(globalHandler: JZPoller_EventsHandler); cdecl;
    function unregister(socketOrChannel: JObject): Boolean; cdecl;
    function writable(channel: JSelectableChannel): Boolean; cdecl; overload;
  end;
  TJZPoller = class(TJavaGenericImport<JZPollerClass, JZPoller>) end;

  JZPoller_ComposeEventsHandlerClass = interface(JObjectClass)
    ['{E698EFDA-D550-410E-A813-B0C4AF320B35}']
    {class} function init(sockets: Jfunction_BiFunction; channels: Jfunction_BiFunction): JZPoller_ComposeEventsHandler; cdecl;//Deprecated
    {class} function events(socket: JZMQ_Socket; events: Integer): Boolean; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZPoller$ComposeEventsHandler')]
  JZPoller_ComposeEventsHandler = interface(JObject)
    ['{86570C3B-47CF-4532-8EA7-31785821142E}']
    function events(channel: JSelectableChannel; events: Integer): Boolean; cdecl; overload;//Deprecated
  end;
  TJZPoller_ComposeEventsHandler = class(TJavaGenericImport<JZPoller_ComposeEventsHandlerClass, JZPoller_ComposeEventsHandler>) end;

  JZPoller_EventsHandlerClass = interface(IJavaClass)
    ['{23391A36-8583-49C0-A7A6-028BDC268D14}']
  end;

  [JavaSignature('org/zeromq/ZPoller$EventsHandler')]
  JZPoller_EventsHandler = interface(IJavaInstance)
    ['{F5AE6BF7-2368-4CAC-B355-51287F291953}']
    function events(socket: JZMQ_Socket; events: Integer): Boolean; cdecl; overload;//Deprecated
    function events(channel: JSelectableChannel; events: Integer): Boolean; cdecl; overload;//Deprecated
  end;
  TJZPoller_EventsHandler = class(TJavaGenericImport<JZPoller_EventsHandlerClass, JZPoller_EventsHandler>) end;

  JZPoller_ItemCreatorClass = interface(IJavaClass)
    ['{D9F85C57-2EBD-48D0-9127-5856424DE9BB}']
    {class} function create(socket: JZMQ_Socket; handler: JZPoller_EventsHandler; events: Integer): JZPoller_ItemHolder; cdecl; overload;
    {class} function create(channel: JSelectableChannel; handler: JZPoller_EventsHandler; events: Integer): JZPoller_ItemHolder; cdecl; overload;
  end;

  [JavaSignature('org/zeromq/ZPoller$ItemCreator')]
  JZPoller_ItemCreator = interface(IJavaInstance)
    ['{FD800338-3B53-4300-A27A-0734F10B7F10}']
  end;
  TJZPoller_ItemCreator = class(TJavaGenericImport<JZPoller_ItemCreatorClass, JZPoller_ItemCreator>) end;

  JZPoller_ItemHolderClass = interface(IJavaClass)
    ['{8C48E1E4-F9AB-4C06-BF8D-29F00292BED7}']
    {class} function handler: JZPoller_EventsHandler; cdecl;
    {class} function item: JPollItem; cdecl;
    {class} function socket: JZMQ_Socket; cdecl;
  end;

  [JavaSignature('org/zeromq/ZPoller$ItemHolder')]
  JZPoller_ItemHolder = interface(IJavaInstance)
    ['{6B6BD6AA-D14D-4BAB-BBD4-3B7AEC326CDF}']
  end;
  TJZPoller_ItemHolder = class(TJavaGenericImport<JZPoller_ItemHolderClass, JZPoller_ItemHolder>) end;

  JZPoller_SimpleCreatorClass = interface(JObjectClass)
    ['{BE284808-79D6-4C41-9A59-804DC7919686}']
    {class} function init: JZPoller_SimpleCreator; cdecl;//Deprecated
    {class} function create(channel: JSelectableChannel; handler: JZPoller_EventsHandler; events: Integer): JZPoller_ItemHolder; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZPoller$SimpleCreator')]
  JZPoller_SimpleCreator = interface(JObject)
    ['{36AA7614-4D85-49A1-8AEB-12D2FCA2AF71}']
    function create(socket: JZMQ_Socket; handler: JZPoller_EventsHandler; events: Integer): JZPoller_ItemHolder; cdecl; overload;
  end;
  TJZPoller_SimpleCreator = class(TJavaGenericImport<JZPoller_SimpleCreatorClass, JZPoller_SimpleCreator>) end;

  JZPoller_ZPollItemClass = interface(JZMQ_PollItemClass)
    ['{1D76F637-4877-4E2E-99E0-FC602B6003BB}']
    {class} function init(socket: JZMQ_Socket; handler: JZPoller_EventsHandler; ops: Integer): JZPoller_ZPollItem; cdecl; overload;//Deprecated
    {class} function init(channel: JSelectableChannel; handler: JZPoller_EventsHandler; ops: Integer): JZPoller_ZPollItem; cdecl; overload;//Deprecated
    {class} function item: JPollItem; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZPoller$ZPollItem')]
  JZPoller_ZPollItem = interface(JZMQ_PollItem)
    ['{411EC9A9-2868-4942-A830-35454C260C10}']
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
    function handler: JZPoller_EventsHandler; cdecl;//Deprecated
    function hashCode: Integer; cdecl;
    function socket: JZMQ_Socket; cdecl;
  end;
  TJZPoller_ZPollItem = class(TJavaGenericImport<JZPoller_ZPollItemClass, JZPoller_ZPollItem>) end;

  JZProxyClass = interface(JObjectClass)
    ['{7B42E81E-6097-465A-9DE3-047454FC0A15}']
    {class} function _GetALIVE: JString; cdecl;
    {class} function _GetEXITED: JString; cdecl;
    {class} function _GetPAUSED: JString; cdecl;
    {class} function _GetSTARTED: JString; cdecl;
    {class} function _GetSTOPPED: JString; cdecl;
    {class} function command(command: JZProxy_Command; msg: JZMsg; sync: Boolean): JZMsg; cdecl; overload;
    {class} function exit(sync: Boolean): JString; cdecl; overload;//Deprecated
    {class} function exit: JString; cdecl; overload;
    {class} function restart(hot: JZMsg): JString; cdecl;//Deprecated
    {class} function start(sync: Boolean): JString; cdecl;
    {class} function status: JString; cdecl; overload;
    {class} function stop(sync: Boolean): JString; cdecl;
    {class} property ALIVE: JString read _GetALIVE;
    {class} property EXITED: JString read _GetEXITED;
    {class} property PAUSED: JString read _GetPAUSED;
    {class} property STARTED: JString read _GetSTARTED;
    {class} property STOPPED: JString read _GetSTOPPED;
  end;

  [JavaSignature('org/zeromq/ZProxy')]
  JZProxy = interface(JObject)
    ['{031A7B20-B897-472C-87A9-2931EA636458}']
    function command(command: JString; sync: Boolean): JString; cdecl; overload;//Deprecated
    function command(command: JZProxy_Command; sync: Boolean): JZProxy_State; cdecl; overload;//Deprecated
    function configure(msg: JZMsg): JZMsg; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    function pause(sync: Boolean): JString; cdecl;
    function started: Boolean; cdecl;//Deprecated
    function status(sync: Boolean): JString; cdecl; overload;//Deprecated
  end;
  TJZProxy = class(TJavaGenericImport<JZProxyClass, JZProxy>) end;

  JZProxy_CommandClass = interface(JEnumClass)
    ['{77E133F9-C624-41CD-A785-B952F8B73699}']
    {class} function _GetCONFIG: JZProxy_Command; cdecl;
    {class} function _GetEXIT: JZProxy_Command; cdecl;
    {class} function _GetPAUSE: JZProxy_Command; cdecl;
    {class} function _GetRESTART: JZProxy_Command; cdecl;
    {class} function _GetSTART: JZProxy_Command; cdecl;
    {class} function _GetSTATUS: JZProxy_Command; cdecl;
    {class} function _GetSTOP: JZProxy_Command; cdecl;
    {class} function valueOf(name: JString): JZProxy_Command; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JZProxy_Command>; cdecl;
    {class} property CONFIG: JZProxy_Command read _GetCONFIG;
    {class} property EXIT: JZProxy_Command read _GetEXIT;
    {class} property PAUSE: JZProxy_Command read _GetPAUSE;
    {class} property RESTART: JZProxy_Command read _GetRESTART;
    {class} property START: JZProxy_Command read _GetSTART;
    {class} property STATUS: JZProxy_Command read _GetSTATUS;
    {class} property STOP: JZProxy_Command read _GetSTOP;
  end;

  [JavaSignature('org/zeromq/ZProxy$Command')]
  JZProxy_Command = interface(JEnum)
    ['{6A8CA8EA-4514-4C5F-9D07-493BEE1817D8}']
  end;
  TJZProxy_Command = class(TJavaGenericImport<JZProxy_CommandClass, JZProxy_Command>) end;

  JZProxy_PlugClass = interface(JEnumClass)
    ['{0777FDD1-1FEA-4339-99CA-D2CABED1EB4F}']
    {class} function _GetBACK: JZProxy_Plug; cdecl;
    {class} function _GetCAPTURE: JZProxy_Plug; cdecl;
    {class} function _GetFRONT: JZProxy_Plug; cdecl;
    {class} function valueOf(name: JString): JZProxy_Plug; cdecl;
    {class} function values: TJavaObjectArray<JZProxy_Plug>; cdecl;
    {class} property BACK: JZProxy_Plug read _GetBACK;
    {class} property CAPTURE: JZProxy_Plug read _GetCAPTURE;
    {class} property FRONT: JZProxy_Plug read _GetFRONT;
  end;

  [JavaSignature('org/zeromq/ZProxy$Plug')]
  JZProxy_Plug = interface(JEnum)
    ['{8858641A-03E2-43B9-AB9B-7A8C7061D11A}']
  end;
  TJZProxy_Plug = class(TJavaGenericImport<JZProxy_PlugClass, JZProxy_Plug>) end;

  JZProxy_ProxyClass = interface(IJavaClass)
    ['{7B5E0F52-2BF8-4E28-BFB1-F96DD456F07A}']
  end;

  [JavaSignature('org/zeromq/ZProxy$Proxy')]
  JZProxy_Proxy = interface(IJavaInstance)
    ['{2DC2BDB3-11FB-47B2-8544-1BE00D4234B7}']
  end;
  TJZProxy_Proxy = class(TJavaGenericImport<JZProxy_ProxyClass, JZProxy_Proxy>) end;

  JProxy_SimpleProxyClass = interface(JObjectClass)
    ['{C6F62791-0CA1-40D4-A6BD-0669BBDBFCDD}']
    {class} function init: JProxy_SimpleProxy; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZProxy$Proxy$SimpleProxy')]
  JProxy_SimpleProxy = interface(JObject)
    ['{555511DB-C4E9-4CDB-B8EA-97622033A871}']
  end;
  TJProxy_SimpleProxy = class(TJavaGenericImport<JProxy_SimpleProxyClass, JProxy_SimpleProxy>) end;

  JZProxy_PumpClass = interface(IJavaClass)
    ['{45FBB5E3-37A7-42D4-8B18-79CFE74B2068}']
  end;

  [JavaSignature('org/zeromq/ZProxy$Pump')]
  JZProxy_Pump = interface(IJavaInstance)
    ['{1046DE93-4589-48A8-B1B7-E6734E13E86F}']
    function flow(src: JZProxy_Plug; source: JZMQ_Socket; capture: JZMQ_Socket; dst: JZProxy_Plug; destination: JZMQ_Socket): Boolean; cdecl;
  end;
  TJZProxy_Pump = class(TJavaGenericImport<JZProxy_PumpClass, JZProxy_Pump>) end;

  JZProxy_StateClass = interface(JEnumClass)
    ['{3A8FD150-AF3D-4E64-8F1C-D30E0A36F13A}']
    {class} function _GetALIVE: JZProxy_State; cdecl;
    {class} function _GetEXITED: JZProxy_State; cdecl;
    {class} function _GetPAUSED: JZProxy_State; cdecl;
    {class} function _GetSTARTED: JZProxy_State; cdecl;
    {class} function _GetSTOPPED: JZProxy_State; cdecl;
    {class} function valueOf(name: JString): JZProxy_State; cdecl;
    {class} function values: TJavaObjectArray<JZProxy_State>; cdecl;
    {class} property ALIVE: JZProxy_State read _GetALIVE;
    {class} property EXITED: JZProxy_State read _GetEXITED;
    {class} property PAUSED: JZProxy_State read _GetPAUSED;
    {class} property STARTED: JZProxy_State read _GetSTARTED;
    {class} property STOPPED: JZProxy_State read _GetSTOPPED;
  end;

  [JavaSignature('org/zeromq/ZProxy$State')]
  JZProxy_State = interface(JEnum)
    ['{CE101F0E-30E6-4B7D-A299-D93D448A0BF9}']
  end;
  TJZProxy_State = class(TJavaGenericImport<JZProxy_StateClass, JZProxy_State>) end;

  JZProxy_ZPumpClass = interface(JObjectClass)
    ['{D8ACE885-04A7-458D-B4E3-02D7E936A867}']
    {class} function init: JZProxy_ZPump; cdecl; overload;//Deprecated
    {class} function init(transformer: JZPump_Transformer): JZProxy_ZPump; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZProxy$ZPump')]
  JZProxy_ZPump = interface(JObject)
    ['{EE2CCF93-5D31-45B0-B520-730405B54F43}']
    function flow(splug: JZProxy_Plug; source: JZMQ_Socket; capture: JZMQ_Socket; dplug: JZProxy_Plug; destination: JZMQ_Socket): Boolean; cdecl;//Deprecated
  end;
  TJZProxy_ZPump = class(TJavaGenericImport<JZProxy_ZPumpClass, JZProxy_ZPump>) end;

  JZPump_TransformerClass = interface(IJavaClass)
    ['{FD5A0159-313E-4CF2-9DB5-BE2590D0F590}']
    {class} function transform(msg: JZMsg; src: JZProxy_Plug; dst: JZProxy_Plug): JZMsg; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZProxy$ZPump$Transformer')]
  JZPump_Transformer = interface(IJavaInstance)
    ['{54F64128-58FF-4387-8A43-5D83BCE76128}']
  end;
  TJZPump_Transformer = class(TJavaGenericImport<JZPump_TransformerClass, JZPump_Transformer>) end;

  JZSocketClass = interface(JObjectClass)
    ['{1A4D19B2-738B-4C68-B99D-3FC52A085D19}']
    {class} function init(socketType: Integer): JZSocket; cdecl; overload;//Deprecated
    {class} function init(socketType: JSocketType): JZSocket; cdecl; overload;//Deprecated
    {class} function connect(endpoint: JString): Boolean; cdecl;
    {class} function disconnect(endpoint: JString): Boolean; cdecl;
    {class} function getSocketType: JSocketType; cdecl;
    {class} function send(b: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function send(b: TJavaArray<Byte>; flags: Integer): Integer; cdecl; overload;
    {class} function sendFrame(frame: JZFrame; flags: Integer): Boolean; cdecl;
    {class} function sendMessage(message: JZMsg): Boolean; cdecl;
    {class} function sendStringUtf8(str: JString; flags: Integer): Integer; cdecl; overload;
    {class} function unbind(endpoint: JString): Boolean; cdecl;
    {class} procedure unsubscribe(topic: TJavaArray<Byte>); cdecl; overload;
    {class} procedure unsubscribe(topic: JString); cdecl; overload;
  end;

  [JavaSignature('org/zeromq/ZSocket')]
  JZSocket = interface(JObject)
    ['{DAC9C517-ED8F-4D24-87CF-F5DF5BBAA2C4}']
    function bind(endpoint: JString): Boolean; cdecl;
    procedure close; cdecl;
    function getType: Integer; cdecl;
    function hasReceiveMore: Boolean; cdecl;
    function receive: TJavaArray<Byte>; cdecl; overload;
    function receive(flags: Integer): TJavaArray<Byte>; cdecl; overload;
    function receiveStringUtf8: JString; cdecl; overload;
    function receiveStringUtf8(flags: Integer): JString; cdecl; overload;
    function sendStringUtf8(str: JString): Integer; cdecl; overload;
    procedure subscribe(topic: TJavaArray<Byte>); cdecl; overload;
    procedure subscribe(topic: JString); cdecl; overload;
  end;
  TJZSocket = class(TJavaGenericImport<JZSocketClass, JZSocket>) end;

  JZStar_TimeTakerClass = interface(IJavaClass)
    ['{9CE93E3B-2F1E-47FE-9D33-939AA1542576}']
    {class} procedure party(ctx: JZContext); cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZStar$TimeTaker')]
  JZStar_TimeTaker = interface(IJavaInstance)
    ['{1DF5BA30-46F3-4721-952E-B3F2B07498CC}']
  end;
  TJZStar_TimeTaker = class(TJavaGenericImport<JZStar_TimeTakerClass, JZStar_TimeTaker>) end;

  JZStar_EntourageClass = interface(JZStar_TimeTakerClass)
    ['{B214338B-38A3-4AA9-A222-425C5DDD3878}']
  end;

  [JavaSignature('org/zeromq/ZStar$Entourage')]
  JZStar_Entourage = interface(JZStar_TimeTaker)
    ['{30B88898-5E72-453E-BF27-676525B2411E}']
  end;
  TJZStar_Entourage = class(TJavaGenericImport<JZStar_EntourageClass, JZStar_Entourage>) end;

  JZStar_ExitClass = interface(IJavaClass)
    ['{B7C9B029-5119-472F-8899-A7B6B79B987C}']
    {class} procedure await; cdecl; overload;
    {class} procedure awaitSilent; cdecl;
  end;

  [JavaSignature('org/zeromq/ZStar$Exit')]
  JZStar_Exit = interface(IJavaInstance)
    ['{D82AA8FE-F2D8-4051-BFB5-83E2B83368B5}']
    function await(timeout: Int64; unit_: JTimeUnit): Boolean; cdecl; overload;
    function isExited: Boolean; cdecl;
  end;
  TJZStar_Exit = class(TJavaGenericImport<JZStar_ExitClass, JZStar_Exit>) end;

  JZStar_FortuneClass = interface(JZStar_TimeTakerClass)
    ['{5350009C-0949-4F3C-BDDB-32ADB08BFE7C}']
  end;

  [JavaSignature('org/zeromq/ZStar$Fortune')]
  JZStar_Fortune = interface(JZStar_TimeTaker)
    ['{2BD1F1EE-4660-4576-AF82-B18798DEB7EC}']
    function interview(mic: JZMQ_Socket): Boolean; cdecl;
  end;
  TJZStar_Fortune = class(TJavaGenericImport<JZStar_FortuneClass, JZStar_Fortune>) end;

  JZStar_SetClass = interface(IJavaClass)
    ['{603599B1-9CBB-4C7B-8214-88F3A296B09A}']
    {class} function fire: Boolean; cdecl;//Deprecated
    {class} procedure lights(name: JString; id: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZStar$Set')]
  JZStar_Set = interface(IJavaInstance)
    ['{E56832BE-21EA-4997-877D-950B3ECB4590}']
  end;
  TJZStar_Set = class(TJavaGenericImport<JZStar_SetClass, JZStar_Set>) end;

  JZStar_SimpleSetClass = interface(JObjectClass)
    ['{2F1CB806-33B5-424B-83E3-3D911085DA24}']
    {class} function init: JZStar_SimpleSet; cdecl;//Deprecated
    {class} function createDefaultName(format: JString; id: Integer): JString; cdecl;//Deprecated
    {class} function fire: Boolean; cdecl;//Deprecated
    {class} procedure lights(name: JString; id: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZStar$SimpleSet')]
  JZStar_SimpleSet = interface(JObject)
    ['{BA388B18-E775-4BC5-A5A2-D35D9BE75E5A}']
  end;
  TJZStar_SimpleSet = class(TJavaGenericImport<JZStar_SimpleSetClass, JZStar_SimpleSet>) end;

  JZStar_StarClass = interface(IJavaClass)
    ['{21654A92-ADF8-411D-A600-DFF7D4DAC297}']
    {class} function entract: Boolean; cdecl;//Deprecated
    {class} function renews: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/ZStar$Star')]
  JZStar_Star = interface(IJavaInstance)
    ['{00B0699E-E6CF-4FCF-BA15-07D705C77ACC}']
    function act(events: Integer): Boolean; cdecl;//Deprecated
    function breathe: Integer; cdecl;//Deprecated
    procedure prepare; cdecl;
  end;
  TJZStar_Star = class(TJavaGenericImport<JZStar_StarClass, JZStar_Star>) end;

  JZThreadClass = interface(JObjectClass)
    ['{CB43B497-9B5C-44C3-89A6-9EA7E829A16B}']
  end;

  [JavaSignature('org/zeromq/ZThread')]
  JZThread = interface(JObject)
    ['{D4F6A058-5DD9-4794-B523-5732B3A5E4AB}']
  end;
  TJZThread = class(TJavaGenericImport<JZThreadClass, JZThread>) end;

  JZThread_IAttachedRunnableClass = interface(IJavaClass)
    ['{59910211-CFA0-45AF-8C85-318C773C17A9}']
    {class} procedure run(args: TJavaObjectArray<JObject>; ctx: JZContext; pipe: JZMQ_Socket); cdecl;
  end;

  [JavaSignature('org/zeromq/ZThread$IAttachedRunnable')]
  JZThread_IAttachedRunnable = interface(IJavaInstance)
    ['{D8B19B14-9BA1-4D77-9048-F0096F646418}']
  end;
  TJZThread_IAttachedRunnable = class(TJavaGenericImport<JZThread_IAttachedRunnableClass, JZThread_IAttachedRunnable>) end;

  JZThread_IDetachedRunnableClass = interface(IJavaClass)
    ['{5CE21FF3-28E6-4115-B090-BA4F524D2FCA}']
  end;

  [JavaSignature('org/zeromq/ZThread$IDetachedRunnable')]
  JZThread_IDetachedRunnable = interface(IJavaInstance)
    ['{AFCA129A-E02A-4F10-B9D8-339DD173F819}']
    procedure run(args: TJavaObjectArray<JObject>); cdecl;
  end;
  TJZThread_IDetachedRunnable = class(TJavaGenericImport<JZThread_IDetachedRunnableClass, JZThread_IDetachedRunnable>) end;

  JZTimerClass = interface(JObjectClass)
    ['{91D8E7A1-4758-4504-B3E9-CCD41996B898}']
    {class} function init: JZTimer; cdecl;//Deprecated
    {class} function execute: Integer; cdecl;
    {class} function setInterval(timer: JZTimer_Timer; interval: Int64): Boolean; cdecl;//Deprecated
    {class} function sleepAndExecute: Integer; cdecl;//Deprecated
    {class} function timeout: Int64; cdecl;
  end;

  [JavaSignature('org/zeromq/ZTimer')]
  JZTimer = interface(JObject)
    ['{CD450488-88D9-423A-AE36-5883E89AF1C4}']
    function cancel(timer: JZTimer_Timer): Boolean; cdecl;//Deprecated
    function reset(timer: JZTimer_Timer): Boolean; cdecl;//Deprecated
  end;
  TJZTimer = class(TJavaGenericImport<JZTimerClass, JZTimer>) end;

  JTimers_HandlerClass = interface(IJavaClass)
    ['{4AECDFF8-5263-4041-9B44-7AA518E5BADC}']
  end;

  [JavaSignature('zmq/util/Timers$Handler')]
  JTimers_Handler = interface(IJavaInstance)
    ['{C1081687-2B2F-4BF9-B189-8C00998169B5}']
  end;
  TJTimers_Handler = class(TJavaGenericImport<JTimers_HandlerClass, JTimers_Handler>) end;

  JTimerHandlerClass = interface(JTimers_HandlerClass)
    ['{A12DBA0D-BDB4-47CE-A446-5BCDF0ED5F91}']
  end;

  [JavaSignature('org/zeromq/timer/TimerHandler')]
  JTimerHandler = interface(JTimers_Handler)
    ['{B033B44E-C6FF-4BFE-B9B9-EBA8365A620E}']
  end;
  TJTimerHandler = class(TJavaGenericImport<JTimerHandlerClass, JTimerHandler>) end;

  JZTimer_HandlerClass = interface(JTimerHandlerClass)
    ['{383DE970-73E8-4572-834C-0E687A26FEDC}']
  end;

  [JavaSignature('org/zeromq/ZTimer$Handler')]
  JZTimer_Handler = interface(JTimerHandler)
    ['{21298F97-E445-43CC-9231-EFDCA468658D}']
  end;
  TJZTimer_Handler = class(TJavaGenericImport<JZTimer_HandlerClass, JZTimer_Handler>) end;

  JZTimer_TimerClass = interface(JObjectClass)
    ['{2CB2C49C-B86C-4D82-8FB8-B435DC05E228}']
  end;

  [JavaSignature('org/zeromq/ZTimer$Timer')]
  JZTimer_Timer = interface(JObject)
    ['{59084637-1F40-4697-9D08-72F7B201C7FC}']
  end;
  TJZTimer_Timer = class(TJavaGenericImport<JZTimer_TimerClass, JZTimer_Timer>) end;

  JZNeedleClass = interface(JObjectClass)
    ['{5EA4BD92-2081-436D-8169-E16F2C4BC479}']
    {class} function init(frame: JZFrame): JZNeedle; cdecl;//Deprecated
    {class} function getBlock(size: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function getLongString: JString; cdecl;//Deprecated
    {class} function getMap: JMap; cdecl;//Deprecated
    {class} function getNumber1: Integer; cdecl;//Deprecated
    {class} function getNumber2: Integer; cdecl;//Deprecated
    {class} function getNumber4: Integer; cdecl;
    {class} procedure putBlock(value: TJavaArray<Byte>; size: Integer); cdecl;//Deprecated
    {class} procedure putList(elements: JCollection); cdecl;
    {class} procedure putLongString(value: JString); cdecl;//Deprecated
    {class} procedure putMap(map: JMap); cdecl;
    {class} procedure putNumber1(value: Integer); cdecl;//Deprecated
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('org/zeromq/proto/ZNeedle')]
  JZNeedle = interface(JObject)
    ['{F6F81BAD-82A8-4796-BF49-FFD4817E21CF}']
    function getList: JList; cdecl;//Deprecated
    function getNumber8: Int64; cdecl;//Deprecated
    function getShortString: JString; cdecl;//Deprecated
    function getString: JString; cdecl;//Deprecated
    procedure putNumber2(value: Integer); cdecl;//Deprecated
    procedure putNumber4(value: Integer); cdecl;
    procedure putNumber8(value: Int64); cdecl;//Deprecated
    procedure putShortString(value: JString); cdecl;
    procedure putString(value: JString); cdecl;//Deprecated
  end;
  TJZNeedle = class(TJavaGenericImport<JZNeedleClass, JZNeedle>) end;

  JZPictureClass = interface(JObjectClass)
    ['{85E53527-E2EC-4AAC-B513-A34484726B9E}']
    {class} function init: JZPicture; cdecl;//Deprecated
    {class} function recvBinaryPicture(socket: JZMQ_Socket; picture: JString): TJavaObjectArray<JObject>; cdecl;
  end;

  [JavaSignature('org/zeromq/proto/ZPicture')]
  JZPicture = interface(JObject)
    ['{6334A56B-5523-47EB-801D-ADCA1C49EE51}']
    function recvPicture(socket: JZMQ_Socket; picture: JString): TJavaObjectArray<JObject>; cdecl;
  end;
  TJZPicture = class(TJavaGenericImport<JZPictureClass, JZPicture>) end;

  JZTickerClass = interface(JObjectClass)
    ['{0392BB29-5582-49CF-8D50-7B9FE36A318A}']
    {class} function init: JZTicker; cdecl;//Deprecated
    {class} function execute: Integer; cdecl;
    {class} function timeout: Int64; cdecl;
  end;

  [JavaSignature('org/zeromq/timer/ZTicker')]
  JZTicker = interface(JObject)
    ['{78A7C914-ED74-41D5-A6B1-CBEFEDF59EE7}']
  end;
  TJZTicker = class(TJavaGenericImport<JZTickerClass, JZTicker>) end;

  JZTicketClass = interface(JObjectClass)
    ['{DEE4BC4F-989D-44C5-8244-1267F368947E}']
    {class} function init: JZTicket; cdecl;//Deprecated
    {class} function execute: Integer; cdecl;
    {class} function timeout: Int64; cdecl;
  end;

  [JavaSignature('org/zeromq/timer/ZTicket')]
  JZTicket = interface(JObject)
    ['{4A3A23DB-4139-4C9C-9279-F985DDA334D1}']
  end;
  TJZTicket = class(TJavaGenericImport<JZTicketClass, JZTicket>) end;

  JZTicket_TicketClass = interface(JObjectClass)
    ['{091E1039-8180-4809-83D7-C5703BE91BBA}']
    {class} function cancel: Boolean; cdecl;//Deprecated
    {class} function compareTo(other: JZTicket_Ticket): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/timer/ZTicket$Ticket')]
  JZTicket_Ticket = interface(JObject)
    ['{8ECBEE08-A80B-43F5-AC5E-33FA202B628F}']
    procedure reset; cdecl;//Deprecated
    procedure setDelay(delay: Int64); cdecl;//Deprecated
  end;
  TJZTicket_Ticket = class(TJavaGenericImport<JZTicket_TicketClass, JZTicket_Ticket>) end;

  Jtimer_ZTimerClass = interface(JObjectClass)
    ['{2B57FE0D-CA12-4DF7-A3EE-54E83E75040D}']
    {class} function init: Jtimer_ZTimer; cdecl;//Deprecated
    {class} function sleepAndExecute: Integer; cdecl;
  end;

  [JavaSignature('org/zeromq/timer/ZTimer')]
  Jtimer_ZTimer = interface(JObject)
    ['{057B7EDC-B31A-46E5-AAFF-9B62A2E28BBB}']
    function execute: Integer; cdecl;//Deprecated
    function timeout: Int64; cdecl;//Deprecated
  end;
  TJtimer_ZTimer = class(TJavaGenericImport<Jtimer_ZTimerClass, Jtimer_ZTimer>) end;

  Jtimer_ZTimer_TimerClass = interface(JObjectClass)
    ['{470C16D8-386A-480B-B80F-57F33A8B9789}']
    {class} function cancel: Boolean; cdecl;//Deprecated
    {class} function setInterval(interval: Int64): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/timer/ZTimer$Timer')]
  Jtimer_ZTimer_Timer = interface(JObject)
    ['{6794F805-8322-4E17-A188-670F31F6571B}']
    function reset: Boolean; cdecl;
  end;
  TJtimer_ZTimer_Timer = class(TJavaGenericImport<Jtimer_ZTimer_TimerClass, Jtimer_ZTimer_Timer>) end;

  JZDataClass = interface(JObjectClass)
    ['{BF6C2EFD-13ED-4418-B78C-6DAE97F021E8}']
    {class} function init(data: TJavaArray<Byte>): JZData; cdecl;//Deprecated
    {class} function equals(that: TJavaArray<Byte>): Boolean; cdecl; overload;//Deprecated
    {class} function equals(other: JObject): Boolean; cdecl; overload;//Deprecated
    {class} procedure print(out_: JPrintStream; prefix: JString; data: TJavaArray<Byte>; size: Integer); cdecl; overload;//Deprecated
    {class} function streq(str: JString): Boolean; cdecl; overload;
    {class} function streq(data: TJavaArray<Byte>; str: JString): Boolean; cdecl; overload;
    {class} function strhex: JString; cdecl; overload;
    {class} function strhex(data: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function toString(data: TJavaArray<Byte>): JString; cdecl; overload;
  end;

  [JavaSignature('org/zeromq/util/ZData')]
  JZData = interface(JObject)
    ['{260A452A-97CA-4BA7-97CA-89E780E1315B}']
    function hashCode: Integer; cdecl;//Deprecated
    procedure print(out_: JPrintStream; prefix: JString); cdecl; overload;//Deprecated
    function toString: JString; cdecl; overload;
  end;
  TJZData = class(TJavaGenericImport<JZDataClass, JZData>) end;

  JZDigestClass = interface(JObjectClass)
    ['{3F9DC81B-8156-46D2-9D99-B8271372BCA3}']
    {class} function init: JZDigest; cdecl; overload;//Deprecated
    {class} function init(buffer: TJavaArray<Byte>): JZDigest; cdecl; overload;//Deprecated
    {class} function data: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function size: Integer; cdecl;//Deprecated
    {class} function &string: JString; cdecl;//Deprecated
  end;

  [JavaSignature('org/zeromq/util/ZDigest')]
  JZDigest = interface(JObject)
    ['{3C44000B-769C-4B32-8461-47137161BF4F}']
    function update(input: JInputStream): JZDigest; cdecl; overload;//Deprecated
    function update(input: TJavaArray<Byte>): JZDigest; cdecl; overload;//Deprecated
    function update(input: TJavaArray<Byte>; offset: Integer; length: Integer): JZDigest; cdecl; overload;//Deprecated
  end;
  TJZDigest = class(TJavaGenericImport<JZDigestClass, JZDigest>) end;

  JZMetadataClass = interface(JObjectClass)
    ['{BBF8ECFA-66BA-46E2-B042-0C55AA38AC1D}']
    {class} function init: JZMetadata; cdecl; overload;//Deprecated
    {class} function init(metadata: Jio_Metadata): JZMetadata; cdecl; overload;//Deprecated
    {class} function hashCode: Integer; cdecl;
    {class} function keySet: JSet; cdecl;
    {class} function read(meta: JString): JZMetadata; cdecl; overload;
    {class} function read(conf: JZConfig): JZMetadata; cdecl; overload;
    {class} procedure &set(key: JString; value: JString); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('org/zeromq/util/ZMetadata')]
  JZMetadata = interface(JObject)
    ['{7B8DD0D4-8AFC-482F-987C-13D72BD06AAA}']
    function bytes: TJavaArray<Byte>; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function &get(key: JString): JString; cdecl;
    procedure remove(key: JString); cdecl;
  end;
  TJZMetadata = class(TJavaGenericImport<JZMetadataClass, JZMetadata>) end;

  JCommandClass = interface(JObjectClass)
    ['{F7C5CAB4-D4EA-4730-9867-669318300E96}']
    {class} procedure process; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/Command')]
  JCommand = interface(JObject)
    ['{008FC25D-8E31-45E2-B43A-7E4593113FB3}']
  end;
  TJCommand = class(TJavaGenericImport<JCommandClass, JCommand>) end;

  JCommand_TypeClass = interface(JEnumClass)
    ['{BE0DEFE5-0378-47D7-83BD-017209C3E64C}']
    {class} function _GetACTIVATE_READ: JCommand_Type; cdecl;
    {class} function _GetACTIVATE_WRITE: JCommand_Type; cdecl;
    {class} function _GetATTACH: JCommand_Type; cdecl;
    {class} function _GetBIND: JCommand_Type; cdecl;
    {class} function _GetDONE: JCommand_Type; cdecl;
    {class} function _GetHICCUP: JCommand_Type; cdecl;
    {class} function _GetINPROC_CONNECTED: JCommand_Type; cdecl;
    {class} function _GetOWN: JCommand_Type; cdecl;
    {class} function _GetPIPE_TERM: JCommand_Type; cdecl;
    {class} function _GetPIPE_TERM_ACK: JCommand_Type; cdecl;
    {class} function _GetPLUG: JCommand_Type; cdecl;
    {class} function _GetREAP: JCommand_Type; cdecl;
    {class} function _GetREAPED: JCommand_Type; cdecl;
    {class} function _GetSTOP: JCommand_Type; cdecl;
    {class} function _GetTERM: JCommand_Type; cdecl;
    {class} function _GetTERM_ACK: JCommand_Type; cdecl;
    {class} function _GetTERM_REQ: JCommand_Type; cdecl;
    {class} function valueOf(name: JString): JCommand_Type; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JCommand_Type>; cdecl;//Deprecated
    {class} property ACTIVATE_READ: JCommand_Type read _GetACTIVATE_READ;
    {class} property ACTIVATE_WRITE: JCommand_Type read _GetACTIVATE_WRITE;
    {class} property ATTACH: JCommand_Type read _GetATTACH;
    {class} property BIND: JCommand_Type read _GetBIND;
    {class} property DONE: JCommand_Type read _GetDONE;
    {class} property HICCUP: JCommand_Type read _GetHICCUP;
    {class} property INPROC_CONNECTED: JCommand_Type read _GetINPROC_CONNECTED;
    {class} property OWN: JCommand_Type read _GetOWN;
    {class} property PIPE_TERM: JCommand_Type read _GetPIPE_TERM;
    {class} property PIPE_TERM_ACK: JCommand_Type read _GetPIPE_TERM_ACK;
    {class} property PLUG: JCommand_Type read _GetPLUG;
    {class} property REAP: JCommand_Type read _GetREAP;
    {class} property REAPED: JCommand_Type read _GetREAPED;
    {class} property STOP: JCommand_Type read _GetSTOP;
    {class} property TERM: JCommand_Type read _GetTERM;
    {class} property TERM_ACK: JCommand_Type read _GetTERM_ACK;
    {class} property TERM_REQ: JCommand_Type read _GetTERM_REQ;
  end;

  [JavaSignature('zmq/Command$Type')]
  JCommand_Type = interface(JEnum)
    ['{B8E31027-D4D0-4BC4-813F-394E35A41531}']
  end;
  TJCommand_Type = class(TJavaGenericImport<JCommand_TypeClass, JCommand_Type>) end;

  Jzmq_ConfigClass = interface(JEnumClass)
    ['{7EA4418B-9347-4FD4-A741-1C9EF515139A}']
    {class} function _GetCLOCK_PRECISION: Jzmq_Config; cdecl;
    {class} function _GetCOMMAND_PIPE_GRANULARITY: Jzmq_Config; cdecl;
    {class} function _GetINBOUND_POLL_RATE: Jzmq_Config; cdecl;
    {class} function _GetIN_BATCH_SIZE: Jzmq_Config; cdecl;
    {class} function _GetMAX_COMMAND_DELAY: Jzmq_Config; cdecl;
    {class} function _GetMAX_IO_EVENTS: Jzmq_Config; cdecl;
    {class} function _GetMAX_WM_DELTA: Jzmq_Config; cdecl;
    {class} function _GetMESSAGE_PIPE_GRANULARITY: Jzmq_Config; cdecl;
    {class} function _GetMSG_ALLOCATION_HEAP_THRESHOLD: Jzmq_Config; cdecl;
    {class} function _GetOUT_BATCH_SIZE: Jzmq_Config; cdecl;
    {class} function _GetPGM_MAX_TPDU: Jzmq_Config; cdecl;
    {class} function _GetSIGNALER_PORT: Jzmq_Config; cdecl;
    {class} function valueOf(name: JString): Jzmq_Config; cdecl;
    {class} function values: TJavaObjectArray<Jzmq_Config>; cdecl;
    {class} property CLOCK_PRECISION: Jzmq_Config read _GetCLOCK_PRECISION;
    {class} property COMMAND_PIPE_GRANULARITY: Jzmq_Config read _GetCOMMAND_PIPE_GRANULARITY;
    {class} property INBOUND_POLL_RATE: Jzmq_Config read _GetINBOUND_POLL_RATE;
    {class} property IN_BATCH_SIZE: Jzmq_Config read _GetIN_BATCH_SIZE;
    {class} property MAX_COMMAND_DELAY: Jzmq_Config read _GetMAX_COMMAND_DELAY;
    {class} property MAX_IO_EVENTS: Jzmq_Config read _GetMAX_IO_EVENTS;
    {class} property MAX_WM_DELTA: Jzmq_Config read _GetMAX_WM_DELTA;
    {class} property MESSAGE_PIPE_GRANULARITY: Jzmq_Config read _GetMESSAGE_PIPE_GRANULARITY;
    {class} property MSG_ALLOCATION_HEAP_THRESHOLD: Jzmq_Config read _GetMSG_ALLOCATION_HEAP_THRESHOLD;
    {class} property OUT_BATCH_SIZE: Jzmq_Config read _GetOUT_BATCH_SIZE;
    {class} property PGM_MAX_TPDU: Jzmq_Config read _GetPGM_MAX_TPDU;
    {class} property SIGNALER_PORT: Jzmq_Config read _GetSIGNALER_PORT;
  end;

  [JavaSignature('zmq/Config')]
  Jzmq_Config = interface(JEnum)
    ['{C5C7E2B7-F473-4738-8249-C2C13B2BD6E3}']
    function getValue: Integer; cdecl;
  end;
  TJzmq_Config = class(TJavaGenericImport<Jzmq_ConfigClass, Jzmq_Config>) end;

  JCtxClass = interface(JObjectClass)
    ['{C4CD6A86-9285-445A-B929-0029FAB859FE}']
    {class} function init: JCtx; cdecl;//Deprecated
    {class} function createSelector: JSelector; cdecl;//Deprecated
    {class} function createSocket(type_: Integer): JSocketBase; cdecl;//Deprecated
    {class} function errno: JErrno; cdecl;//Deprecated
    {class} procedure terminate; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/Ctx')]
  JCtx = interface(JObject)
    ['{1B04762A-1E46-40FD-A3F6-3641C4D057EE}']
    function checkTag: Boolean; cdecl;//Deprecated
    function closeSelector(selector: JSelector): Boolean; cdecl;//Deprecated
    function &get(option: Integer): Integer; cdecl;//Deprecated
    function isActive: Boolean; cdecl;//Deprecated
    function &set(option: Integer; optval: Integer): Boolean; cdecl;//Deprecated
  end;
  TJCtx = class(TJavaGenericImport<JCtxClass, JCtx>) end;

  JCtx_EndpointClass = interface(JObjectClass)
    ['{5ABB5E51-59C8-4886-BB4D-44495B38DFB0}']
    {class} function _Getoptions: JOptions; cdecl;
    {class} function init(socket: JSocketBase; options: JOptions): JCtx_Endpoint; cdecl;//Deprecated
    {class} property options: JOptions read _Getoptions;
  end;

  [JavaSignature('zmq/Ctx$Endpoint')]
  JCtx_Endpoint = interface(JObject)
    ['{EBE86114-D3C3-4CE3-864B-7C15E8C19B1D}']
    function _Getsocket: JSocketBase; cdecl;
    property socket: JSocketBase read _Getsocket;
  end;
  TJCtx_Endpoint = class(TJavaGenericImport<JCtx_EndpointClass, JCtx_Endpoint>) end;

  JMailboxClass = interface(JObjectClass)
    ['{71562C1F-740E-4C2A-8D06-F39E1ED42C12}']
    {class} function init(ctx: JCtx; name: JString; tid: Integer): JMailbox; cdecl;//Deprecated
    {class} procedure close; cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('zmq/Mailbox')]
  JMailbox = interface(JObject)
    ['{B82045D0-D7DF-4090-9BCF-C406A7206A8F}']
    function getFd: JSelectableChannel; cdecl;
    function recv(timeout: Int64): JCommand; cdecl;
  end;
  TJMailbox = class(TJavaGenericImport<JMailboxClass, JMailbox>) end;

  JMsgClass = interface(JObjectClass)
    ['{837EA86D-4D08-4908-BAD7-ABFB8AD8C770}']
    {class} function _GetCOMMAND: Integer; cdecl;
    {class} function _GetCREDENTIAL: Integer; cdecl;
    {class} function _GetIDENTITY: Integer; cdecl;
    {class} function _GetMORE: Integer; cdecl;
    {class} function _GetSHARED: Integer; cdecl;
    {class} function init: JMsg; cdecl; overload;//Deprecated
    {class} function init(capacity: Integer): JMsg; cdecl; overload;//Deprecated
    {class} function init(src: TJavaArray<Byte>): JMsg; cdecl; overload;//Deprecated
    {class} function init(src: JByteBuffer): JMsg; cdecl; overload;//Deprecated
    {class} function init(m: JMsg): JMsg; cdecl; overload;//Deprecated
    {class} function buf: JByteBuffer; cdecl;//Deprecated
    {class} function check: Boolean; cdecl;//Deprecated
    {class} function data: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function &get(index: Integer): Byte; cdecl; overload;//Deprecated
    {class} function getBytes(index: Integer; dst: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getBytes(index: Integer; bb: JByteBuffer; len: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getShort(offset: Integer): Integer; cdecl;//Deprecated
    {class} function hasMore: Boolean; cdecl;//Deprecated
    {class} procedure initDelimiter; cdecl;//Deprecated
    {class} function isIdentity: Boolean; cdecl;//Deprecated
    {class} function put(b: Byte): JMsg; cdecl; overload;//Deprecated
    {class} function put(src: JByteBuffer; off: Integer; len: Integer): JMsg; cdecl; overload;
    {class} function put(src: JByteBuffer): JMsg; cdecl; overload;
    {class} function putShortString(data: JString): JMsg; cdecl;
    {class} procedure setFlags(flags: Integer); cdecl;
    {class} function setMetadata(metadata: Jio_Metadata): JMsg; cdecl;
    {class} function size: Integer; cdecl;
    {class} property COMMAND: Integer read _GetCOMMAND;
    {class} property CREDENTIAL: Integer read _GetCREDENTIAL;
    {class} property IDENTITY: Integer read _GetIDENTITY;
    {class} property MORE: Integer read _GetMORE;
    {class} property SHARED: Integer read _GetSHARED;
  end;

  [JavaSignature('zmq/Msg')]
  JMsg = interface(JObject)
    ['{C75C8312-2580-457C-82FB-BCCB6F019BB9}']
    function fd: JSocketChannel; cdecl;//Deprecated
    function flags: Integer; cdecl;//Deprecated
    function &get: Byte; cdecl; overload;//Deprecated
    function getInt(offset: Integer): Integer; cdecl;//Deprecated
    function getLong(offset: Integer): Int64; cdecl;//Deprecated
    function getMetadata: Jio_Metadata; cdecl;//Deprecated
    function isCommand: Boolean; cdecl;//Deprecated
    function isCredential: Boolean; cdecl;//Deprecated
    function isDelimiter: Boolean; cdecl;//Deprecated
    function put(b: Integer): JMsg; cdecl; overload;//Deprecated
    function put(src: TJavaArray<Byte>): JMsg; cdecl; overload;//Deprecated
    function put(src: TJavaArray<Byte>; off: Integer; len: Integer): JMsg; cdecl; overload;//Deprecated
    procedure resetFlags(f: Integer); cdecl;
    procedure resetMetadata; cdecl;
    procedure setFd(fileDesc: JSocketChannel); cdecl;
    function toString: JString; cdecl;
    procedure transfer(destination: JByteBuffer; srcOffset: Integer; srcLength: Integer); cdecl;
  end;
  TJMsg = class(TJavaGenericImport<JMsgClass, JMsg>) end;

  JMsg_BuilderClass = interface(JMsgClass)
    ['{6EEBF8BF-F154-4351-9F78-C915B5453E2D}']
    {class} function init: JMsg_Builder; cdecl;//Deprecated
    {class} function putShortString(data: JString): JMsg; cdecl;
    {class} procedure setFlags(flags: Integer); cdecl;
    {class} function size: Integer; cdecl;
  end;

  [JavaSignature('zmq/Msg$Builder')]
  JMsg_Builder = interface(JMsg)
    ['{1321F0CB-003E-4A11-BF5E-667FFAFCFB62}']
    function build: JMsg; cdecl;
    function put(src: TJavaArray<Byte>; off: Integer; len: Integer): JMsg; cdecl; overload;
    function put(src: JByteBuffer; off: Integer; len: Integer): JMsg; cdecl; overload;
  end;
  TJMsg_Builder = class(TJavaGenericImport<JMsg_BuilderClass, JMsg_Builder>) end;

  JOptionsClass = interface(JObjectClass)
    ['{FB8F1C98-D135-4F00-A2CB-2D1FC118596F}']
    {class} function _GetCURVE_KEYSIZE: Integer; cdecl;
    {class} function _GetCURVE_KEYSIZE_Z85: Integer; cdecl;
    {class} function _Getaffinity: Int64; cdecl;
    {class} function _Getconflate: Boolean; cdecl;
    {class} procedure _Setconflate(Value: Boolean); cdecl;
    {class} function _GetcurvePublicKey: TJavaArray<Byte>; cdecl;
    {class} function _GetcurveSecretKey: TJavaArray<Byte>; cdecl;
    {class} function _Geterrno: JErrno; cdecl;
    {class} function _Getfilter: Boolean; cdecl;
    {class} function _GethandshakeIvl: Integer; cdecl;
    {class} procedure _SethandshakeIvl(Value: Integer); cdecl;
    {class} function _GetheartbeatTtl: Integer; cdecl;
    {class} function _Getidentity: TJavaArray<Byte>; cdecl;
    {class} procedure _Setidentity(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetidentitySize: Byte; cdecl;
    {class} procedure _SetidentitySize(Value: Byte); cdecl;
    {class} function _Getlinger: Integer; cdecl;
    {class} function _GetmaxMsgSize: Int64; cdecl;
    {class} function _Getmechanism: JMechanisms; cdecl;
    {class} procedure _Setmechanism(Value: JMechanisms); cdecl;
    {class} function _Getrcvbuf: Integer; cdecl;
    {class} function _GetreconnectIvl: Integer; cdecl;
    {class} procedure _SetreconnectIvl(Value: Integer); cdecl;
    {class} function _GetreconnectIvlMax: Integer; cdecl;
    {class} function _GetsendHwm: Integer; cdecl;
    {class} procedure _SetsendHwm(Value: Integer); cdecl;
    {class} function _Getsndbuf: Integer; cdecl;
    {class} procedure _Setsndbuf(Value: Integer); cdecl;
    {class} function _GetsocketId: Integer; cdecl;
    {class} function _GettcpKeepAliveCnt: Integer; cdecl;
    {class} procedure _SettcpKeepAliveCnt(Value: Integer); cdecl;
    {class} function _GettcpKeepAliveIdle: Integer; cdecl;
    {class} function _GettcpKeepAliveIntvl: Integer; cdecl;
    {class} procedure _SettcpKeepAliveIntvl(Value: Integer); cdecl;
    {class} function init: JOptions; cdecl;//Deprecated
    {class} function getSocketOpt(option: Integer): JObject; cdecl;
    {class} function parseBoolean(option: Integer; optval: JObject): Boolean; cdecl;
    {class} function parseBytes(option: Integer; optval: JObject): TJavaArray<Byte>; cdecl;
    {class} function parseString(option: Integer; optval: JObject): JString; cdecl;
    {class} property CURVE_KEYSIZE: Integer read _GetCURVE_KEYSIZE;
    {class} property CURVE_KEYSIZE_Z85: Integer read _GetCURVE_KEYSIZE_Z85;
    {class} property affinity: Int64 read _Getaffinity;
    {class} property conflate: Boolean read _Getconflate write _Setconflate;
    {class} property curvePublicKey: TJavaArray<Byte> read _GetcurvePublicKey;
    {class} property curveSecretKey: TJavaArray<Byte> read _GetcurveSecretKey;
    {class} property errno: JErrno read _Geterrno;
    {class} property filter: Boolean read _Getfilter;
    {class} property handshakeIvl: Integer read _GethandshakeIvl write _SethandshakeIvl;
    {class} property heartbeatTtl: Integer read _GetheartbeatTtl;
    {class} property identity: TJavaArray<Byte> read _Getidentity write _Setidentity;
    {class} property identitySize: Byte read _GetidentitySize write _SetidentitySize;
    {class} property linger: Integer read _Getlinger;
    {class} property maxMsgSize: Int64 read _GetmaxMsgSize;
    {class} property mechanism: JMechanisms read _Getmechanism write _Setmechanism;
    {class} property rcvbuf: Integer read _Getrcvbuf;
    {class} property reconnectIvl: Integer read _GetreconnectIvl write _SetreconnectIvl;
    {class} property reconnectIvlMax: Integer read _GetreconnectIvlMax;
    {class} property sendHwm: Integer read _GetsendHwm write _SetsendHwm;
    {class} property sndbuf: Integer read _Getsndbuf write _Setsndbuf;
    {class} property socketId: Integer read _GetsocketId;
    {class} property tcpKeepAliveCnt: Integer read _GettcpKeepAliveCnt write _SettcpKeepAliveCnt;
    {class} property tcpKeepAliveIdle: Integer read _GettcpKeepAliveIdle;
    {class} property tcpKeepAliveIntvl: Integer read _GettcpKeepAliveIntvl write _SettcpKeepAliveIntvl;
  end;

  [JavaSignature('zmq/Options')]
  JOptions = interface(JObject)
    ['{F1AD33AB-4C6B-4A7D-B94E-021F8F62AB2D}']
    function _Getallocator: JMsgAllocator; cdecl;
    procedure _Setallocator(Value: JMsgAllocator); cdecl;
    function _GetasServer: Boolean; cdecl;
    procedure _SetasServer(Value: Boolean); cdecl;
    function _Getbacklog: Integer; cdecl;
    function _GetcurveServerKey: TJavaArray<Byte>; cdecl;
    procedure _SetcurveServerKey(Value: TJavaArray<Byte>); cdecl;
    function _Getdecoder: Jlang_Class; cdecl;
    function _Getencoder: Jlang_Class; cdecl;
    procedure _Setencoder(Value: Jlang_Class); cdecl;
    function _GetheartbeatContext: TJavaArray<Byte>; cdecl;
    function _GetheartbeatInterval: Integer; cdecl;
    function _GetheartbeatTimeout: Integer; cdecl;
    procedure _SetheartbeatTimeout(Value: Integer); cdecl;
    function _Getimmediate: Boolean; cdecl;
    function _Getipv6: Boolean; cdecl;
    procedure _Setipv6(Value: Boolean); cdecl;
    function _GetplainPassword: JString; cdecl;
    function _GetplainUsername: JString; cdecl;
    procedure _SetplainUsername(Value: JString); cdecl;
    function _GetrawSocket: Boolean; cdecl;
    procedure _SetrawSocket(Value: Boolean); cdecl;
    function _GetrecvHwm: Integer; cdecl;
    function _GetrecvIdentity: Boolean; cdecl;
    procedure _SetrecvIdentity(Value: Boolean); cdecl;
    function _GetselectorChooser: JSelectorProviderChooser; cdecl;
    function _GetsocksProxyAddress: JString; cdecl;
    procedure _SetsocksProxyAddress(Value: JString); cdecl;
    function _GettcpAcceptFilters: JList; cdecl;
    function _GettcpKeepAlive: Integer; cdecl;
    function _Gettos: Integer; cdecl;
    procedure _Settos(Value: Integer); cdecl;
    function _Gettype: Integer; cdecl;
    function _GetzapDomain: JString; cdecl;
    procedure _SetzapDomain(Value: JString); cdecl;
    function setSocketOpt(option: Integer; optval: JObject): Boolean; cdecl;
    property allocator: JMsgAllocator read _Getallocator write _Setallocator;
    property asServer: Boolean read _GetasServer write _SetasServer;
    property backlog: Integer read _Getbacklog;
    property curveServerKey: TJavaArray<Byte> read _GetcurveServerKey write _SetcurveServerKey;
    property decoder: Jlang_Class read _Getdecoder;
    property encoder: Jlang_Class read _Getencoder write _Setencoder;
    property heartbeatContext: TJavaArray<Byte> read _GetheartbeatContext;
    property heartbeatInterval: Integer read _GetheartbeatInterval;
    property heartbeatTimeout: Integer read _GetheartbeatTimeout write _SetheartbeatTimeout;
    property immediate: Boolean read _Getimmediate;
    property ipv6: Boolean read _Getipv6 write _Setipv6;
    property plainPassword: JString read _GetplainPassword;
    property plainUsername: JString read _GetplainUsername write _SetplainUsername;
    property rawSocket: Boolean read _GetrawSocket write _SetrawSocket;
    property recvHwm: Integer read _GetrecvHwm;
    property recvIdentity: Boolean read _GetrecvIdentity write _SetrecvIdentity;
    property selectorChooser: JSelectorProviderChooser read _GetselectorChooser;
    property socksProxyAddress: JString read _GetsocksProxyAddress write _SetsocksProxyAddress;
    property tcpAcceptFilters: JList read _GettcpAcceptFilters;
    property tcpKeepAlive: Integer read _GettcpKeepAlive;
    property tos: Integer read _Gettos write _Settos;
    property &type: Integer read _Gettype;
    property zapDomain: JString read _GetzapDomain write _SetzapDomain;
  end;
  TJOptions = class(TJavaGenericImport<JOptionsClass, JOptions>) end;

  JZObjectClass = interface(JObjectClass)
    ['{C1C942A8-F969-4233-A728-3F914EFD2B5C}']
  end;

  [JavaSignature('zmq/ZObject')]
  JZObject = interface(JObject)
    ['{AF3010FE-B065-44CA-BB6D-45B7F888947C}']
    function getTid: Integer; cdecl;//Deprecated
  end;
  TJZObject = class(TJavaGenericImport<JZObjectClass, JZObject>) end;

  JOwnClass = interface(JZObjectClass)
    ['{2D10873C-9AC8-463D-8468-4062CB384D1B}']
  end;

  [JavaSignature('zmq/Own')]
  JOwn = interface(JZObject)
    ['{266DA4A4-35A0-43A0-870E-03A96D3B4E1E}']
    function _Geterrno: JErrno; cdecl;
    property errno: JErrno read _Geterrno;
  end;
  TJOwn = class(TJavaGenericImport<JOwnClass, JOwn>) end;

  JSocketBaseClass = interface(JOwnClass)
    ['{209D530F-30F9-4EAE-B6D1-688C7F0DE67E}']
    {class} function bind(addr: JString): Boolean; cdecl;//Deprecated
    {class} procedure eventAcceptFailed(addr: JString; errno: Integer); cdecl;//Deprecated
    {class} procedure eventAccepted(addr: JString; ch: JSelectableChannel); cdecl;//Deprecated
    {class} procedure eventBindFailed(addr: JString; errno: Integer); cdecl;//Deprecated
    {class} procedure eventConnectRetried(addr: JString; interval: Integer); cdecl;
    {class} procedure eventConnected(addr: JString; ch: JSelectableChannel); cdecl;
    {class} procedure eventDisconnected(addr: JString; ch: JSelectableChannel); cdecl;
    {class} function getSocketOpt(option: Integer): Integer; cdecl;
    {class} function getSocketOptx(option: Integer): JObject; cdecl;
    {class} procedure hiccuped(pipe: Jpipe_Pipe); cdecl;
    {class} procedure readActivated(pipe: Jpipe_Pipe); cdecl;
    {class} function recv(flags: Integer): JMsg; cdecl;
    {class} function send(msg: JMsg; flags: Integer): Boolean; cdecl;
    {class} function toString: JString; cdecl;
    {class} function typeString: JString; cdecl;
    {class} procedure writeActivated(pipe: Jpipe_Pipe); cdecl;
  end;

  [JavaSignature('zmq/SocketBase')]
  JSocketBase = interface(JOwn)
    ['{812E2708-7DDC-4F87-97F9-474A8A44D9DE}']
    procedure close; cdecl;//Deprecated
    function connect(addr: JString): Boolean; cdecl;//Deprecated
    function errno: Integer; cdecl;//Deprecated
    procedure eventCloseFailed(addr: JString; errno: Integer); cdecl;//Deprecated
    procedure eventClosed(addr: JString; ch: JSelectableChannel); cdecl;//Deprecated
    procedure eventConnectDelayed(addr: JString; errno: Integer); cdecl;//Deprecated
    procedure eventHandshaken(addr: JString; zmtpVersion: Integer); cdecl;
    procedure eventListening(addr: JString; ch: JSelectableChannel); cdecl;
    function getFD: JSelectableChannel; cdecl;
    procedure inEvent; cdecl;
    function monitor(addr: JString; events: Integer): Boolean; cdecl;
    procedure pipeTerminated(pipe: Jpipe_Pipe); cdecl;
    function setSocketOpt(option: Integer; optval: JObject): Boolean; cdecl;
    function termEndpoint(addr: JString): Boolean; cdecl;
  end;
  TJSocketBase = class(TJavaGenericImport<JSocketBaseClass, JSocketBase>) end;

  Jzmq_UtilsClass = interface(JObjectClass)
    ['{3AD6D325-ECA8-457F-AD11-EE5121654944}']
    {class} function bytes(buf: JByteBuffer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function delete(path: JFile): Boolean; cdecl;
    {class} function findOpenPort: Integer; cdecl;//Deprecated
    {class} function getPeerIpAddress(fd: JSocketChannel): Jnet_Address; cdecl;
    {class} function randomBytes(length: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function randomInt: Integer; cdecl;
    {class} function realloc(klass: Jlang_Class; src: TJavaObjectArray<JObject>; size: Integer; ended: Boolean): TJavaObjectArray<JObject>; cdecl; overload;//Deprecated
    {class} function realloc(src: TJavaArray<Byte>; size: Integer): TJavaArray<Byte>; cdecl; overload;
  end;

  [JavaSignature('zmq/Utils')]
  Jzmq_Utils = interface(JObject)
    ['{BCCFA76D-49B9-40A7-A60E-80BD470ABE75}']
  end;
  TJzmq_Utils = class(TJavaGenericImport<Jzmq_UtilsClass, Jzmq_Utils>) end;

  JZErrorClass = interface(JObjectClass)
    ['{1790FD4C-4247-44EE-B54B-1DE96B3A306C}']
    {class} function _GetEACCESS: Integer; cdecl;
    {class} function _GetEADDRINUSE: Integer; cdecl;
    {class} function _GetEADDRNOTAVAIL: Integer; cdecl;
    {class} function _GetEAFNOSUPPORT: Integer; cdecl;
    {class} function _GetEAGAIN: Integer; cdecl;
    {class} function _GetECONNABORTED: Integer; cdecl;
    {class} function _GetECONNREFUSED: Integer; cdecl;
    {class} function _GetECONNRESET: Integer; cdecl;
    {class} function _GetEFAULT: Integer; cdecl;
    {class} function _GetEFSM: Integer; cdecl;
    {class} function _GetEHOSTUNREACH: Integer; cdecl;
    {class} function _GetEINPROGRESS: Integer; cdecl;
    {class} function _GetEINTR: Integer; cdecl;
    {class} function _GetEINVAL: Integer; cdecl;
    {class} function _GetEIOEXC: Integer; cdecl;
    {class} function _GetEISCONN: Integer; cdecl;
    {class} function _GetEMFILE: Integer; cdecl;
    {class} function _GetEMSGSIZE: Integer; cdecl;
    {class} function _GetEMTHREAD: Integer; cdecl;
    {class} function _GetENETDOWN: Integer; cdecl;
    {class} function _GetENETRESET: Integer; cdecl;
    {class} function _GetENETUNREACH: Integer; cdecl;
    {class} function _GetENOBUFS: Integer; cdecl;
    {class} function _GetENOCOMPATPROTO: Integer; cdecl;
    {class} function _GetENOENT: Integer; cdecl;
    {class} function _GetENOTCONN: Integer; cdecl;
    {class} function _GetENOTSOCK: Integer; cdecl;
    {class} function _GetENOTSUP: Integer; cdecl;
    {class} function _GetEPROTO: Integer; cdecl;
    {class} function _GetEPROTONOSUPPORT: Integer; cdecl;
    {class} function _GetESOCKET: Integer; cdecl;
    {class} function _GetETERM: Integer; cdecl;
    {class} function _GetETIMEDOUT: Integer; cdecl;
    {class} function exccode(e: JIOException): Integer; cdecl;
    {class} function toString(code: Integer): JString; cdecl;//Deprecated
    {class} property EACCESS: Integer read _GetEACCESS;
    {class} property EADDRINUSE: Integer read _GetEADDRINUSE;
    {class} property EADDRNOTAVAIL: Integer read _GetEADDRNOTAVAIL;
    {class} property EAFNOSUPPORT: Integer read _GetEAFNOSUPPORT;
    {class} property EAGAIN: Integer read _GetEAGAIN;
    {class} property ECONNABORTED: Integer read _GetECONNABORTED;
    {class} property ECONNREFUSED: Integer read _GetECONNREFUSED;
    {class} property ECONNRESET: Integer read _GetECONNRESET;
    {class} property EFAULT: Integer read _GetEFAULT;
    {class} property EFSM: Integer read _GetEFSM;
    {class} property EHOSTUNREACH: Integer read _GetEHOSTUNREACH;
    {class} property EINPROGRESS: Integer read _GetEINPROGRESS;
    {class} property EINTR: Integer read _GetEINTR;
    {class} property EINVAL: Integer read _GetEINVAL;
    {class} property EIOEXC: Integer read _GetEIOEXC;
    {class} property EISCONN: Integer read _GetEISCONN;
    {class} property EMFILE: Integer read _GetEMFILE;
    {class} property EMSGSIZE: Integer read _GetEMSGSIZE;
    {class} property EMTHREAD: Integer read _GetEMTHREAD;
    {class} property ENETDOWN: Integer read _GetENETDOWN;
    {class} property ENETRESET: Integer read _GetENETRESET;
    {class} property ENETUNREACH: Integer read _GetENETUNREACH;
    {class} property ENOBUFS: Integer read _GetENOBUFS;
    {class} property ENOCOMPATPROTO: Integer read _GetENOCOMPATPROTO;
    {class} property ENOENT: Integer read _GetENOENT;
    {class} property ENOTCONN: Integer read _GetENOTCONN;
    {class} property ENOTSOCK: Integer read _GetENOTSOCK;
    {class} property ENOTSUP: Integer read _GetENOTSUP;
    {class} property EPROTO: Integer read _GetEPROTO;
    {class} property EPROTONOSUPPORT: Integer read _GetEPROTONOSUPPORT;
    {class} property ESOCKET: Integer read _GetESOCKET;
    {class} property ETERM: Integer read _GetETERM;
    {class} property ETIMEDOUT: Integer read _GetETIMEDOUT;
  end;

  [JavaSignature('zmq/ZError')]
  JZError = interface(JObject)
    ['{86619ECE-CB77-4043-BF2A-2F5DBC1882DD}']
  end;
  TJZError = class(TJavaGenericImport<JZErrorClass, JZError>) end;

  JZError_CtxTerminatedExceptionClass = interface(JUncheckedZMQExceptionClass)
    ['{D6B22234-7763-40AD-BCE2-AED32D388472}']
    {class} function init: JZError_CtxTerminatedException; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/ZError$CtxTerminatedException')]
  JZError_CtxTerminatedException = interface(JUncheckedZMQException)
    ['{377E232F-586C-4C30-81F9-98109BE893FF}']
  end;
  TJZError_CtxTerminatedException = class(TJavaGenericImport<JZError_CtxTerminatedExceptionClass, JZError_CtxTerminatedException>) end;

  JZError_IOExceptionClass = interface(JUncheckedZMQExceptionClass)
    ['{E087DA02-BF9C-4AC1-B7E2-3A13FEF6B2B0}']
    {class} function init(e: JIOException): JZError_IOException; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/ZError$IOException')]
  JZError_IOException = interface(JUncheckedZMQException)
    ['{BB3D919C-F071-4596-8E52-9C621A9FFDB8}']
  end;
  TJZError_IOException = class(TJavaGenericImport<JZError_IOExceptionClass, JZError_IOException>) end;

  JZError_InstantiationExceptionClass = interface(JUncheckedZMQExceptionClass)
    ['{6D2CE901-6171-44DD-B24F-BF2E9725A4F4}']
    {class} function init(cause: JThrowable): JZError_InstantiationException; cdecl; overload;//Deprecated
    {class} function init(message: JString; cause: JThrowable): JZError_InstantiationException; cdecl; overload;//Deprecated
    {class} function init(message: JString): JZError_InstantiationException; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/ZError$InstantiationException')]
  JZError_InstantiationException = interface(JUncheckedZMQException)
    ['{740CEC8A-5CB7-4A1E-84A4-18B4C13D3FFB}']
  end;
  TJZError_InstantiationException = class(TJavaGenericImport<JZError_InstantiationExceptionClass, JZError_InstantiationException>) end;

  Jzmq_ZMQClass = interface(JObjectClass)
    ['{4CF76E0E-14A7-44B6-AD8E-13441C013FF6}']
    {class} function _GetCHARSET: JCharset; cdecl;
    {class} function _GetMESSAGE_SEPARATOR: TJavaArray<Byte>; cdecl;
    {class} function _GetPROXY_PAUSE: TJavaArray<Byte>; cdecl;
    {class} function _GetPROXY_RESUME: TJavaArray<Byte>; cdecl;
    {class} function _GetPROXY_TERMINATE: TJavaArray<Byte>; cdecl;
    {class} function _GetSUBSCRIPTION_ALL: TJavaArray<Byte>; cdecl;
    {class} function _GetZMQ_AFFINITY: Integer; cdecl;
    {class} function _GetZMQ_BACKLOG: Integer; cdecl;
    {class} function _GetZMQ_BLOCKY: Integer; cdecl;
    {class} function _GetZMQ_CONFLATE: Integer; cdecl;
    {class} function _GetZMQ_CONNECT_RID: Integer; cdecl;
    {class} function _GetZMQ_CURVE_PUBLICKEY: Integer; cdecl;
    {class} function _GetZMQ_CURVE_SECRETKEY: Integer; cdecl;
    {class} function _GetZMQ_CURVE_SERVER: Integer; cdecl;
    {class} function _GetZMQ_CURVE_SERVERKEY: Integer; cdecl;
    {class} function _GetZMQ_DEALER: Integer; cdecl;
    {class} function _GetZMQ_DECODER: Integer; cdecl;
    {class} function _GetZMQ_DELAY_ATTACH_ON_CONNECT: Integer; cdecl;
    {class} function _GetZMQ_DONTWAIT: Integer; cdecl;
    {class} function _GetZMQ_ENCODER: Integer; cdecl;
    {class} function _GetZMQ_EVENTS: Integer; cdecl;
    {class} function _GetZMQ_EVENT_ACCEPTED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_ACCEPT_FAILED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_ALL: Integer; cdecl;
    {class} function _GetZMQ_EVENT_BIND_FAILED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_CLOSED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_CLOSE_FAILED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_CONNECTED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_CONNECT_DELAYED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_CONNECT_RETRIED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_DISCONNECTED: Integer; cdecl;
    {class} function _GetZMQ_EVENT_HANDSHAKE_PROTOCOL: Integer; cdecl;
    {class} function _GetZMQ_EVENT_LISTENING: Integer; cdecl;
    {class} function _GetZMQ_EVENT_MONITOR_STOPPED: Integer; cdecl;
    {class} function _GetZMQ_FAIL_UNROUTABLE: Integer; cdecl;
    {class} function _GetZMQ_FD: Integer; cdecl;
    {class} function _GetZMQ_FORWARDER: Integer; cdecl;
    {class} function _GetZMQ_GSSAPI_PLAINTEXT: Integer; cdecl;
    {class} function _GetZMQ_GSSAPI_PRINCIPAL: Integer; cdecl;
    {class} function _GetZMQ_GSSAPI_SERVER: Integer; cdecl;
    {class} function _GetZMQ_GSSAPI_SERVICE_PRINCIPAL: Integer; cdecl;
    {class} function _GetZMQ_HANDSHAKE_IVL: Integer; cdecl;
    {class} function _GetZMQ_HEARTBEAT_CONTEXT: Integer; cdecl;
    {class} function _GetZMQ_HEARTBEAT_IVL: Integer; cdecl;
    {class} function _GetZMQ_HEARTBEAT_TIMEOUT: Integer; cdecl;
    {class} function _GetZMQ_HEARTBEAT_TTL: Integer; cdecl;
    {class} function _GetZMQ_IDENTITY: Integer; cdecl;
    {class} function _GetZMQ_IMMEDIATE: Integer; cdecl;
    {class} function _GetZMQ_IO_THREADS: Integer; cdecl;
    {class} function _GetZMQ_IO_THREADS_DFLT: Integer; cdecl;
    {class} function _GetZMQ_IPV4ONLY: Integer; cdecl;
    {class} function _GetZMQ_IPV6: Integer; cdecl;
    {class} function _GetZMQ_LAST_ENDPOINT: Integer; cdecl;
    {class} function _GetZMQ_LINGER: Integer; cdecl;
    {class} function _GetZMQ_MAXMSGSIZE: Integer; cdecl;
    {class} function _GetZMQ_MAX_SOCKETS: Integer; cdecl;
    {class} function _GetZMQ_MAX_SOCKETS_DFLT: Integer; cdecl;
    {class} function _GetZMQ_MECHANISM: Integer; cdecl;
    {class} function _GetZMQ_MORE: Integer; cdecl;
    {class} function _GetZMQ_MSG_ALLOCATION_HEAP_THRESHOLD: Integer; cdecl;
    {class} function _GetZMQ_MSG_ALLOCATOR: Integer; cdecl;
    {class} function _GetZMQ_MULTICAST_HOPS: Integer; cdecl;
    {class} function _GetZMQ_NOBLOCK: Integer; cdecl;
    {class} function _GetZMQ_PAIR: Integer; cdecl;
    {class} function _GetZMQ_PLAIN_PASSWORD: Integer; cdecl;
    {class} function _GetZMQ_PLAIN_SERVER: Integer; cdecl;
    {class} function _GetZMQ_PLAIN_USERNAME: Integer; cdecl;
    {class} function _GetZMQ_POLLERR: Integer; cdecl;
    {class} function _GetZMQ_POLLIN: Integer; cdecl;
    {class} function _GetZMQ_POLLOUT: Integer; cdecl;
    {class} function _GetZMQ_PROBE_ROUTER: Integer; cdecl;
    {class} function _GetZMQ_PUB: Integer; cdecl;
    {class} function _GetZMQ_PULL: Integer; cdecl;
    {class} function _GetZMQ_PUSH: Integer; cdecl;
    {class} function _GetZMQ_QUEUE: Integer; cdecl;
    {class} function _GetZMQ_RATE: Integer; cdecl;
    {class} function _GetZMQ_RCVBUF: Integer; cdecl;
    {class} function _GetZMQ_RCVHWM: Integer; cdecl;
    {class} function _GetZMQ_RCVMORE: Integer; cdecl;
    {class} function _GetZMQ_RCVTIMEO: Integer; cdecl;
    {class} function _GetZMQ_RECONNECT_IVL: Integer; cdecl;
    {class} function _GetZMQ_RECONNECT_IVL_MAX: Integer; cdecl;
    {class} function _GetZMQ_RECOVERY_IVL: Integer; cdecl;
    {class} function _GetZMQ_REP: Integer; cdecl;
    {class} function _GetZMQ_REQ: Integer; cdecl;
    {class} function _GetZMQ_REQ_CORRELATE: Integer; cdecl;
    {class} function _GetZMQ_REQ_RELAXED: Integer; cdecl;
    {class} function _GetZMQ_ROUTER: Integer; cdecl;
    {class} function _GetZMQ_ROUTER_BEHAVIOR: Integer; cdecl;
    {class} function _GetZMQ_ROUTER_HANDOVER: Integer; cdecl;
    {class} function _GetZMQ_ROUTER_MANDATORY: Integer; cdecl;
    {class} function _GetZMQ_ROUTER_RAW: Integer; cdecl;
    {class} function _GetZMQ_SELECTOR_PROVIDERCHOOSER: Integer; cdecl;
    {class} function _GetZMQ_SNDBUF: Integer; cdecl;
    {class} function _GetZMQ_SNDHWM: Integer; cdecl;
    {class} function _GetZMQ_SNDMORE: Integer; cdecl;
    {class} function _GetZMQ_SNDTIMEO: Integer; cdecl;
    {class} function _GetZMQ_SOCKS_PROXY: Integer; cdecl;
    {class} function _GetZMQ_STREAM: Integer; cdecl;
    {class} function _GetZMQ_STREAMER: Integer; cdecl;
    {class} function _GetZMQ_SUB: Integer; cdecl;
    {class} function _GetZMQ_SUBSCRIBE: Integer; cdecl;
    {class} function _GetZMQ_TCP_ACCEPT_FILTER: Integer; cdecl;
    {class} function _GetZMQ_TCP_KEEPALIVE: Integer; cdecl;
    {class} function _GetZMQ_TCP_KEEPALIVE_CNT: Integer; cdecl;
    {class} function _GetZMQ_TCP_KEEPALIVE_IDLE: Integer; cdecl;
    {class} function _GetZMQ_TCP_KEEPALIVE_INTVL: Integer; cdecl;
    {class} function _GetZMQ_TOS: Integer; cdecl;
    {class} function _GetZMQ_TYPE: Integer; cdecl;
    {class} function _GetZMQ_UNSUBSCRIBE: Integer; cdecl;
    {class} function _GetZMQ_VERSION_MAJOR: Integer; cdecl;
    {class} function _GetZMQ_VERSION_MINOR: Integer; cdecl;
    {class} function _GetZMQ_VERSION_PATCH: Integer; cdecl;
    {class} function _GetZMQ_XPUB: Integer; cdecl;
    {class} function _GetZMQ_XPUB_MANUAL: Integer; cdecl;
    {class} function _GetZMQ_XPUB_NODROP: Integer; cdecl;
    {class} function _GetZMQ_XPUB_VERBOSE: Integer; cdecl;
    {class} function _GetZMQ_XPUB_VERBOSER: Integer; cdecl;
    {class} function _GetZMQ_XPUB_VERBOSE_UNSUBSCRIBE: Integer; cdecl;
    {class} function _GetZMQ_XREP: Integer; cdecl;
    {class} function _GetZMQ_XREQ: Integer; cdecl;
    {class} function _GetZMQ_XSUB: Integer; cdecl;
    {class} function _GetZMQ_ZAP_DOMAIN: Integer; cdecl;
    {class} function init: Jzmq_ZMQ; cdecl; overload;//Deprecated
    {class} function bind(s: JSocketBase; addr: JString): Boolean; cdecl;//Deprecated
    {class} procedure close(s: JSocketBase); cdecl;//Deprecated
    {class} procedure closeZeroLinger(s: JSocketBase); cdecl;
    {class} function connect(s: JSocketBase; addr: JString): Boolean; cdecl;
    {class} function createContext: JCtx; cdecl;
    {class} function device(device: Integer; frontend: JSocketBase; backend: JSocketBase): Boolean; cdecl;
    {class} function disconnect(s: JSocketBase; addr: JString): Boolean; cdecl;//Deprecated
    {class} function getContextOption(ctx: JCtx; option: Integer): Integer; cdecl;//Deprecated
    {class} function getMessageMetadata(msg: JMsg; property_: JString): JString; cdecl;//Deprecated
    {class} function getMessageOption(msg: JMsg; option: Integer): Integer; cdecl;//Deprecated
    {class} function getSocketOption(s: JSocketBase; opt: Integer): Integer; cdecl;//Deprecated
    {class} function getSocketOptionExt(s: JSocketBase; option: Integer): JObject; cdecl;//Deprecated
    {class} function makeVersion(major: Integer; minor: Integer; patch: Integer): Integer; cdecl;//Deprecated
    {class} function monitorSocket(s: JSocketBase; addr: JString; events: Integer): Boolean; cdecl;//Deprecated
    {class} function msgInit: JMsg; cdecl;//Deprecated
    {class} function msgInitWithSize(messageSize: Integer): JMsg; cdecl;//Deprecated
    {class} function msgSize(msg: JMsg): Integer; cdecl;//Deprecated
    {class} procedure msleep(milliseconds: Int64); cdecl;//Deprecated
    {class} function poll(selector: JSelector; items: TJavaObjectArray<JPollItem>; timeout: Int64): Integer; cdecl; overload;//Deprecated
    {class} function poll(selector: JSelector; items: TJavaObjectArray<JPollItem>; count: Integer; timeout: Int64): Integer; cdecl; overload;//Deprecated
    {class} function proxy(frontend: JSocketBase; backend: JSocketBase; capture: JSocketBase): Boolean; cdecl; overload;//Deprecated
    {class} function proxy(frontend: JSocketBase; backend: JSocketBase; capture: JSocketBase; control: JSocketBase): Boolean; cdecl; overload;//Deprecated
    {class} function recv(s: JSocketBase; flags: Integer): JMsg; cdecl;//Deprecated
    {class} function recvMsg(s: JSocketBase; flags: Integer): JMsg; cdecl;//Deprecated
    {class} function send(s: JSocketBase; str: JString; flags: Integer): Integer; cdecl; overload;//Deprecated
    {class} function send(s: JSocketBase; msg: JMsg; flags: Integer): Integer; cdecl; overload;
    {class} function send(s: JSocketBase; buf: TJavaArray<Byte>; flags: Integer): Integer; cdecl; overload;
    {class} function send(s: JSocketBase; buf: TJavaArray<Byte>; len: Integer; flags: Integer): Integer; cdecl; overload;
    {class} function sendMsg(s: JSocketBase; msg: JMsg; flags: Integer): Integer; cdecl; overload;
    {class} function sendiov(s: JSocketBase; a: TJavaBiArray<Byte>; count: Integer; flags: Integer): Integer; cdecl;
    {class} procedure setContextOption(ctx: JCtx; option: Integer; optval: Integer); cdecl;
    {class} function setSocketOption(s: JSocketBase; option: Integer; optval: JObject): Boolean; cdecl;
    {class} procedure sleep(seconds: Int64); cdecl; overload;
    {class} procedure sleep(amount: Int64; unit_: JTimeUnit); cdecl; overload;
    {class} function socket(ctx: JCtx; type_: Integer): JSocketBase; cdecl;
    {class} function startStopwatch: Int64; cdecl;
    {class} function stopStopwatch(watch: Int64): Int64; cdecl;
    {class} function strerror(errno: Integer): JString; cdecl;
    {class} procedure term(ctx: JCtx); cdecl;
    {class} function unbind(s: JSocketBase; addr: JString): Boolean; cdecl;
    {class} property CHARSET: JCharset read _GetCHARSET;
    {class} property MESSAGE_SEPARATOR: TJavaArray<Byte> read _GetMESSAGE_SEPARATOR;
    {class} property PROXY_PAUSE: TJavaArray<Byte> read _GetPROXY_PAUSE;
    {class} property PROXY_RESUME: TJavaArray<Byte> read _GetPROXY_RESUME;
    {class} property PROXY_TERMINATE: TJavaArray<Byte> read _GetPROXY_TERMINATE;
    {class} property SUBSCRIPTION_ALL: TJavaArray<Byte> read _GetSUBSCRIPTION_ALL;
    {class} property ZMQ_AFFINITY: Integer read _GetZMQ_AFFINITY;
    {class} property ZMQ_BACKLOG: Integer read _GetZMQ_BACKLOG;
    {class} property ZMQ_BLOCKY: Integer read _GetZMQ_BLOCKY;
    {class} property ZMQ_CONFLATE: Integer read _GetZMQ_CONFLATE;
    {class} property ZMQ_CONNECT_RID: Integer read _GetZMQ_CONNECT_RID;
    {class} property ZMQ_CURVE_PUBLICKEY: Integer read _GetZMQ_CURVE_PUBLICKEY;
    {class} property ZMQ_CURVE_SECRETKEY: Integer read _GetZMQ_CURVE_SECRETKEY;
    {class} property ZMQ_CURVE_SERVER: Integer read _GetZMQ_CURVE_SERVER;
    {class} property ZMQ_CURVE_SERVERKEY: Integer read _GetZMQ_CURVE_SERVERKEY;
    {class} property ZMQ_DEALER: Integer read _GetZMQ_DEALER;
    {class} property ZMQ_DECODER: Integer read _GetZMQ_DECODER;
    {class} property ZMQ_DELAY_ATTACH_ON_CONNECT: Integer read _GetZMQ_DELAY_ATTACH_ON_CONNECT;
    {class} property ZMQ_DONTWAIT: Integer read _GetZMQ_DONTWAIT;
    {class} property ZMQ_ENCODER: Integer read _GetZMQ_ENCODER;
    {class} property ZMQ_EVENTS: Integer read _GetZMQ_EVENTS;
    {class} property ZMQ_EVENT_ACCEPTED: Integer read _GetZMQ_EVENT_ACCEPTED;
    {class} property ZMQ_EVENT_ACCEPT_FAILED: Integer read _GetZMQ_EVENT_ACCEPT_FAILED;
    {class} property ZMQ_EVENT_ALL: Integer read _GetZMQ_EVENT_ALL;
    {class} property ZMQ_EVENT_BIND_FAILED: Integer read _GetZMQ_EVENT_BIND_FAILED;
    {class} property ZMQ_EVENT_CLOSED: Integer read _GetZMQ_EVENT_CLOSED;
    {class} property ZMQ_EVENT_CLOSE_FAILED: Integer read _GetZMQ_EVENT_CLOSE_FAILED;
    {class} property ZMQ_EVENT_CONNECTED: Integer read _GetZMQ_EVENT_CONNECTED;
    {class} property ZMQ_EVENT_CONNECT_DELAYED: Integer read _GetZMQ_EVENT_CONNECT_DELAYED;
    {class} property ZMQ_EVENT_CONNECT_RETRIED: Integer read _GetZMQ_EVENT_CONNECT_RETRIED;
    {class} property ZMQ_EVENT_DISCONNECTED: Integer read _GetZMQ_EVENT_DISCONNECTED;
    {class} property ZMQ_EVENT_HANDSHAKE_PROTOCOL: Integer read _GetZMQ_EVENT_HANDSHAKE_PROTOCOL;
    {class} property ZMQ_EVENT_LISTENING: Integer read _GetZMQ_EVENT_LISTENING;
    {class} property ZMQ_EVENT_MONITOR_STOPPED: Integer read _GetZMQ_EVENT_MONITOR_STOPPED;
    {class} property ZMQ_FAIL_UNROUTABLE: Integer read _GetZMQ_FAIL_UNROUTABLE;
    {class} property ZMQ_FD: Integer read _GetZMQ_FD;
    {class} property ZMQ_FORWARDER: Integer read _GetZMQ_FORWARDER;
    {class} property ZMQ_GSSAPI_PLAINTEXT: Integer read _GetZMQ_GSSAPI_PLAINTEXT;
    {class} property ZMQ_GSSAPI_PRINCIPAL: Integer read _GetZMQ_GSSAPI_PRINCIPAL;
    {class} property ZMQ_GSSAPI_SERVER: Integer read _GetZMQ_GSSAPI_SERVER;
    {class} property ZMQ_GSSAPI_SERVICE_PRINCIPAL: Integer read _GetZMQ_GSSAPI_SERVICE_PRINCIPAL;
    {class} property ZMQ_HANDSHAKE_IVL: Integer read _GetZMQ_HANDSHAKE_IVL;
    {class} property ZMQ_HEARTBEAT_CONTEXT: Integer read _GetZMQ_HEARTBEAT_CONTEXT;
    {class} property ZMQ_HEARTBEAT_IVL: Integer read _GetZMQ_HEARTBEAT_IVL;
    {class} property ZMQ_HEARTBEAT_TIMEOUT: Integer read _GetZMQ_HEARTBEAT_TIMEOUT;
    {class} property ZMQ_HEARTBEAT_TTL: Integer read _GetZMQ_HEARTBEAT_TTL;
    {class} property ZMQ_IDENTITY: Integer read _GetZMQ_IDENTITY;
    {class} property ZMQ_IMMEDIATE: Integer read _GetZMQ_IMMEDIATE;
    {class} property ZMQ_IO_THREADS: Integer read _GetZMQ_IO_THREADS;
    {class} property ZMQ_IO_THREADS_DFLT: Integer read _GetZMQ_IO_THREADS_DFLT;
    {class} property ZMQ_IPV4ONLY: Integer read _GetZMQ_IPV4ONLY;
    {class} property ZMQ_IPV6: Integer read _GetZMQ_IPV6;
    {class} property ZMQ_LAST_ENDPOINT: Integer read _GetZMQ_LAST_ENDPOINT;
    {class} property ZMQ_LINGER: Integer read _GetZMQ_LINGER;
    {class} property ZMQ_MAXMSGSIZE: Integer read _GetZMQ_MAXMSGSIZE;
    {class} property ZMQ_MAX_SOCKETS: Integer read _GetZMQ_MAX_SOCKETS;
    {class} property ZMQ_MAX_SOCKETS_DFLT: Integer read _GetZMQ_MAX_SOCKETS_DFLT;
    {class} property ZMQ_MECHANISM: Integer read _GetZMQ_MECHANISM;
    {class} property ZMQ_MORE: Integer read _GetZMQ_MORE;
    {class} property ZMQ_MSG_ALLOCATION_HEAP_THRESHOLD: Integer read _GetZMQ_MSG_ALLOCATION_HEAP_THRESHOLD;
    {class} property ZMQ_MSG_ALLOCATOR: Integer read _GetZMQ_MSG_ALLOCATOR;
    {class} property ZMQ_MULTICAST_HOPS: Integer read _GetZMQ_MULTICAST_HOPS;
    {class} property ZMQ_NOBLOCK: Integer read _GetZMQ_NOBLOCK;
    {class} property ZMQ_PAIR: Integer read _GetZMQ_PAIR;
    {class} property ZMQ_PLAIN_PASSWORD: Integer read _GetZMQ_PLAIN_PASSWORD;
    {class} property ZMQ_PLAIN_SERVER: Integer read _GetZMQ_PLAIN_SERVER;
    {class} property ZMQ_PLAIN_USERNAME: Integer read _GetZMQ_PLAIN_USERNAME;
    {class} property ZMQ_POLLERR: Integer read _GetZMQ_POLLERR;
    {class} property ZMQ_POLLIN: Integer read _GetZMQ_POLLIN;
    {class} property ZMQ_POLLOUT: Integer read _GetZMQ_POLLOUT;
    {class} property ZMQ_PROBE_ROUTER: Integer read _GetZMQ_PROBE_ROUTER;
    {class} property ZMQ_PUB: Integer read _GetZMQ_PUB;
    {class} property ZMQ_PULL: Integer read _GetZMQ_PULL;
    {class} property ZMQ_PUSH: Integer read _GetZMQ_PUSH;
    {class} property ZMQ_QUEUE: Integer read _GetZMQ_QUEUE;
    {class} property ZMQ_RATE: Integer read _GetZMQ_RATE;
    {class} property ZMQ_RCVBUF: Integer read _GetZMQ_RCVBUF;
    {class} property ZMQ_RCVHWM: Integer read _GetZMQ_RCVHWM;
    {class} property ZMQ_RCVMORE: Integer read _GetZMQ_RCVMORE;
    {class} property ZMQ_RCVTIMEO: Integer read _GetZMQ_RCVTIMEO;
    {class} property ZMQ_RECONNECT_IVL: Integer read _GetZMQ_RECONNECT_IVL;
    {class} property ZMQ_RECONNECT_IVL_MAX: Integer read _GetZMQ_RECONNECT_IVL_MAX;
    {class} property ZMQ_RECOVERY_IVL: Integer read _GetZMQ_RECOVERY_IVL;
    {class} property ZMQ_REP: Integer read _GetZMQ_REP;
    {class} property ZMQ_REQ: Integer read _GetZMQ_REQ;
    {class} property ZMQ_REQ_CORRELATE: Integer read _GetZMQ_REQ_CORRELATE;
    {class} property ZMQ_REQ_RELAXED: Integer read _GetZMQ_REQ_RELAXED;
    {class} property ZMQ_ROUTER: Integer read _GetZMQ_ROUTER;
    {class} property ZMQ_ROUTER_BEHAVIOR: Integer read _GetZMQ_ROUTER_BEHAVIOR;
    {class} property ZMQ_ROUTER_HANDOVER: Integer read _GetZMQ_ROUTER_HANDOVER;
    {class} property ZMQ_ROUTER_MANDATORY: Integer read _GetZMQ_ROUTER_MANDATORY;
    {class} property ZMQ_ROUTER_RAW: Integer read _GetZMQ_ROUTER_RAW;
    {class} property ZMQ_SELECTOR_PROVIDERCHOOSER: Integer read _GetZMQ_SELECTOR_PROVIDERCHOOSER;
    {class} property ZMQ_SNDBUF: Integer read _GetZMQ_SNDBUF;
    {class} property ZMQ_SNDHWM: Integer read _GetZMQ_SNDHWM;
    {class} property ZMQ_SNDMORE: Integer read _GetZMQ_SNDMORE;
    {class} property ZMQ_SNDTIMEO: Integer read _GetZMQ_SNDTIMEO;
    {class} property ZMQ_SOCKS_PROXY: Integer read _GetZMQ_SOCKS_PROXY;
    {class} property ZMQ_STREAM: Integer read _GetZMQ_STREAM;
    {class} property ZMQ_STREAMER: Integer read _GetZMQ_STREAMER;
    {class} property ZMQ_SUB: Integer read _GetZMQ_SUB;
    {class} property ZMQ_SUBSCRIBE: Integer read _GetZMQ_SUBSCRIBE;
    {class} property ZMQ_TCP_ACCEPT_FILTER: Integer read _GetZMQ_TCP_ACCEPT_FILTER;
    {class} property ZMQ_TCP_KEEPALIVE: Integer read _GetZMQ_TCP_KEEPALIVE;
    {class} property ZMQ_TCP_KEEPALIVE_CNT: Integer read _GetZMQ_TCP_KEEPALIVE_CNT;
    {class} property ZMQ_TCP_KEEPALIVE_IDLE: Integer read _GetZMQ_TCP_KEEPALIVE_IDLE;
    {class} property ZMQ_TCP_KEEPALIVE_INTVL: Integer read _GetZMQ_TCP_KEEPALIVE_INTVL;
    {class} property ZMQ_TOS: Integer read _GetZMQ_TOS;
    {class} property ZMQ_TYPE: Integer read _GetZMQ_TYPE;
    {class} property ZMQ_UNSUBSCRIBE: Integer read _GetZMQ_UNSUBSCRIBE;
    {class} property ZMQ_VERSION_MAJOR: Integer read _GetZMQ_VERSION_MAJOR;
    {class} property ZMQ_VERSION_MINOR: Integer read _GetZMQ_VERSION_MINOR;
    {class} property ZMQ_VERSION_PATCH: Integer read _GetZMQ_VERSION_PATCH;
    {class} property ZMQ_XPUB: Integer read _GetZMQ_XPUB;
    {class} property ZMQ_XPUB_MANUAL: Integer read _GetZMQ_XPUB_MANUAL;
    {class} property ZMQ_XPUB_NODROP: Integer read _GetZMQ_XPUB_NODROP;
    {class} property ZMQ_XPUB_VERBOSE: Integer read _GetZMQ_XPUB_VERBOSE;
    {class} property ZMQ_XPUB_VERBOSER: Integer read _GetZMQ_XPUB_VERBOSER;
    {class} property ZMQ_XPUB_VERBOSE_UNSUBSCRIBE: Integer read _GetZMQ_XPUB_VERBOSE_UNSUBSCRIBE;
    {class} property ZMQ_XREP: Integer read _GetZMQ_XREP;
    {class} property ZMQ_XREQ: Integer read _GetZMQ_XREQ;
    {class} property ZMQ_XSUB: Integer read _GetZMQ_XSUB;
    {class} property ZMQ_ZAP_DOMAIN: Integer read _GetZMQ_ZAP_DOMAIN;
  end;

  [JavaSignature('zmq/ZMQ')]
  Jzmq_ZMQ = interface(JObject)
    ['{B1A6C2B8-B74C-4CAF-9FC3-4FBDF8A3B74D}']
    function recviov(s: JSocketBase; a: TJavaBiArray<Byte>; count: Integer; flags: Integer): Integer; cdecl;//Deprecated
  end;
  TJzmq_ZMQ = class(TJavaGenericImport<Jzmq_ZMQClass, Jzmq_ZMQ>) end;

  Jzmq_ZMQ_EventClass = interface(JObjectClass)
    ['{92D6734B-AD2C-4103-82FE-FE6CB0193F13}']
    {class} function _Getarg: JObject; cdecl;
    {class} function init(event: Integer; addr: JString; arg: JObject): Jzmq_ZMQ_Event; cdecl;//Deprecated
    {class} function read(s: JSocketBase; flags: Integer): Jzmq_ZMQ_Event; cdecl; overload;
    {class} function read(s: JSocketBase): Jzmq_ZMQ_Event; cdecl; overload;//Deprecated
    {class} property arg: JObject read _Getarg;
  end;

  [JavaSignature('zmq/ZMQ$Event')]
  Jzmq_ZMQ_Event = interface(JObject)
    ['{82F274B2-1914-4B83-A95F-7CA59CE30CD8}']
    function _Getaddr: JString; cdecl;
    function _Getevent: Integer; cdecl;
    function write(s: JSocketBase): Boolean; cdecl;
    property addr: JString read _Getaddr;
    property event: Integer read _Getevent;
  end;
  TJzmq_ZMQ_Event = class(TJavaGenericImport<Jzmq_ZMQ_EventClass, Jzmq_ZMQ_Event>) end;

  JEngineNotImplementedClass = interface(JObjectClass)
    ['{44034AC3-AB90-49F1-B08A-05462A45B8CD}']
    {class} function init: JEngineNotImplemented; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/EngineNotImplemented')]
  JEngineNotImplemented = interface(JObject)
    ['{DD423677-A258-4636-934A-2D3E82816BF9}']
    procedure plug(ioThread: JIOThread; session: JSessionBase); cdecl;
    procedure restartInput; cdecl;
    procedure restartOutput; cdecl;
    procedure terminate; cdecl;
    procedure zapMsgAvailable; cdecl;
  end;
  TJEngineNotImplemented = class(TJavaGenericImport<JEngineNotImplementedClass, JEngineNotImplemented>) end;

  JIEngineClass = interface(IJavaClass)
    ['{9E818E3C-953C-4BF0-B920-AF5FAF3FDADC}']
    {class} procedure plug(ioThread: JIOThread; session: JSessionBase); cdecl;//Deprecated
    {class} procedure zapMsgAvailable; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/IEngine')]
  JIEngine = interface(IJavaInstance)
    ['{90E6F1D6-8630-4EC9-AB2A-B057A51B9006}']
    procedure restartInput; cdecl;//Deprecated
    procedure restartOutput; cdecl;//Deprecated
    procedure terminate; cdecl;//Deprecated
  end;
  TJIEngine = class(TJavaGenericImport<JIEngineClass, JIEngine>) end;

  JIOObjectClass = interface(JObjectClass)
    ['{E5DCB677-97E6-453E-9EFF-B48DAAA2879D}']
    {class} function init(ioThread: JIOThread; handler: JIPollEvents): JIOObject; cdecl;//Deprecated
    {class} function addFd(fd: JSelectableChannel): JPoller_Handle; cdecl;//Deprecated
    {class} procedure addTimer(timeout: Int64; id: Integer); cdecl;//Deprecated
    {class} procedure cancelTimer(id: Integer); cdecl;//Deprecated
    {class} procedure plug; cdecl;//Deprecated
    {class} procedure removeHandle(handle: JPoller_Handle); cdecl;//Deprecated
    {class} procedure resetPollIn(handle: JPoller_Handle); cdecl;//Deprecated
    {class} procedure setPollConnect(handle: JPoller_Handle); cdecl;
    {class} procedure setPollIn(handle: JPoller_Handle); cdecl;
    {class} procedure setPollOut(handle: JPoller_Handle); cdecl;
  end;

  [JavaSignature('zmq/io/IOObject')]
  JIOObject = interface(JObject)
    ['{4EEBFC56-9497-4FEE-811B-6A229C4A2F33}']
    procedure acceptEvent; cdecl;//Deprecated
    procedure connectEvent; cdecl;//Deprecated
    procedure inEvent; cdecl;//Deprecated
    procedure outEvent; cdecl;//Deprecated
    procedure resetPollOut(handle: JPoller_Handle); cdecl;//Deprecated
    procedure setPollAccept(handle: JPoller_Handle); cdecl;//Deprecated
    procedure timerEvent(id: Integer); cdecl;
    function toString: JString; cdecl;
    procedure unplug; cdecl;
  end;
  TJIOObject = class(TJavaGenericImport<JIOObjectClass, JIOObject>) end;

  JIOThreadClass = interface(JZObjectClass)
    ['{30C854C1-8801-4997-B444-744BD25A7C39}']
    {class} function init(ctx: JCtx; tid: Integer): JIOThread; cdecl;//Deprecated
    {class} procedure close; cdecl;
    {class} function getMailbox: JMailbox; cdecl;
    {class} procedure start; cdecl;
  end;

  [JavaSignature('zmq/io/IOThread')]
  JIOThread = interface(JZObject)
    ['{CC3FE975-AA68-4ED0-8785-578ED0500C82}']
    function getLoad: Integer; cdecl;
    procedure inEvent; cdecl;
    procedure stop; cdecl;
  end;
  TJIOThread = class(TJavaGenericImport<JIOThreadClass, JIOThread>) end;

  Jio_MetadataClass = interface(JObjectClass)
    ['{A2B26DE1-BD67-4356-A57C-6D654C8B63AD}']
    {class} function _GetIDENTITY: JString; cdecl;
    {class} function _GetPEER_ADDRESS: JString; cdecl;
    {class} function _GetSOCKET_TYPE: JString; cdecl;
    {class} function _GetUSER_ID: JString; cdecl;
    {class} function init: Jio_Metadata; cdecl; overload;//Deprecated
    {class} function init(dictionary: JProperties): Jio_Metadata; cdecl; overload;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} function isEmpty: Boolean; cdecl;//Deprecated
    {class} function keySet: JSet; cdecl;//Deprecated
    {class} function read(msg: JMsg; offset: Integer; listener: JMetadata_ParseListener): Integer; cdecl; overload;//Deprecated
    {class} procedure remove(key: JString); cdecl;//Deprecated
    {class} property IDENTITY: JString read _GetIDENTITY;
    {class} property PEER_ADDRESS: JString read _GetPEER_ADDRESS;
    {class} property SOCKET_TYPE: JString read _GetSOCKET_TYPE;
    {class} property USER_ID: JString read _GetUSER_ID;
  end;

  [JavaSignature('zmq/io/Metadata')]
  Jio_Metadata = interface(JObject)
    ['{F7DB29CF-CC07-4FF4-8821-0BC09871BA48}']
    function bytes: TJavaArray<Byte>; cdecl;//Deprecated
    function equals(other: JObject): Boolean; cdecl;//Deprecated
    function &get(key: JString): JString; cdecl;//Deprecated
    function read(msg: JByteBuffer; offset: Integer; listener: JMetadata_ParseListener): Integer; cdecl; overload;//Deprecated
    procedure &set(key: JString; value: JString); cdecl; overload;//Deprecated
    procedure &set(zapProperties: Jio_Metadata); cdecl; overload;//Deprecated
    function toString: JString; cdecl;//Deprecated
    procedure write(stream: JOutputStream); cdecl;//Deprecated
  end;
  TJio_Metadata = class(TJavaGenericImport<Jio_MetadataClass, Jio_Metadata>) end;

  JMetadata_ParseListenerClass = interface(IJavaClass)
    ['{27810FAB-9357-4C7D-8815-33BE1A26BA56}']
  end;

  [JavaSignature('zmq/io/Metadata$ParseListener')]
  JMetadata_ParseListener = interface(IJavaInstance)
    ['{12699743-D7C1-49FB-B7E5-479CAAD40BCA}']
    function parsed(name: JString; value: TJavaArray<Byte>; valueAsString: JString): Integer; cdecl;
  end;
  TJMetadata_ParseListener = class(TJavaGenericImport<JMetadata_ParseListenerClass, JMetadata_ParseListener>) end;

  JMsgsClass = interface(JObjectClass)
    ['{22B200D7-1F0C-4D8E-8AE6-E73721144DED}']
    {class} function startsWith(msg: JMsg; data: JString; includeLength: Boolean): Boolean; cdecl;
  end;

  [JavaSignature('zmq/io/Msgs')]
  JMsgs = interface(JObject)
    ['{509F1875-79BE-40CC-A8F7-72EE28F9E0CD}']
  end;
  TJMsgs = class(TJavaGenericImport<JMsgsClass, JMsgs>) end;

  JSessionBaseClass = interface(JOwnClass)
    ['{B4AD44D0-F9AD-49C3-9913-5723D6A51790}']
    {class} function init(ioThread: JIOThread; connect: Boolean; socket: JSocketBase; options: JOptions; addr: Jnet_Address): JSessionBase; cdecl;//Deprecated
    {class} procedure flush; cdecl;
    {class} function getSocket: JSocketBase; cdecl;
    {class} procedure hiccuped(pipe: Jpipe_Pipe); cdecl;
    {class} procedure incSeqnum; cdecl;
    {class} procedure pipeTerminated(pipe: Jpipe_Pipe); cdecl;
    {class} procedure readActivated(pipe: Jpipe_Pipe); cdecl;
    {class} function writeZapMsg(msg: JMsg): Boolean; cdecl;
    {class} function zapConnect: Integer; cdecl;
  end;

  [JavaSignature('zmq/io/SessionBase')]
  JSessionBase = interface(JOwn)
    ['{07A06548-A9AA-444E-9E45-5DD39363DE84}']
    procedure attachPipe(pipe: Jpipe_Pipe); cdecl;
    procedure destroy; cdecl;
    procedure engineError(reason: JStreamEngine_ErrorReason); cdecl;
    function readZapMsg: JMsg; cdecl;
    procedure timerEvent(id: Integer); cdecl;
    function toString: JString; cdecl;
    procedure writeActivated(pipe: Jpipe_Pipe); cdecl;
  end;
  TJSessionBase = class(TJavaGenericImport<JSessionBaseClass, JSessionBase>) end;

  JStreamEngineClass = interface(JObjectClass)
    ['{32804755-BD31-436F-99D5-11697E838FE7}']
    {class} function init(fd: JSocketChannel; options: JOptions; endpoint: JString): JStreamEngine; cdecl;//Deprecated
    {class} procedure outEvent; cdecl;//Deprecated
    {class} procedure plug(ioThread: JIOThread; session: JSessionBase); cdecl;//Deprecated
    {class} procedure restartInput; cdecl;//Deprecated
    {class} procedure restartOutput; cdecl;//Deprecated
    {class} procedure zapMsgAvailable; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/StreamEngine')]
  JStreamEngine = interface(JObject)
    ['{E12463F5-AF9F-48EA-9FC5-83C5B3A64B26}']
    procedure destroy; cdecl;
    procedure inEvent; cdecl;
    procedure terminate; cdecl;//Deprecated
    procedure timerEvent(id: Integer); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJStreamEngine = class(TJavaGenericImport<JStreamEngineClass, JStreamEngine>) end;

  JStreamEngine_ErrorReasonClass = interface(JEnumClass)
    ['{4325C585-0228-4776-B650-7ACE6EDCDF3F}']
    {class} function _GetCONNECTION: JStreamEngine_ErrorReason; cdecl;
    {class} function _GetPROTOCOL: JStreamEngine_ErrorReason; cdecl;
    {class} function _GetTIMEOUT: JStreamEngine_ErrorReason; cdecl;
    {class} function valueOf(name: JString): JStreamEngine_ErrorReason; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JStreamEngine_ErrorReason>; cdecl;//Deprecated
    {class} property CONNECTION: JStreamEngine_ErrorReason read _GetCONNECTION;
    {class} property PROTOCOL: JStreamEngine_ErrorReason read _GetPROTOCOL;
    {class} property TIMEOUT: JStreamEngine_ErrorReason read _GetTIMEOUT;
  end;

  [JavaSignature('zmq/io/StreamEngine$ErrorReason')]
  JStreamEngine_ErrorReason = interface(JEnum)
    ['{BE4A140B-0F71-4D29-8946-8460E3A939B7}']
  end;
  TJStreamEngine_ErrorReason = class(TJavaGenericImport<JStreamEngine_ErrorReasonClass, JStreamEngine_ErrorReason>) end;

  JDecoderBaseClass = interface(JObjectClass)
    ['{2B00C6B8-27D4-4681-9271-D1C4575ED6AD}']
    {class} function init(errno: JErrno; bufsize: Integer): JDecoderBase; cdecl;//Deprecated
    {class} function errno: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/DecoderBase')]
  JDecoderBase = interface(JObject)
    ['{74B1BD0E-E2DF-42EF-B5DB-95BA663DB508}']
    function decode(data: JByteBuffer; size: Integer; processed: JValueReference): JStep_Result; cdecl;//Deprecated
    procedure destroy; cdecl;
    function getBuffer: JByteBuffer; cdecl;
  end;
  TJDecoderBase = class(TJavaGenericImport<JDecoderBaseClass, JDecoderBase>) end;

  Jcoder_DecoderClass = interface(JDecoderBaseClass)
    ['{4B381F4D-AD97-4341-99D6-DAFAE5F71472}']
    {class} function init(errno: JErrno; bufsize: Integer; maxmsgsize: Int64; allocator: JMsgAllocator): Jcoder_Decoder; cdecl;//Deprecated
    {class} function msg: JMsg; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/Decoder')]
  Jcoder_Decoder = interface(JDecoderBase)
    ['{BE607F84-5AD2-4AE6-81A7-BAAFDB5DA9CB}']
  end;
  TJcoder_Decoder = class(TJavaGenericImport<Jcoder_DecoderClass, Jcoder_Decoder>) end;

  JEncoderBaseClass = interface(JObjectClass)
    ['{34C6D3AE-AC71-49F6-BA47-E3E4D43360B3}']
    {class} procedure encoded; cdecl;//Deprecated
    {class} procedure errno(err: Integer); cdecl; overload;//Deprecated
    {class} function isError: Boolean; cdecl;
    {class} procedure loadMsg(msg: JMsg); cdecl;
  end;

  [JavaSignature('zmq/io/coder/EncoderBase')]
  JEncoderBase = interface(JObject)
    ['{0B33711C-4490-4F35-8D13-6FD5C4887CE6}']
    procedure destroy; cdecl;
    function encode(data: JValueReference; size: Integer): Integer; cdecl;
    function errno: Integer; cdecl; overload;
  end;
  TJEncoderBase = class(TJavaGenericImport<JEncoderBaseClass, JEncoderBase>) end;

  Jcoder_EncoderClass = interface(JEncoderBaseClass)
    ['{FE76D275-D6FE-48C0-9A49-4EA194B7C3A2}']
  end;

  [JavaSignature('zmq/io/coder/Encoder')]
  Jcoder_Encoder = interface(JEncoderBase)
    ['{4A4E4B12-39B4-4EF6-9A05-3FF3FD8F2CF8}']
  end;
  TJcoder_Encoder = class(TJavaGenericImport<Jcoder_EncoderClass, Jcoder_Encoder>) end;

  JIDecoderClass = interface(IJavaClass)
    ['{D8D335AA-5EB2-4C4E-9A77-63C7D5BF92A0}']
    {class} function getBuffer: JByteBuffer; cdecl;
    {class} function msg: JMsg; cdecl;
  end;

  [JavaSignature('zmq/io/coder/IDecoder')]
  JIDecoder = interface(IJavaInstance)
    ['{B890E585-07CC-45CD-BFE9-6B299A332F9B}']
    function decode(buffer: JByteBuffer; size: Integer; processed: JValueReference): JStep_Result; cdecl;//Deprecated
    procedure destroy; cdecl;
  end;
  TJIDecoder = class(TJavaGenericImport<JIDecoderClass, JIDecoder>) end;

  JIDecoder_StepClass = interface(IJavaClass)
    ['{EE548613-F4F2-4166-9B53-229E7E957119}']
  end;

  [JavaSignature('zmq/io/coder/IDecoder$Step')]
  JIDecoder_Step = interface(IJavaInstance)
    ['{B818458C-C179-480F-836A-5B4F4A7AD9F7}']
    function apply: JStep_Result; cdecl;//Deprecated
  end;
  TJIDecoder_Step = class(TJavaGenericImport<JIDecoder_StepClass, JIDecoder_Step>) end;

  JStep_ResultClass = interface(JEnumClass)
    ['{F2D8ADAA-555F-4A30-9008-2301F4AAA813}']
    {class} function _GetDECODED: JStep_Result; cdecl;
    {class} function _GetERROR: JStep_Result; cdecl;
    {class} function _GetMORE_DATA: JStep_Result; cdecl;
    {class} function valueOf(name: JString): JStep_Result; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JStep_Result>; cdecl;//Deprecated
    {class} property DECODED: JStep_Result read _GetDECODED;
    {class} property ERROR: JStep_Result read _GetERROR;
    {class} property MORE_DATA: JStep_Result read _GetMORE_DATA;
  end;

  [JavaSignature('zmq/io/coder/IDecoder$Step$Result')]
  JStep_Result = interface(JEnum)
    ['{DB218F82-4B7A-4F4B-8137-A723CDB82858}']
  end;
  TJStep_Result = class(TJavaGenericImport<JStep_ResultClass, JStep_Result>) end;

  JIEncoderClass = interface(IJavaClass)
    ['{5FE81A7F-9B94-423B-BF80-4E0203111510}']
    {class} procedure destroy; cdecl;
    {class} function encode(data: JValueReference; size: Integer): Integer; cdecl;//Deprecated
    {class} procedure encoded; cdecl;
    {class} procedure loadMsg(msg: JMsg); cdecl;
  end;

  [JavaSignature('zmq/io/coder/IEncoder')]
  JIEncoder = interface(IJavaInstance)
    ['{51E7C618-E856-4780-91C8-6302ACFBA2D5}']
  end;
  TJIEncoder = class(TJavaGenericImport<JIEncoderClass, JIEncoder>) end;

  JRawDecoderClass = interface(JObjectClass)
    ['{B06313FA-F34C-49BA-B372-85F42D9D7C84}']
    {class} function init(bufsize: Integer): JRawDecoder; cdecl;//Deprecated
    {class} function decode(buffer: JByteBuffer; size: Integer; processed: JValueReference): JStep_Result; cdecl;
    {class} function getBuffer: JByteBuffer; cdecl;
  end;

  [JavaSignature('zmq/io/coder/raw/RawDecoder')]
  JRawDecoder = interface(JObject)
    ['{664383D2-7F22-4525-9A5A-C0A7B9D7FFF8}']
    procedure destroy; cdecl;
    function msg: JMsg; cdecl;
  end;
  TJRawDecoder = class(TJavaGenericImport<JRawDecoderClass, JRawDecoder>) end;

  JRawEncoderClass = interface(Jcoder_EncoderClass)
    ['{0A1945C4-586E-4D7E-8906-09635483524F}']
    {class} function init(errno: JErrno; bufsize: Integer): JRawEncoder; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/raw/RawEncoder')]
  JRawEncoder = interface(Jcoder_Encoder)
    ['{7EDADCDC-E84E-4E90-BCD0-50D284BD767E}']
  end;
  TJRawEncoder = class(TJavaGenericImport<JRawEncoderClass, JRawEncoder>) end;

  JV1DecoderClass = interface(Jcoder_DecoderClass)
    ['{7E18FB83-13B6-40C6-8501-55015B0DE604}']
    {class} function init(errno: JErrno; bufsize: Integer; maxmsgsize: Int64; allocator: JMsgAllocator): JV1Decoder; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/v1/V1Decoder')]
  JV1Decoder = interface(Jcoder_Decoder)
    ['{514B43A7-BEC5-453E-ABAA-CEF945706EA2}']
  end;
  TJV1Decoder = class(TJavaGenericImport<JV1DecoderClass, JV1Decoder>) end;

  JV1EncoderClass = interface(Jcoder_EncoderClass)
    ['{5FF07078-F741-4A86-BF29-F0521D618984}']
    {class} function init(errno: JErrno; bufsize: Integer): JV1Encoder; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/v1/V1Encoder')]
  JV1Encoder = interface(Jcoder_Encoder)
    ['{551ECF85-0EC8-4241-9466-6C35B9378B98}']
  end;
  TJV1Encoder = class(TJavaGenericImport<JV1EncoderClass, JV1Encoder>) end;

  JV1ProtocolClass = interface(IJavaClass)
    ['{E31F653E-31DD-4ADE-9C90-12F3B2A3BA3C}']
    {class} function _GetMORE_FLAG: Integer; cdecl;
    {class} function _GetVERSION: Integer; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
    {class} property MORE_FLAG: Integer read _GetMORE_FLAG;
    {class} property VERSION: Integer read _GetVERSION;
  end;

  [JavaSignature('zmq/io/coder/v1/V1Protocol')]
  JV1Protocol = interface(IJavaInstance)
    ['{8E18DBC4-CFEA-4EB5-993D-A260C2998516}']
  end;
  TJV1Protocol = class(TJavaGenericImport<JV1ProtocolClass, JV1Protocol>) end;

  JV2DecoderClass = interface(Jcoder_DecoderClass)
    ['{DE50DF34-0A11-4E6C-A9D6-AE5FDAB059BE}']
    {class} function init(errno: JErrno; bufsize: Integer; maxmsgsize: Int64; allocator: JMsgAllocator): JV2Decoder; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/v2/V2Decoder')]
  JV2Decoder = interface(Jcoder_Decoder)
    ['{403E946C-7BDD-4E5C-A572-EBE3D1C65E25}']
  end;
  TJV2Decoder = class(TJavaGenericImport<JV2DecoderClass, JV2Decoder>) end;

  JV2EncoderClass = interface(Jcoder_EncoderClass)
    ['{20492B01-5191-4C50-BF90-9D5E7A59E347}']
    {class} function init(errno: JErrno; bufsize: Integer): JV2Encoder; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/coder/v2/V2Encoder')]
  JV2Encoder = interface(Jcoder_Encoder)
    ['{FE64F7B3-6ECA-4A93-AE8B-A08012E120AE}']
  end;
  TJV2Encoder = class(TJavaGenericImport<JV2EncoderClass, JV2Encoder>) end;

  JV2ProtocolClass = interface(JV1ProtocolClass)
    ['{725DEEE8-6306-468E-9120-7FEEE82B7FE7}']
    {class} function _GetCOMMAND_FLAG: Integer; cdecl;
    {class} function _GetLARGE_FLAG: Integer; cdecl;
    {class} function _GetVERSION: Integer; cdecl;
    {class} property COMMAND_FLAG: Integer read _GetCOMMAND_FLAG;
    {class} property LARGE_FLAG: Integer read _GetLARGE_FLAG;
    {class} //VERSION is defined in parent interface
  end;

  [JavaSignature('zmq/io/coder/v2/V2Protocol')]
  JV2Protocol = interface(JV1Protocol)
    ['{87BE7157-CE5B-48B8-905B-B9E31E4CAD1E}']
    function toString: JString; cdecl;//Deprecated
  end;
  TJV2Protocol = class(TJavaGenericImport<JV2ProtocolClass, JV2Protocol>) end;

  JMechanismClass = interface(JObjectClass)
    ['{D9AF0F9C-3707-48EA-84C2-798BAB3EE2F6}']
    {class} function _GetzapProperties: Jio_Metadata; cdecl;
    {class} function _GetzmtpProperties: Jio_Metadata; cdecl;
    {class} function getUserId: Jutil_Blob; cdecl;//Deprecated
    {class} function nextHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
    {class} function peerIdentity: JMsg; cdecl;
    {class} function processHandshakeCommand(msg: JMsg): Integer; cdecl;
    {class} property zapProperties: Jio_Metadata read _GetzapProperties;
    {class} property zmtpProperties: Jio_Metadata read _GetzmtpProperties;
  end;

  [JavaSignature('zmq/io/mechanism/Mechanism')]
  JMechanism = interface(JObject)
    ['{2ABFF9CF-AF10-4D29-942C-9BA51A371F7A}']
    function decode(msg: JMsg): JMsg; cdecl;
    procedure destroy; cdecl;//Deprecated
    function encode(msg: JMsg): JMsg; cdecl;
    function status: JMechanism_Status; cdecl;
    function zapMsgAvailable: Integer; cdecl;
  end;
  TJMechanism = class(TJavaGenericImport<JMechanismClass, JMechanism>) end;

  JMechanism_StatusClass = interface(JEnumClass)
    ['{42E964D6-F4E6-41A8-A03E-F2811C8C3E68}']
    {class} function _GetERROR: JMechanism_Status; cdecl;
    {class} function _GetHANDSHAKING: JMechanism_Status; cdecl;
    {class} function _GetREADY: JMechanism_Status; cdecl;
    {class} function valueOf(name: JString): JMechanism_Status; cdecl;
    {class} function values: TJavaObjectArray<JMechanism_Status>; cdecl;
    {class} property ERROR: JMechanism_Status read _GetERROR;
    {class} property HANDSHAKING: JMechanism_Status read _GetHANDSHAKING;
    {class} property READY: JMechanism_Status read _GetREADY;
  end;

  [JavaSignature('zmq/io/mechanism/Mechanism$Status')]
  JMechanism_Status = interface(JEnum)
    ['{3AFB4B73-3EF5-4A7F-82B4-19ACDA30C715}']
  end;
  TJMechanism_Status = class(TJavaGenericImport<JMechanism_StatusClass, JMechanism_Status>) end;

  JMechanismsClass = interface(JEnumClass)
    ['{D6E7A0F2-E2E1-4165-A10C-B3DECE9C36F9}']
    {class} function _GetCURVE: JMechanisms; cdecl;
    {class} function _GetGSSAPI: JMechanisms; cdecl;
    {class} function _GetNULL: JMechanisms; cdecl;
    {class} function _GetPLAIN: JMechanisms; cdecl;
    {class} procedure check(options: JOptions); cdecl;//Deprecated
    {class} function isMechanism(greetingRecv: JByteBuffer): Boolean; cdecl;//Deprecated
    {class} function valueOf(name: JString): JMechanisms; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JMechanisms>; cdecl;//Deprecated
    {class} property CURVE: JMechanisms read _GetCURVE;
    {class} property GSSAPI: JMechanisms read _GetGSSAPI;
    {class} 
    {class} property PLAIN: JMechanisms read _GetPLAIN;
  end;

  [JavaSignature('zmq/io/mechanism/Mechanisms')]
  JMechanisms = interface(JEnum)
    ['{6BCCEC5B-C11F-4849-9797-137E754F4871}']
    function create(session: JSessionBase; peerAddress: Jnet_Address; options: JOptions): JMechanism; cdecl;//Deprecated
  end;
  TJMechanisms = class(TJavaGenericImport<JMechanismsClass, JMechanisms>) end;

  JCurveClass = interface(JObjectClass)
    ['{823C5FE0-F4B6-4F4F-A211-7805D1D44DBE}']
    {class} function init: JCurve; cdecl;//Deprecated
    {class} function box(ciphertext: JByteBuffer; plaintext: JByteBuffer; length: Integer; nonce: JByteBuffer; publicKey: TJavaArray<Byte>; secretKey: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function box(ciphertext: TJavaArray<Byte>; plaintext: TJavaArray<Byte>; length: Integer; nonce: TJavaArray<Byte>; publicKey: TJavaArray<Byte>; secretKey: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function keypairZ85: TJavaObjectArray<JString>; cdecl;
    {class} function z85EncodePublic(publicKey: TJavaArray<Byte>): JString; cdecl;
  end;

  [JavaSignature('zmq/io/mechanism/curve/Curve')]
  JCurve = interface(JObject)
    ['{4AE2FBE3-4A93-4062-8508-B20CC601E5B8}']
    function keypair: TJavaBiArray<Byte>; cdecl;
  end;
  TJCurve = class(TJavaGenericImport<JCurveClass, JCurve>) end;

  JCurveClientMechanismClass = interface(JMechanismClass)
    ['{05D0C3E4-A76D-40AA-AF23-2598BE7B0F1B}']
    {class} function init(options: JOptions): JCurveClientMechanism; cdecl;//Deprecated
    {class} function encode(msg: JMsg): JMsg; cdecl;//Deprecated
    {class} function processHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
    {class} function zapMsgAvailable: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/mechanism/curve/CurveClientMechanism')]
  JCurveClientMechanism = interface(JMechanism)
    ['{5E37CF6F-531F-4ABD-BA1B-2E17F127317E}']
    function decode(msg: JMsg): JMsg; cdecl;
    function nextHandshakeCommand(msg: JMsg): Integer; cdecl;
    function status: JMechanism_Status; cdecl;//Deprecated
  end;
  TJCurveClientMechanism = class(TJavaGenericImport<JCurveClientMechanismClass, JCurveClientMechanism>) end;

  JCurveServerMechanismClass = interface(JMechanismClass)
    ['{D4659529-48B7-4B9A-A629-13924788EF57}']
    {class} function init(session: JSessionBase; peerAddress: Jnet_Address; options: JOptions): JCurveServerMechanism; cdecl;//Deprecated
    {class} function decode(msg: JMsg): JMsg; cdecl;//Deprecated
    {class} function nextHandshakeCommand(msg: JMsg): Integer; cdecl;
    {class} function zapMsgAvailable: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/mechanism/curve/CurveServerMechanism')]
  JCurveServerMechanism = interface(JMechanism)
    ['{48B0CA24-3B68-4AFB-A86E-EED77228C4D5}']
    function encode(msg: JMsg): JMsg; cdecl;//Deprecated
    function processHandshakeCommand(msg: JMsg): Integer; cdecl;
    function status: JMechanism_Status; cdecl;
  end;
  TJCurveServerMechanism = class(TJavaGenericImport<JCurveServerMechanismClass, JCurveServerMechanism>) end;

  JGssapiClientMechanismClass = interface(JMechanismClass)
    ['{F513BCFE-76D2-4D81-98DC-5D061101CE56}']
    {class} function init(options: JOptions): JGssapiClientMechanism; cdecl;//Deprecated
    {class} function nextHandshakeCommand(msg: JMsg): Integer; cdecl;
    {class} function processHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
    {class} function status: JMechanism_Status; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/mechanism/gssapi/GssapiClientMechanism')]
  JGssapiClientMechanism = interface(JMechanism)
    ['{99356F31-62B7-4701-9A1D-1A7EC7EA26D7}']
    function zapMsgAvailable: Integer; cdecl;
  end;
  TJGssapiClientMechanism = class(TJavaGenericImport<JGssapiClientMechanismClass, JGssapiClientMechanism>) end;

  JGssapiServerMechanismClass = interface(JMechanismClass)
    ['{773AE91D-30FC-4B9A-943D-2ABA2A6CC417}']
    {class} function init(session: JSessionBase; peerAddress: Jnet_Address; options: JOptions): JGssapiServerMechanism; cdecl;//Deprecated
    {class} function processHandshakeCommand(msg: JMsg): Integer; cdecl;
    {class} function status: JMechanism_Status; cdecl;
    {class} function zapMsgAvailable: Integer; cdecl;
  end;

  [JavaSignature('zmq/io/mechanism/gssapi/GssapiServerMechanism')]
  JGssapiServerMechanism = interface(JMechanism)
    ['{5070FFE1-3E90-4864-9D71-56E632ECA0F8}']
    function nextHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
  end;
  TJGssapiServerMechanism = class(TJavaGenericImport<JGssapiServerMechanismClass, JGssapiServerMechanism>) end;

  JPlainClientMechanismClass = interface(JMechanismClass)
    ['{57F4E56C-223E-469E-B1E9-C83034A3BA98}']
    {class} function init(options: JOptions): JPlainClientMechanism; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/mechanism/plain/PlainClientMechanism')]
  JPlainClientMechanism = interface(JMechanism)
    ['{11C57767-E184-45A4-9F5E-55D2F3F627E3}']
    function nextHandshakeCommand(msg: JMsg): Integer; cdecl;
    function processHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
    function status: JMechanism_Status; cdecl;//Deprecated
    function zapMsgAvailable: Integer; cdecl;
  end;
  TJPlainClientMechanism = class(TJavaGenericImport<JPlainClientMechanismClass, JPlainClientMechanism>) end;

  JPlainServerMechanismClass = interface(JMechanismClass)
    ['{2428B00E-CF3C-4D33-9368-3015B2E6146C}']
    {class} function init(session: JSessionBase; peerAddress: Jnet_Address; options: JOptions): JPlainServerMechanism; cdecl;//Deprecated
    {class} function nextHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/mechanism/plain/PlainServerMechanism')]
  JPlainServerMechanism = interface(JMechanism)
    ['{6D4EED17-E3FA-4617-A376-45248247B364}']
    function processHandshakeCommand(msg: JMsg): Integer; cdecl;//Deprecated
    function status: JMechanism_Status; cdecl;//Deprecated
    function zapMsgAvailable: Integer; cdecl;//Deprecated
  end;
  TJPlainServerMechanism = class(TJavaGenericImport<JPlainServerMechanismClass, JPlainServerMechanism>) end;

  Jnet_AddressClass = interface(JObjectClass)
    ['{F7F52441-D56E-4766-9937-3C3A07154175}']
    {class} function init(protocol: JString; address: JString): Jnet_Address; cdecl; overload;//Deprecated
    {class} function init(socketAddress: JSocketAddress): Jnet_Address; cdecl; overload;//Deprecated
    {class} function address: JString; cdecl;
    {class} function host: JString; cdecl;
    {class} function isResolved: Boolean; cdecl;
  end;

  [JavaSignature('zmq/io/net/Address')]
  Jnet_Address = interface(JObject)
    ['{CE915935-21EA-4BE4-B47C-E83DCC25DEE1}']
    function protocol: JNetProtocol; cdecl;
    function resolve(ipv6: Boolean): JAddress_IZAddress; cdecl;
    function resolved: JAddress_IZAddress; cdecl;
    function toString: JString; cdecl;
  end;
  TJnet_Address = class(TJavaGenericImport<Jnet_AddressClass, Jnet_Address>) end;

  JAddress_IZAddressClass = interface(IJavaClass)
    ['{CC798AAB-C5B5-44DB-B97F-8D30A49094A0}']
    {class} function address: JSocketAddress; cdecl;//Deprecated
    {class} function family: Jnet_ProtocolFamily; cdecl;
    {class} function resolve(name: JString; ipv6: Boolean; local: Boolean): JInetSocketAddress; cdecl;//Deprecated
    {class} function toString(port: Integer): JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/Address$IZAddress')]
  JAddress_IZAddress = interface(IJavaInstance)
    ['{7AEB5B7F-78C4-49D9-A703-917FF2B71C04}']
    function sourceAddress: JSocketAddress; cdecl;
  end;
  TJAddress_IZAddress = class(TJavaGenericImport<JAddress_IZAddressClass, JAddress_IZAddress>) end;

  JNetProtocolClass = interface(JEnumClass)
    ['{0B0D15EA-AF0F-4AE5-8776-0C96007A5CF8}']
    {class} function _Getepgm: JNetProtocol; cdecl;
    {class} function _Getinproc: JNetProtocol; cdecl;
    {class} function _Getipc: JNetProtocol; cdecl;
    {class} function _Getnorm: JNetProtocol; cdecl;
    {class} function _Getpgm: JNetProtocol; cdecl;
    {class} function _Gettcp: JNetProtocol; cdecl;
    {class} function _Gettipc: JNetProtocol; cdecl;
    {class} function getProtocol(protocol: JString): JNetProtocol; cdecl;
    {class} function valueOf(name: JString): JNetProtocol; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JNetProtocol>; cdecl;//Deprecated
    {class} property epgm: JNetProtocol read _Getepgm;
    {class} property inproc: JNetProtocol read _Getinproc;
    {class} property ipc: JNetProtocol read _Getipc;
    {class} property norm: JNetProtocol read _Getnorm;
    {class} property pgm: JNetProtocol read _Getpgm;
    {class} property tcp: JNetProtocol read _Gettcp;
    {class} property tipc: JNetProtocol read _Gettipc;
  end;

  [JavaSignature('zmq/io/net/NetProtocol')]
  JNetProtocol = interface(JEnum)
    ['{B9DCF260-AC4B-4AD8-9C39-B09149344179}']
    function _Getvalid: Boolean; cdecl;
    function compatible(type_: Integer): Boolean; cdecl;//Deprecated
    property valid: Boolean read _Getvalid;
  end;
  TJNetProtocol = class(TJavaGenericImport<JNetProtocolClass, JNetProtocol>) end;

  Jnet_ProtocolFamilyClass = interface(IJavaClass)
    ['{B978C071-1AD7-483D-9C7B-A6C24C50E8B7}']
    {class} function name: JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/ProtocolFamily')]
  Jnet_ProtocolFamily = interface(IJavaInstance)
    ['{08178CBF-A8EA-4F81-99BE-FB63CB2F81A4}']
  end;
  TJnet_ProtocolFamily = class(TJavaGenericImport<Jnet_ProtocolFamilyClass, Jnet_ProtocolFamily>) end;

  JSelectorProviderChooserClass = interface(IJavaClass)
    ['{332F796B-A7D4-44F2-8C4F-7231510C6B10}']
    {class} function choose(addr: JAddress_IZAddress; options: JOptions): JSelectorProvider; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/SelectorProviderChooser')]
  JSelectorProviderChooser = interface(IJavaInstance)
    ['{91BFDC04-1DB6-4204-90B1-0AABAEE25820}']
  end;
  TJSelectorProviderChooser = class(TJavaGenericImport<JSelectorProviderChooserClass, JSelectorProviderChooser>) end;

  Jnet_StandardProtocolFamilyClass = interface(JEnumClass)
    ['{ABA368B2-8D6F-4900-9009-F2F32986F73D}']
    {class} function _GetINET: Jnet_StandardProtocolFamily; cdecl;
    {class} function _GetINET6: Jnet_StandardProtocolFamily; cdecl;
    {class} function valueOf(name: JString): Jnet_StandardProtocolFamily; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<Jnet_StandardProtocolFamily>; cdecl;//Deprecated
    {class} property INET: Jnet_StandardProtocolFamily read _GetINET;
    {class} property INET6: Jnet_StandardProtocolFamily read _GetINET6;
  end;

  [JavaSignature('zmq/io/net/StandardProtocolFamily')]
  Jnet_StandardProtocolFamily = interface(JEnum)
    ['{14D28CF7-98EA-4A24-A51E-D7CAE5394E72}']
  end;
  TJnet_StandardProtocolFamily = class(TJavaGenericImport<Jnet_StandardProtocolFamilyClass, Jnet_StandardProtocolFamily>) end;

  JIpcAddressClass = interface(JObjectClass)
    ['{6700355D-40E3-4848-80E2-39D12BFE8EC2}']
    {class} function init(addr: JString): JIpcAddress; cdecl;//Deprecated
    {class} function address: JSocketAddress; cdecl;
    {class} function resolve(name: JString; ipv6: Boolean; local: Boolean): JInetSocketAddress; cdecl;
  end;

  [JavaSignature('zmq/io/net/ipc/IpcAddress')]
  JIpcAddress = interface(JObject)
    ['{EE97837A-94B3-4283-8137-7E36DB6848BA}']
    function family: Jnet_ProtocolFamily; cdecl;//Deprecated
    function sourceAddress: JSocketAddress; cdecl;
    function toString: JString; cdecl; overload;//Deprecated
    function toString(port: Integer): JString; cdecl; overload;
  end;
  TJIpcAddress = class(TJavaGenericImport<JIpcAddressClass, JIpcAddress>) end;

  JTcpAddressClass = interface(JObjectClass)
    ['{C34E6DFB-BFBE-4DD0-ADC4-4A9F62F00EF2}']
    {class} function init(addr: JString; ipv6: Boolean): JTcpAddress; cdecl;//Deprecated
    {class} function address: JSocketAddress; cdecl;//Deprecated
    {class} function family: Jnet_ProtocolFamily; cdecl;
    {class} function resolve(name: JString; ipv6: Boolean; local: Boolean): JInetSocketAddress; cdecl;//Deprecated
    {class} function sourceAddress: JSocketAddress; cdecl;
    {class} function toString: JString; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tcp/TcpAddress')]
  JTcpAddress = interface(JObject)
    ['{F027A9B2-54B0-4383-89DE-00B1FA0E845D}']
    function toString(port: Integer): JString; cdecl; overload;
  end;
  TJTcpAddress = class(TJavaGenericImport<JTcpAddressClass, JTcpAddress>) end;

  JIpcAddress_IpcAddressMaskClass = interface(JTcpAddressClass)
    ['{295FE2E2-2003-4EBD-984F-1EC7022B7B31}']
    {class} function init(addr: JString; ipv6: Boolean): JIpcAddress_IpcAddressMask; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/ipc/IpcAddress$IpcAddressMask')]
  JIpcAddress_IpcAddressMask = interface(JTcpAddress)
    ['{4A1D436B-20C9-4FE9-9ABA-164FE76FBC59}']
    function matchAddress(addr: JSocketAddress): Boolean; cdecl;
  end;
  TJIpcAddress_IpcAddressMask = class(TJavaGenericImport<JIpcAddress_IpcAddressMaskClass, JIpcAddress_IpcAddressMask>) end;

  JTcpConnecterClass = interface(JOwnClass)
    ['{7AA3A0B3-B040-4CD7-949E-AFB87FC502DA}']
    {class} function init(ioThread: JIOThread; session: JSessionBase; options: JOptions; addr: Jnet_Address; delayedStart: Boolean): JTcpConnecter; cdecl;//Deprecated
    {class} procedure outEvent; cdecl;//Deprecated
    {class} procedure timerEvent(id: Integer); cdecl;//Deprecated
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('zmq/io/net/tcp/TcpConnecter')]
  JTcpConnecter = interface(JOwn)
    ['{EE8A9196-A23E-40C2-93F3-B7B89562FE29}']
    procedure connectEvent; cdecl;
    procedure inEvent; cdecl;
  end;
  TJTcpConnecter = class(TJavaGenericImport<JTcpConnecterClass, JTcpConnecter>) end;

  JIpcConnecterClass = interface(JTcpConnecterClass)
    ['{F5E55102-A5BE-4DDE-90F8-2AA0E96DFABB}']
    {class} function init(ioThread: JIOThread; session: JSessionBase; options: JOptions; addr: Jnet_Address; wait: Boolean): JIpcConnecter; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/ipc/IpcConnecter')]
  JIpcConnecter = interface(JTcpConnecter)
    ['{2E2D5562-2098-48D0-88F7-821639B59D0E}']
  end;
  TJIpcConnecter = class(TJavaGenericImport<JIpcConnecterClass, JIpcConnecter>) end;

  JTcpListenerClass = interface(JOwnClass)
    ['{F4E61179-AF77-4412-8D65-444DE26BD0F3}']
    {class} function init(ioThread: JIOThread; socket: JSocketBase; options: JOptions): JTcpListener; cdecl;//Deprecated
    {class} procedure acceptEvent; cdecl;//Deprecated
    {class} procedure destroy; cdecl;//Deprecated
    {class} function getAddress: JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tcp/TcpListener')]
  JTcpListener = interface(JOwn)
    ['{72385AC3-3320-47D9-8614-BF85CB7151B6}']
    function setAddress(addr: JString): Boolean; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJTcpListener = class(TJavaGenericImport<JTcpListenerClass, JTcpListener>) end;

  JIpcListenerClass = interface(JTcpListenerClass)
    ['{63CF68DB-CDBC-4C86-B153-478CC6905B1C}']
    {class} function init(ioThread: JIOThread; socket: JSocketBase; options: JOptions): JIpcListener; cdecl;//Deprecated
    {class} function getAddress: JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/ipc/IpcListener')]
  JIpcListener = interface(JTcpListener)
    ['{A048B615-76ED-4E73-8811-FB0F2ED60651}']
    function setAddress(addr: JString): Boolean; cdecl;
  end;
  TJIpcListener = class(TJavaGenericImport<JIpcListenerClass, JIpcListener>) end;

  JNormEngineClass = interface(JEngineNotImplementedClass)
    ['{CEA27DEA-0620-4AA4-98CA-F150E89BB530}']
    {class} function init(ioThread: JIOThread; options: JOptions): JNormEngine; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/io/net/norm/NormEngine')]
  JNormEngine = interface(JEngineNotImplemented)
    ['{8B7EC83A-A583-40BF-B925-BFFE84F8940E}']
  end;
  TJNormEngine = class(TJavaGenericImport<JNormEngineClass, JNormEngine>) end;

  JPgmReceiverClass = interface(JEngineNotImplementedClass)
    ['{D77F56C8-F0B0-4DC6-B920-89567DBE75CB}']
    {class} function init(ioThread: JIOThread; options: JOptions): JPgmReceiver; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/io/net/pgm/PgmReceiver')]
  JPgmReceiver = interface(JEngineNotImplemented)
    ['{6CCB16CF-6E94-4CDD-82AE-5AEC2A6B517D}']
  end;
  TJPgmReceiver = class(TJavaGenericImport<JPgmReceiverClass, JPgmReceiver>) end;

  JPgmSenderClass = interface(JEngineNotImplementedClass)
    ['{5AEBCF88-0750-46E6-B162-C87FABB73D70}']
    {class} function init(ioThread: JIOThread; options: JOptions): JPgmSender; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/io/net/pgm/PgmSender')]
  JPgmSender = interface(JEngineNotImplemented)
    ['{446E87FC-F698-4C0E-AA06-7E36C036791C}']
    function init(udpEncapsulation: Boolean; addr: Jnet_Address): Boolean; cdecl; overload;
  end;
  TJPgmSender = class(TJavaGenericImport<JPgmSenderClass, JPgmSender>) end;

  JSocksConnecterClass = interface(JTcpConnecterClass)
    ['{9945CE3A-0D23-4399-B3D0-559BC6558A20}']
    {class} function init(ioThread: JIOThread; session: JSessionBase; options: JOptions; addr: Jnet_Address; proxyAddr: Jnet_Address; delayedStart: Boolean): JSocksConnecter; cdecl;//Deprecated
    {class} procedure inEvent; cdecl;//Deprecated
    {class} procedure outEvent; cdecl;//Deprecated
    {class} procedure timerEvent(id: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tcp/SocksConnecter')]
  JSocksConnecter = interface(JTcpConnecter)
    ['{42DD048E-201E-4A4E-BD97-9316DFE85F93}']
  end;
  TJSocksConnecter = class(TJavaGenericImport<JSocksConnecterClass, JSocksConnecter>) end;

  JTcpAddress_TcpAddressMaskClass = interface(JTcpAddressClass)
    ['{CC32FB58-E06A-4BA6-A089-82B21DFDFC0C}']
    {class} function init(addr: JString; ipv6: Boolean): JTcpAddress_TcpAddressMask; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tcp/TcpAddress$TcpAddressMask')]
  JTcpAddress_TcpAddressMask = interface(JTcpAddress)
    ['{450CBEA0-F81F-46A3-8A5F-83157662A853}']
    function matchAddress(addr: JSocketAddress): Boolean; cdecl;
  end;
  TJTcpAddress_TcpAddressMask = class(TJavaGenericImport<JTcpAddress_TcpAddressMaskClass, JTcpAddress_TcpAddressMask>) end;

  JTcpUtilsClass = interface(JObjectClass)
    ['{E7C5C592-45E1-4F1A-BAA8-7F9F6DA1F416}']
    {class} procedure enableIpv4Mapping(channel: JSelectableChannel); cdecl;//Deprecated
    {class} function getPeerIpAddress(channel: JSocketChannel): Jnet_Address; cdecl;//Deprecated
    {class} function setIpTypeOfService(channel: JChannel; tos: Integer): Boolean; cdecl;//Deprecated
    {class} function setReuseAddress(channel: JChannel; reuse: Boolean): Boolean; cdecl;//Deprecated
    {class} function setTcpReceiveBuffer(channel: JChannel; rcvbuf: Integer): Boolean; cdecl;//Deprecated
    {class} function setTcpSendBuffer(channel: JChannel; sndbuf: Integer): Boolean; cdecl;//Deprecated
    {class} procedure tuneTcpKeepalives(channel: JSocketChannel; tcpKeepAlive: Integer; tcpKeepAliveCnt: Integer; tcpKeepAliveIdle: Integer; tcpKeepAliveIntvl: Integer); cdecl;//Deprecated
    {class} procedure tuneTcpSocket(channel: JSocketChannel); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tcp/TcpUtils')]
  JTcpUtils = interface(JObject)
    ['{DA55CF21-FE5F-4B19-B37C-1C4CC4DBED7E}']
  end;
  TJTcpUtils = class(TJavaGenericImport<JTcpUtilsClass, JTcpUtils>) end;

  JTipcConnecterClass = interface(JTcpConnecterClass)
    ['{927DAC60-DD01-42C0-8CE7-1367BF31BB5B}']
    {class} function init(ioThread: JIOThread; session: JSessionBase; options: JOptions; addr: Jnet_Address; wait: Boolean): JTipcConnecter; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tipc/TipcConnecter')]
  JTipcConnecter = interface(JTcpConnecter)
    ['{26421879-4C24-4462-A9EC-C6E1EBC501CB}']
  end;
  TJTipcConnecter = class(TJavaGenericImport<JTipcConnecterClass, JTipcConnecter>) end;

  JTipcListenerClass = interface(JTcpListenerClass)
    ['{D9626796-3BF0-47CB-AC8D-DFC39D9055F1}']
    {class} function init(ioThread: JIOThread; socket: JSocketBase; options: JOptions): JTipcListener; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/io/net/tipc/TipcListener')]
  JTipcListener = interface(JTcpListener)
    ['{97EB7AFE-EB27-45C5-BB78-8D27EAAC410B}']
  end;
  TJTipcListener = class(TJavaGenericImport<JTipcListenerClass, JTipcListener>) end;

  JMsgAllocatorClass = interface(IJavaClass)
    ['{D8B3A739-5A21-4BE9-BA35-0DC077A21F5D}']
    {class} function allocate(size: Integer): JMsg; cdecl;
  end;

  [JavaSignature('zmq/msg/MsgAllocator')]
  JMsgAllocator = interface(IJavaInstance)
    ['{1B92C393-D339-441D-BD08-A328AA2CEDBF}']
  end;
  TJMsgAllocator = class(TJavaGenericImport<JMsgAllocatorClass, JMsgAllocator>) end;

  JMsgAllocatorDirectClass = interface(JObjectClass)
    ['{DD44BE23-4281-4F6D-8A7A-5A86B18E9268}']
    {class} function init: JMsgAllocatorDirect; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/msg/MsgAllocatorDirect')]
  JMsgAllocatorDirect = interface(JObject)
    ['{B5A0E7E7-458B-46CA-93EA-13548CF8FBD9}']
    function allocate(size: Integer): JMsg; cdecl;
  end;
  TJMsgAllocatorDirect = class(TJavaGenericImport<JMsgAllocatorDirectClass, JMsgAllocatorDirect>) end;

  JMsgAllocatorHeapClass = interface(JObjectClass)
    ['{430C2E92-07E0-410D-90A4-CD948B81209C}']
    {class} function init: JMsgAllocatorHeap; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/msg/MsgAllocatorHeap')]
  JMsgAllocatorHeap = interface(JObject)
    ['{BBB2B583-5943-4462-AEA3-D5091BBEDEA6}']
    function allocate(size: Integer): JMsg; cdecl;//Deprecated
  end;
  TJMsgAllocatorHeap = class(TJavaGenericImport<JMsgAllocatorHeapClass, JMsgAllocatorHeap>) end;

  JMsgAllocatorThresholdClass = interface(JObjectClass)
    ['{1A283830-F3CB-4F93-9224-5A09155B5555}']
    {class} function init: JMsgAllocatorThreshold; cdecl; overload;//Deprecated
    {class} function init(threshold: Integer): JMsgAllocatorThreshold; cdecl; overload;//Deprecated
    {class} function allocate(size: Integer): JMsg; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/msg/MsgAllocatorThreshold')]
  JMsgAllocatorThreshold = interface(JObject)
    ['{816AD2F2-6318-45FF-B44B-A05433E9ABD3}']
    function _Getthreshold: Integer; cdecl;
    property threshold: Integer read _Getthreshold;
  end;
  TJMsgAllocatorThreshold = class(TJavaGenericImport<JMsgAllocatorThresholdClass, JMsgAllocatorThreshold>) end;

  Jpipe_PipeClass = interface(JZObjectClass)
    ['{9D141B5C-2894-4223-8423-90136426511E}']
    {class} function checkRead: Boolean; cdecl;//Deprecated
    {class} function checkWrite: Boolean; cdecl;//Deprecated
    {class} procedure hiccup; cdecl;//Deprecated
    {class} function pair(parents: TJavaObjectArray<JZObject>; hwms: TJavaArray<Integer>; conflates: TJavaArray<Boolean>): TJavaObjectArray<Jpipe_Pipe>; cdecl;
    {class} function read: JMsg; cdecl;
    {class} procedure rollback; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
    {class} function write(msg: JMsg): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/pipe/Pipe')]
  Jpipe_Pipe = interface(JZObject)
    ['{9CCEE50B-A894-48D5-846A-A0517BFE2E0F}']
    function checkHwm: Boolean; cdecl;//Deprecated
    procedure flush; cdecl;
    function getCredential: Jutil_Blob; cdecl;
    function getIdentity: Jutil_Blob; cdecl;
    procedure setEventSink(sink: JPipe_IPipeEvents); cdecl;//Deprecated
    procedure setHwms(inhwm: Integer; outhwm: Integer); cdecl;
    procedure setIdentity(identity: Jutil_Blob); cdecl;
    procedure setNoDelay; cdecl;
    procedure terminate(delay: Boolean); cdecl;//Deprecated
  end;
  TJpipe_Pipe = class(TJavaGenericImport<Jpipe_PipeClass, Jpipe_Pipe>) end;

  JPipe_IPipeEventsClass = interface(IJavaClass)
    ['{F4305B82-558F-440B-8B12-269AE55C58DD}']
  end;

  [JavaSignature('zmq/pipe/Pipe$IPipeEvents')]
  JPipe_IPipeEvents = interface(IJavaInstance)
    ['{FDB956F3-C917-403F-992A-6532800A8187}']
    procedure hiccuped(pipe: Jpipe_Pipe); cdecl;//Deprecated
    procedure pipeTerminated(pipe: Jpipe_Pipe); cdecl;
    procedure readActivated(pipe: Jpipe_Pipe); cdecl;//Deprecated
    procedure writeActivated(pipe: Jpipe_Pipe); cdecl;//Deprecated
  end;
  TJPipe_IPipeEvents = class(TJavaGenericImport<JPipe_IPipeEventsClass, JPipe_IPipeEvents>) end;

  JYPipeClass = interface(JObjectClass)
    ['{4FAF4985-A613-487C-A079-9EC91FD19A1E}']
    {class} function init(qsize: Integer): JYPipe; cdecl;//Deprecated
    {class} function probe: JObject; cdecl;//Deprecated
    {class} function unwrite: JObject; cdecl;//Deprecated
    {class} procedure write(value: JObject; incomplete: Boolean); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/pipe/YPipe')]
  JYPipe = interface(JObject)
    ['{D87E723E-5205-4DEC-A91B-A19F36F9848F}']
    function checkRead: Boolean; cdecl;//Deprecated
    function flush: Boolean; cdecl;//Deprecated
    function read: JObject; cdecl;
  end;
  TJYPipe = class(TJavaGenericImport<JYPipeClass, JYPipe>) end;

  JYPipeBaseClass = interface(IJavaClass)
    ['{B98252FC-D3EE-4A3A-AAE5-8149AD871AE9}']
    {class} function flush: Boolean; cdecl;
    {class} function probe: JObject; cdecl;
    {class} function read: JObject; cdecl;
  end;

  [JavaSignature('zmq/pipe/YPipeBase')]
  JYPipeBase = interface(IJavaInstance)
    ['{D6F32445-E4BD-417F-8F41-A176C281B3A7}']
    function checkRead: Boolean; cdecl;//Deprecated
    function unwrite: JObject; cdecl;
    procedure write(value: JObject; incomplete: Boolean); cdecl;
  end;
  TJYPipeBase = class(TJavaGenericImport<JYPipeBaseClass, JYPipeBase>) end;

  JYPipeConflateClass = interface(JObjectClass)
    ['{738C2F27-CF5A-4FAC-9FC2-85ED332B53FA}']
    {class} function init: JYPipeConflate; cdecl;//Deprecated
    {class} function read: JMsg; cdecl;//Deprecated
    {class} function unwrite: JMsg; cdecl;//Deprecated
    {class} procedure write(value: JMsg; incomplete: Boolean); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/pipe/YPipeConflate')]
  JYPipeConflate = interface(JObject)
    ['{10A66ECF-E0D6-4F41-846D-6D60AFF65D5D}']
    function checkRead: Boolean; cdecl;//Deprecated
    function flush: Boolean; cdecl;//Deprecated
    function probe: JMsg; cdecl;//Deprecated
  end;
  TJYPipeConflate = class(TJavaGenericImport<JYPipeConflateClass, JYPipeConflate>) end;

  JIPollEventsClass = interface(IJavaClass)
    ['{3E5841AB-4C81-4C46-AE84-8EEE1688336C}']
    {class} procedure inEvent; cdecl;//Deprecated
    {class} procedure outEvent; cdecl;//Deprecated
    {class} procedure timerEvent(id: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/poll/IPollEvents')]
  JIPollEvents = interface(IJavaInstance)
    ['{74DDB012-8D7D-4503-B5E8-676203A07DC7}']
    procedure acceptEvent; cdecl;//Deprecated
    procedure connectEvent; cdecl;//Deprecated
  end;
  TJIPollEvents = class(TJavaGenericImport<JIPollEventsClass, JIPollEvents>) end;

  JPollItemClass = interface(JObjectClass)
    ['{C0AF8961-E6FF-4E02-BA71-C70096D4868F}']
    {class} function init(socket: JSocketBase; ops: Integer): JPollItem; cdecl; overload;//Deprecated
    {class} function init(channel: JSelectableChannel; ops: Integer): JPollItem; cdecl; overload;//Deprecated
    {class} function getChannel: JSelectableChannel; cdecl;
    {class} function getRawSocket: JSelectableChannel; cdecl;
    {class} function getSocket: JSocketBase; cdecl;
    {class} function isError: Boolean; cdecl;
    {class} function isReadable: Boolean; cdecl;
    {class} function isWritable: Boolean; cdecl;
  end;

  [JavaSignature('zmq/poll/PollItem')]
  JPollItem = interface(JObject)
    ['{2F36C390-FA15-46F2-9282-8F3E2493BA43}']
    function hasEvent(events: Integer): Boolean; cdecl;
    function interestOps: Integer; cdecl; overload;
    function interestOps(ops: Integer): Integer; cdecl; overload;
    function readyOps(key: JSelectionKey; nevents: Integer): Integer; cdecl; overload;
    function readyOps: Integer; cdecl; overload;
    function zinterestOps: Integer; cdecl;
  end;
  TJPollItem = class(TJavaGenericImport<JPollItemClass, JPollItem>) end;

  JPollerClass = interface(JObjectClass)
    ['{E1970B73-3B21-4815-B09D-31305B39C876}']
    {class} function init(ctx: JCtx; name: JString): JPoller; cdecl;//Deprecated
    {class} function addHandle(fd: JSelectableChannel; events: JIPollEvents): JPoller_Handle; cdecl;//Deprecated
    {class} procedure resetPollOut(handle: JPoller_Handle); cdecl;//Deprecated
    {class} procedure run; cdecl;//Deprecated
    {class} procedure setPollAccept(handle: JPoller_Handle); cdecl;//Deprecated
    {class} procedure start; cdecl;//Deprecated
    {class} procedure stop; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/poll/Poller')]
  JPoller = interface(JObject)
    ['{D3B45219-610B-4B7E-9B85-B93BD08D0F02}']
    procedure destroy; cdecl;//Deprecated
    procedure removeHandle(handle: JPoller_Handle); cdecl;//Deprecated
    procedure resetPollIn(handle: JPoller_Handle); cdecl;//Deprecated
    procedure setPollConnect(handle: JPoller_Handle); cdecl;//Deprecated
    procedure setPollIn(handle: JPoller_Handle); cdecl;//Deprecated
    procedure setPollOut(handle: JPoller_Handle); cdecl;//Deprecated
  end;
  TJPoller = class(TJavaGenericImport<JPollerClass, JPoller>) end;

  JPoller_HandleClass = interface(JObjectClass)
    ['{4D1AB732-3D50-4935-BC96-7471D99B7217}']
    {class} function init(fd: JSelectableChannel; handler: JIPollEvents): JPoller_Handle; cdecl;//Deprecated
    {class} function equals(other: JObject): Boolean; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/poll/Poller$Handle')]
  JPoller_Handle = interface(JObject)
    ['{3ED3A0F8-3A31-4325-8CB1-B2E32EE1075A}']
    function toString: JString; cdecl;//Deprecated
  end;
  TJPoller_Handle = class(TJavaGenericImport<JPoller_HandleClass, JPoller_Handle>) end;

  JFQClass = interface(JObjectClass)
    ['{BBA888CB-DF02-4970-8F3C-3D2D5886BC41}']
    {class} function init: JFQ; cdecl;//Deprecated
    {class} procedure activated(pipe: Jpipe_Pipe); cdecl;
    {class} procedure attach(pipe: Jpipe_Pipe); cdecl;
    {class} function getCredential: Jutil_Blob; cdecl;
    {class} procedure terminated(pipe: Jpipe_Pipe); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/FQ')]
  JFQ = interface(JObject)
    ['{6A73A94C-C49E-4A0E-86D0-76DD297E0444}']
    function hasIn: Boolean; cdecl;
    function recv(errno: JErrno): JMsg; cdecl;
    function recvPipe(errno: JErrno; pipe: JValueReference): JMsg; cdecl;
  end;
  TJFQ = class(TJavaGenericImport<JFQClass, JFQ>) end;

  JLBClass = interface(JObjectClass)
    ['{A4EAF816-205E-4957-AD08-E9B30E35BE7B}']
    {class} function init: JLB; cdecl;//Deprecated
    {class} procedure activated(pipe: Jpipe_Pipe); cdecl;
    {class} procedure attach(pipe: Jpipe_Pipe); cdecl;
    {class} function hasOut: Boolean; cdecl;
  end;

  [JavaSignature('zmq/socket/LB')]
  JLB = interface(JObject)
    ['{4B2AA450-9AD6-45EA-97CB-37C13E136EE1}']
    function sendpipe(msg: JMsg; errno: JErrno; pipe: JValueReference): Boolean; cdecl;
    procedure terminated(pipe: Jpipe_Pipe); cdecl;
  end;
  TJLB = class(TJavaGenericImport<JLBClass, JLB>) end;

  Jsocket_PairClass = interface(JSocketBaseClass)
    ['{6315FF09-AD37-4682-B916-61855D00143E}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): Jsocket_Pair; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/Pair')]
  Jsocket_Pair = interface(JSocketBase)
    ['{8465F0B2-1296-4E01-8D46-6D1AE61288DC}']
  end;
  TJsocket_Pair = class(TJavaGenericImport<Jsocket_PairClass, Jsocket_Pair>) end;

  JSocketsClass = interface(JEnumClass)
    ['{C7C7E436-7E84-4E73-88E6-63E70FAEB5A5}']
    {class} function _GetDEALER: JSockets; cdecl;
    {class} function _GetPAIR: JSockets; cdecl;
    {class} function _GetPUB: JSockets; cdecl;
    {class} function _GetPULL: JSockets; cdecl;
    {class} function _GetPUSH: JSockets; cdecl;
    {class} function _GetREP: JSockets; cdecl;
    {class} function _GetREQ: JSockets; cdecl;
    {class} function _GetROUTER: JSockets; cdecl;
    {class} function _GetSTREAM: JSockets; cdecl;
    {class} function _GetSUB: JSockets; cdecl;
    {class} function _GetXPUB: JSockets; cdecl;
    {class} function _GetXSUB: JSockets; cdecl;
    {class} function compatible(self: Integer; peer: JString): Boolean; cdecl;//Deprecated
    {class} function create(socketType: Integer; parent: JCtx; tid: Integer; sid: Integer): JSocketBase; cdecl; overload;
    {class} function createSession(ioThread: JIOThread; connect: Boolean; socket: JSocketBase; options: JOptions; addr: Jnet_Address): JSessionBase; cdecl;//Deprecated
    {class} function fromType(socketType: Integer): JSockets; cdecl;
    {class} function name(socketType: Integer): JString; cdecl;//Deprecated
    {class} function valueOf(name: JString): JSockets; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JSockets>; cdecl;//Deprecated
    {class} property DEALER: JSockets read _GetDEALER;
    {class} property PAIR: JSockets read _GetPAIR;
    {class} property PUB: JSockets read _GetPUB;
    {class} property PULL: JSockets read _GetPULL;
    {class} property PUSH: JSockets read _GetPUSH;
    {class} property REP: JSockets read _GetREP;
    {class} property REQ: JSockets read _GetREQ;
    {class} property ROUTER: JSockets read _GetROUTER;
    {class} property STREAM: JSockets read _GetSTREAM;
    {class} property SUB: JSockets read _GetSUB;
    {class} property XPUB: JSockets read _GetXPUB;
    {class} property XSUB: JSockets read _GetXSUB;
  end;

  [JavaSignature('zmq/socket/Sockets')]
  JSockets = interface(JEnum)
    ['{36576053-6233-4850-961E-1FD3DB62EBDA}']
    function create(ioThread: JIOThread; connect: Boolean; socket: JSocketBase; options: JOptions; addr: Jnet_Address): JSessionBase; cdecl; overload;//Deprecated
  end;
  TJSockets = class(TJavaGenericImport<JSocketsClass, JSockets>) end;

  Jsocket_StreamClass = interface(JSocketBaseClass)
    ['{A3E5C473-89F2-46A9-AF39-4E8DDFE31EF3}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): Jsocket_Stream; cdecl;//Deprecated
    {class} function xrecv: JMsg; cdecl;
  end;

  [JavaSignature('zmq/socket/Stream')]
  Jsocket_Stream = interface(JSocketBase)
    ['{BAC863F0-B6DB-47B0-8D3C-C5EC52FB1471}']
  end;
  TJsocket_Stream = class(TJavaGenericImport<Jsocket_StreamClass, Jsocket_Stream>) end;

  JPullClass = interface(JSocketBaseClass)
    ['{E32C10B6-98B4-401F-B43A-3213432AD509}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JPull; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pipeline/Pull')]
  JPull = interface(JSocketBase)
    ['{7479B740-721F-4435-8085-B97490597715}']
    function xrecv: JMsg; cdecl;//Deprecated
  end;
  TJPull = class(TJavaGenericImport<JPullClass, JPull>) end;

  JPushClass = interface(JSocketBaseClass)
    ['{C935BA08-B8BF-4E6B-9FDB-ACB751D0E636}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JPush; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pipeline/Push')]
  JPush = interface(JSocketBase)
    ['{75C377B4-1059-4971-9F8A-197A94C9BAB9}']
    function xsend(msg: JMsg): Boolean; cdecl;//Deprecated
  end;
  TJPush = class(TJavaGenericImport<JPushClass, JPush>) end;

  JMtrie_IMtrieHandlerClass = interface(IJavaClass)
    ['{C2BBC7A0-0BA5-490B-9C21-DE5BEB520426}']
    {class} procedure invoke(pipe: Jpipe_Pipe; data: TJavaArray<Byte>; size: Integer; arg: JXPub); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pubsub/Mtrie$IMtrieHandler')]
  JMtrie_IMtrieHandler = interface(IJavaInstance)
    ['{AC6E4E15-0F32-4F49-B37B-A67604893816}']
  end;
  TJMtrie_IMtrieHandler = class(TJavaGenericImport<JMtrie_IMtrieHandlerClass, JMtrie_IMtrieHandler>) end;

  JXPubClass = interface(JSocketBaseClass)
    ['{73D89A78-7E13-4D8A-A06E-7F9B429E08BD}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JXPub; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pubsub/XPub')]
  JXPub = interface(JSocketBase)
    ['{FD17FC3C-4AC8-4415-9338-B556B426B3A7}']
    function xsetsockopt(option: Integer; optval: JObject): Boolean; cdecl;//Deprecated
  end;
  TJXPub = class(TJavaGenericImport<JXPubClass, JXPub>) end;

  JPubClass = interface(JXPubClass)
    ['{350603AA-6765-4DBA-8450-0F07C46D52DB}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JPub; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pubsub/Pub')]
  JPub = interface(JXPub)
    ['{EAD149FB-7E17-45FE-8DAF-8D8F36F8C9B6}']
  end;
  TJPub = class(TJavaGenericImport<JPubClass, JPub>) end;

  JXSubClass = interface(JSocketBaseClass)
    ['{203A8636-5BD3-41BF-97CB-679DCB08A3D3}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JXSub; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pubsub/XSub')]
  JXSub = interface(JSocketBase)
    ['{5E9AEEDC-56C6-43AF-AD50-8DEB842ABC14}']
  end;
  TJXSub = class(TJavaGenericImport<JXSubClass, JXSub>) end;

  JSubClass = interface(JXSubClass)
    ['{E8B150E7-0DDE-46AC-98A2-5E5D2FD532B4}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JSub; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/pubsub/Sub')]
  JSub = interface(JXSub)
    ['{64BF34F3-FCC7-468E-BE88-CE90124A8EBD}']
    function xsetsockopt(option: Integer; optval: JObject): Boolean; cdecl;
  end;
  TJSub = class(TJavaGenericImport<JSubClass, JSub>) end;

  JTrie_ITrieHandlerClass = interface(IJavaClass)
    ['{C807931B-A073-4054-98DD-803BF968E7EB}']
    {class} procedure added(data: TJavaArray<Byte>; size: Integer; arg: Jpipe_Pipe); cdecl;
  end;

  [JavaSignature('zmq/socket/pubsub/Trie$ITrieHandler')]
  JTrie_ITrieHandler = interface(IJavaInstance)
    ['{7C8D590E-9FA2-4A06-8C8B-758693DE0A52}']
  end;
  TJTrie_ITrieHandler = class(TJavaGenericImport<JTrie_ITrieHandlerClass, JTrie_ITrieHandler>) end;

  JDealerClass = interface(JSocketBaseClass)
    ['{719A65F4-B40F-4924-8438-E88257128940}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JDealer; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/reqrep/Dealer')]
  JDealer = interface(JSocketBase)
    ['{52F9F0A7-027C-4E27-A2CD-2B287F5BD5E3}']
  end;
  TJDealer = class(TJavaGenericImport<JDealerClass, JDealer>) end;

  JRouterClass = interface(JSocketBaseClass)
    ['{0FD62DF1-12BA-4179-AB41-7EC472097100}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JRouter; cdecl;//Deprecated
    {class} function xsetsockopt(option: Integer; optval: JObject): Boolean; cdecl;//Deprecated
    {class} procedure xwriteActivated(pipe: Jpipe_Pipe); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/reqrep/Router')]
  JRouter = interface(JSocketBase)
    ['{956C3555-D1E9-44CF-89A1-202714D1E49F}']
    procedure xattachPipe(pipe: Jpipe_Pipe; subscribe2all: Boolean; isLocallyInitiated: Boolean); cdecl;//Deprecated
    procedure xpipeTerminated(pipe: Jpipe_Pipe); cdecl;//Deprecated
    procedure xreadActivated(pipe: Jpipe_Pipe); cdecl;//Deprecated
  end;
  TJRouter = class(TJavaGenericImport<JRouterClass, JRouter>) end;

  JRepClass = interface(JRouterClass)
    ['{F8C3BF4E-1822-459F-8FF5-F3B40993454A}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JRep; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/socket/reqrep/Rep')]
  JRep = interface(JRouter)
    ['{C571102F-2664-4B57-BAED-BB4777236D4F}']
  end;
  TJRep = class(TJavaGenericImport<JRepClass, JRep>) end;

  JReqClass = interface(JDealerClass)
    ['{095A776A-309D-4F6A-943A-320B46B764F6}']
    {class} function init(parent: JCtx; tid: Integer; sid: Integer): JReq; cdecl;//Deprecated
    {class} function xhasOut: Boolean; cdecl;
    {class} function xsend(msg: JMsg): Boolean; cdecl;
  end;

  [JavaSignature('zmq/socket/reqrep/Req')]
  JReq = interface(JDealer)
    ['{BDBB018D-19EA-4078-B49C-66326F2AFA28}']
    function xhasIn: Boolean; cdecl;//Deprecated
  end;
  TJReq = class(TJavaGenericImport<JReqClass, JReq>) end;

  JReq_ReqSessionClass = interface(JSessionBaseClass)
    ['{B854B5D8-7B26-43E4-8CE3-3E8844AAACE6}']
    {class} function init(ioThread: JIOThread; connect: Boolean; socket: JSocketBase; options: JOptions; addr: Jnet_Address): JReq_ReqSession; cdecl;//Deprecated
    {class} function pushMsg(msg: JMsg): Boolean; cdecl;
  end;

  [JavaSignature('zmq/socket/reqrep/Req$ReqSession')]
  JReq_ReqSession = interface(JSessionBase)
    ['{A776DF31-EC45-41C9-A562-A9BB71C40AF5}']
    procedure reset; cdecl;
  end;
  TJReq_ReqSession = class(TJavaGenericImport<JReq_ReqSessionClass, JReq_ReqSession>) end;

  Jutil_BlobClass = interface(JObjectClass)
    ['{2F242F5C-2BED-4481-9013-B4D2B79998D8}']
    {class} function createBlob(msg: JMsg): Jutil_Blob; cdecl; overload;
    {class} function createBlob(data: TJavaArray<Byte>): Jutil_Blob; cdecl; overload;
    {class} function hashCode: Integer; cdecl;
    {class} function size: Integer; cdecl;
  end;

  [JavaSignature('zmq/util/Blob')]
  Jutil_Blob = interface(JObject)
    ['{598EE92F-9DEB-42D1-AB7E-7F2A2878BB34}']
    function data: TJavaArray<Byte>; cdecl;
    function equals(t: JObject): Boolean; cdecl;
  end;
  TJutil_Blob = class(TJavaGenericImport<Jutil_BlobClass, Jutil_Blob>) end;

  Jutil_ClockClass = interface(JObjectClass)
    ['{BD94FB95-3791-42DB-B8C2-C8AF7ECA42BA}']
    {class} function nowMS: Int64; cdecl;
    {class} function nowNS: Int64; cdecl;
    {class} function nowUS: Int64; cdecl;
    {class} function rdtsc: Int64; cdecl;
  end;

  [JavaSignature('zmq/util/Clock')]
  Jutil_Clock = interface(JObject)
    ['{621209B5-5F1E-4650-87A3-C2A6F4ED59EB}']
  end;
  TJutil_Clock = class(TJavaGenericImport<Jutil_ClockClass, Jutil_Clock>) end;

  JDraftClass = interface(JObjectClass)
    ['{79973A9C-26C0-43EB-A29A-99A8BA9F5D5E}']
  end;

  [JavaSignature('zmq/util/Draft')]
  JDraft = interface(JObject)
    ['{136C8393-FD05-4CF9-9E3D-41C7BB123F47}']
  end;
  TJDraft = class(TJavaGenericImport<JDraftClass, JDraft>) end;

  JErrnoClass = interface(JObjectClass)
    ['{1C415D11-2096-405A-806D-DE1A99F90417}']
    {class} function init: JErrno; cdecl;//Deprecated
    {class} function &is(err: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/util/Errno')]
  JErrno = interface(JObject)
    ['{D4F44E13-FEDC-417B-A558-B2C611C0A15E}']
    function &get: Integer; cdecl;
    procedure &set(errno: Integer); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJErrno = class(TJavaGenericImport<JErrnoClass, JErrno>) end;

  JMultiMapClass = interface(JObjectClass)
    ['{56FA71E1-5014-4ED7-BCF2-90C5BD006330}']
    {class} function init: JMultiMap; cdecl;//Deprecated
    {class} function &contains(value: JObject): Boolean; cdecl;//Deprecated
    {class} function hasValues(key: JComparable): Boolean; cdecl;//Deprecated
    {class} function remove(key: JComparable): JCollection; cdecl; overload;//Deprecated
    {class} function remove(value: JObject): Boolean; cdecl; overload;//Deprecated
    {class} function remove(key: JComparable; value: JObject): Boolean; cdecl; overload;//Deprecated
  end;

  [JavaSignature('zmq/util/MultiMap')]
  JMultiMap = interface(JObject)
    ['{3FA0E174-308E-4504-BF41-1A7B4797DED2}']
    procedure clear; cdecl;//Deprecated
    function entries: JCollection; cdecl;//Deprecated
    function find(copy: JObject): JObject; cdecl;//Deprecated
    function insert(key: JComparable; value: JObject): Boolean; cdecl;//Deprecated
    function isEmpty: Boolean; cdecl;//Deprecated
    function key(value: JObject): JComparable; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
    function values: JCollection; cdecl;//Deprecated
  end;
  TJMultiMap = class(TJavaGenericImport<JMultiMapClass, JMultiMap>) end;

  Jutil_ObjectsClass = interface(JObjectClass)
    ['{C1B51364-E517-4797-95FA-368BFEC0443C}']
    {class} function requireNonNull(object_: JObject; msg: JString): JObject; cdecl;
  end;

  [JavaSignature('zmq/util/Objects')]
  Jutil_Objects = interface(JObject)
    ['{33E2C82C-E0C4-4983-AAC4-2C1A9EA5B345}']
  end;
  TJutil_Objects = class(TJavaGenericImport<Jutil_ObjectsClass, Jutil_Objects>) end;

  JTimersClass = interface(JObjectClass)
    ['{0E52FD85-D614-4560-ACB9-61D01E346930}']
    {class} function init: JTimers; cdecl; overload;//Deprecated
    {class} function init(clock: Jfunction_Supplier): JTimers; cdecl; overload;//Deprecated
    {class} function execute: Integer; cdecl;
    {class} function reset(timer: JTimers_Timer): Boolean; cdecl;//Deprecated
    {class} function setInterval(timer: JTimers_Timer; interval: Int64): Boolean; cdecl;//Deprecated
    {class} function timeout: Int64; cdecl;
  end;

  [JavaSignature('zmq/util/Timers')]
  JTimers = interface(JObject)
    ['{FF83D921-7260-4F70-B3DD-78AA24F3E20D}']
    function cancel(timer: JTimers_Timer): Boolean; cdecl;//Deprecated
    function sleepAndExecute: Integer; cdecl;
  end;
  TJTimers = class(TJavaGenericImport<JTimersClass, JTimers>) end;

  JTimers_TimerClass = interface(JObjectClass)
    ['{4C33A8F3-C555-4D7B-8A42-925AAE3F702D}']
    {class} function cancel: Boolean; cdecl;//Deprecated
    {class} function reset: Boolean; cdecl;//Deprecated
    {class} function setInterval(interval: Int64): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/util/Timers$Timer')]
  JTimers_Timer = interface(JObject)
    ['{5CF74B48-60E0-466B-9668-3B3D1B558A4C}']
  end;
  TJTimers_Timer = class(TJavaGenericImport<JTimers_TimerClass, JTimers_Timer>) end;

  Jutil_UtilsClass = interface(JObjectClass)
    ['{F6C9AA4E-02DC-4D4D-ABD4-3109AE5AB487}']
    {class} function bytes(buf: JByteBuffer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure checkArgument(expression: Boolean; errorMessage: JString); cdecl; overload;//Deprecated
    {class} procedure checkArgument(expression: Boolean; errorMessage: Jfunction_Supplier); cdecl; overload;//Deprecated
    {class} function delete(path: JFile): Boolean; cdecl;//Deprecated
    {class} function dump(buffer: JByteBuffer; pos: Integer; limit: Integer): JString; cdecl;//Deprecated
    {class} function findOpenPort: Integer; cdecl;//Deprecated
    {class} function getPeerIpAddress(fd: JSocketChannel): Jnet_Address; cdecl;//Deprecated
    {class} function randomBytes(length: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function randomInt: Integer; cdecl;//Deprecated
    {class} function realloc(klass: Jlang_Class; src: TJavaObjectArray<JObject>; size: Integer; ended: Boolean): TJavaObjectArray<JObject>; cdecl; overload;//Deprecated
    {class} function realloc(src: TJavaArray<Byte>; size: Integer): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function unhash(port: Integer): JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/util/Utils')]
  Jutil_Utils = interface(JObject)
    ['{BDD843EF-7E9B-4523-B2C7-78F2B309CD45}']
  end;
  TJutil_Utils = class(TJavaGenericImport<Jutil_UtilsClass, Jutil_Utils>) end;

  JValueReferenceClass = interface(JObjectClass)
    ['{388EDF5B-8CF3-43CF-9DEF-D5430EBCD5AC}']
    {class} function init(value: JObject): JValueReference; cdecl; overload;//Deprecated
    {class} function init: JValueReference; cdecl; overload;//Deprecated
    {class} function &get: JObject; cdecl;//Deprecated
    {class} procedure &set(value: JObject); cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('zmq/util/ValueReference')]
  JValueReference = interface(JObject)
    ['{34FFAE58-B0A6-4D45-A14D-DD98B98A5AF7}']
  end;
  TJValueReference = class(TJavaGenericImport<JValueReferenceClass, JValueReference>) end;

  Jutil_WireClass = interface(JObjectClass)
    ['{2872EBF3-91A2-419B-B25A-0494DF42CF64}']
    {class} function getLongString(buf: JByteBuffer; offset: Integer): JString; cdecl; overload;//Deprecated
    {class} function getLongString(charset: JCharset; buf: JByteBuffer; offset: Integer): JString; cdecl; overload;//Deprecated
    {class} function getShortString(buf: JByteBuffer; offset: Integer): JString; cdecl; overload;//Deprecated
    {class} function getShortString(charset: JCharset; buf: JByteBuffer; offset: Integer): JString; cdecl; overload;//Deprecated
    {class} function getUInt16(bytes: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function getUInt16(buf: JByteBuffer; offset: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getUInt32(buf: JByteBuffer): Integer; cdecl; overload;//Deprecated
    {class} function getUInt32(buf: JByteBuffer; offset: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getUInt32(msg: JMsg; offset: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getUInt32(bytes: TJavaArray<Byte>; offset: Integer): Integer; cdecl; overload;//Deprecated
    {class} function getUInt64(buf: JByteBuffer; offset: Integer): Int64; cdecl; overload;//Deprecated
    {class} function getUInt64(msg: JMsg; offset: Integer): Int64; cdecl; overload;//Deprecated
    {class} function putLongString(buf: JByteBuffer; value: JString): Integer; cdecl; overload;//Deprecated
    {class} function putLongString(charset: JCharset; buf: JByteBuffer; value: JString): Integer; cdecl; overload;//Deprecated
    {class} function putShortString(buf: JByteBuffer; value: JString): Integer; cdecl; overload;//Deprecated
    {class} function putShortString(charset: JCharset; buf: JByteBuffer; value: JString): Integer; cdecl; overload;
    {class} function putUInt16(value: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function putUInt16(msg: JMsg; value: Integer): JMsg; cdecl; overload;
    {class} function putUInt16(buf: JByteBuffer; value: Integer): JByteBuffer; cdecl; overload;
    {class} function putUInt32(buf: JByteBuffer; value: Integer): JByteBuffer; cdecl; overload;
    {class} function putUInt32(value: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function putUInt32(msg: JMsg; value: Integer): JMsg; cdecl; overload;
    {class} function putUInt64(buf: JByteBuffer; value: Int64): JByteBuffer; cdecl;
  end;

  [JavaSignature('zmq/util/Wire')]
  Jutil_Wire = interface(JObject)
    ['{D292ED98-DB6B-4C37-ADEE-3103BE830A49}']
  end;
  TJutil_Wire = class(TJavaGenericImport<Jutil_WireClass, Jutil_Wire>) end;

  JZ85Class = interface(JObjectClass)
    ['{3DDC7AB4-C854-4472-B73F-014CF11D5BB0}']
    {class} function decode(string_: JString): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function encode(data: TJavaArray<Byte>; size: Integer): JString; cdecl;
  end;

  [JavaSignature('zmq/util/Z85')]
  JZ85 = interface(JObject)
    ['{0BAC91AD-5AB4-4A8A-A0B4-DB0E765C9042}']
  end;
  TJZ85 = class(TJavaGenericImport<JZ85Class, JZ85>) end;

  Jfunction_BiFunctionClass = interface(IJavaClass)
    ['{FDEE306A-A961-4CD7-A6F5-18ABAE7F212D}']
  end;

  [JavaSignature('zmq/util/function/BiFunction')]
  Jfunction_BiFunction = interface(IJavaInstance)
    ['{72F28E84-C4D3-4D43-84F9-424B5F84D686}']
    function apply(t: JObject; u: JObject): JObject; cdecl;
  end;
  TJfunction_BiFunction = class(TJavaGenericImport<Jfunction_BiFunctionClass, Jfunction_BiFunction>) end;

  Jfunction_ConsumerClass = interface(IJavaClass)
    ['{411D3810-7715-468F-9CEC-BC3FD4249891}']
    {class} procedure accept(t: JObject); cdecl;//Deprecated
  end;

  [JavaSignature('zmq/util/function/Consumer')]
  Jfunction_Consumer = interface(IJavaInstance)
    ['{BD557403-3D19-4ABB-B1B9-D9C8F9F21D81}']
  end;
  TJfunction_Consumer = class(TJavaGenericImport<Jfunction_ConsumerClass, Jfunction_Consumer>) end;

  Jfunction_FunctionClass = interface(IJavaClass)
    ['{1DF14280-FF23-4709-A7F2-9ECBE7804ECD}']
    {class} function apply(t: JObject): JObject; cdecl;
  end;

  [JavaSignature('zmq/util/function/Function')]
  Jfunction_Function = interface(IJavaInstance)
    ['{892DE891-E127-4E2B-A25F-7DEC27FE366B}']
  end;
  TJfunction_Function = class(TJavaGenericImport<Jfunction_FunctionClass, Jfunction_Function>) end;

  Jfunction_SupplierClass = interface(IJavaClass)
    ['{5FBE215A-8BE7-4AF9-B753-91DE0282716C}']
  end;

  [JavaSignature('zmq/util/function/Supplier')]
  Jfunction_Supplier = interface(IJavaInstance)
    ['{65D97F3F-7175-4B1B-832B-120BDCC0710A}']
    function &get: JObject; cdecl;//Deprecated
  end;
  TJfunction_Supplier = class(TJavaGenericImport<Jfunction_SupplierClass, Jfunction_Supplier>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.JeroMQ.JDataInput', TypeInfo(Android.JeroMQ.JDataInput));
  TRegTypes.RegisterType('Android.JeroMQ.JFilterInputStream', TypeInfo(Android.JeroMQ.JFilterInputStream));
  TRegTypes.RegisterType('Android.JeroMQ.JDataInputStream', TypeInfo(Android.JeroMQ.JDataInputStream));
  TRegTypes.RegisterType('Android.JeroMQ.JDataOutputStream', TypeInfo(Android.JeroMQ.JDataOutputStream));
  TRegTypes.RegisterType('Android.JeroMQ.JAtomicInteger', TypeInfo(Android.JeroMQ.JAtomicInteger));
  TRegTypes.RegisterType('Android.JeroMQ.JSocketType', TypeInfo(Android.JeroMQ.JSocketType));
  TRegTypes.RegisterType('Android.JeroMQ.JUncheckedZMQException', TypeInfo(Android.JeroMQ.JUncheckedZMQException));
  TRegTypes.RegisterType('Android.JeroMQ.Jzeromq_Utils', TypeInfo(Android.JeroMQ.Jzeromq_Utils));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar', TypeInfo(Android.JeroMQ.JZStar));
  TRegTypes.RegisterType('Android.JeroMQ.JZActor', TypeInfo(Android.JeroMQ.JZActor));
  TRegTypes.RegisterType('Android.JeroMQ.JZActor_Actor', TypeInfo(Android.JeroMQ.JZActor_Actor));
  TRegTypes.RegisterType('Android.JeroMQ.JZActor_Duo', TypeInfo(Android.JeroMQ.JZActor_Duo));
  TRegTypes.RegisterType('Android.JeroMQ.JZActor_SimpleActor', TypeInfo(Android.JeroMQ.JZActor_SimpleActor));
  TRegTypes.RegisterType('Android.JeroMQ.JZAgent', TypeInfo(Android.JeroMQ.JZAgent));
  TRegTypes.RegisterType('Android.JeroMQ.JZAgent_Creator', TypeInfo(Android.JeroMQ.JZAgent_Creator));
  TRegTypes.RegisterType('Android.JeroMQ.JZAgent_SelectorCreator', TypeInfo(Android.JeroMQ.JZAgent_SelectorCreator));
  TRegTypes.RegisterType('Android.JeroMQ.JZAgent_SimpleAgent', TypeInfo(Android.JeroMQ.JZAgent_SimpleAgent));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth', TypeInfo(Android.JeroMQ.JZAuth));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_Auth', TypeInfo(Android.JeroMQ.JZAuth_Auth));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_SimpleCurveAuth', TypeInfo(Android.JeroMQ.JZAuth_SimpleCurveAuth));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_SimpleNullAuth', TypeInfo(Android.JeroMQ.JZAuth_SimpleNullAuth));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_SimplePlainAuth', TypeInfo(Android.JeroMQ.JZAuth_SimplePlainAuth));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_ZapReply', TypeInfo(Android.JeroMQ.JZAuth_ZapReply));
  TRegTypes.RegisterType('Android.JeroMQ.JZAuth_ZapRequest', TypeInfo(Android.JeroMQ.JZAuth_ZapRequest));
  TRegTypes.RegisterType('Android.JeroMQ.JZBeacon', TypeInfo(Android.JeroMQ.JZBeacon));
  TRegTypes.RegisterType('Android.JeroMQ.JZBeacon_Builder', TypeInfo(Android.JeroMQ.JZBeacon_Builder));
  TRegTypes.RegisterType('Android.JeroMQ.JZBeacon_Listener', TypeInfo(Android.JeroMQ.JZBeacon_Listener));
  TRegTypes.RegisterType('Android.JeroMQ.JZCert', TypeInfo(Android.JeroMQ.JZCert));
  TRegTypes.RegisterType('Android.JeroMQ.JZCertStore', TypeInfo(Android.JeroMQ.JZCertStore));
  TRegTypes.RegisterType('Android.JeroMQ.JZCertStore_Fingerprinter', TypeInfo(Android.JeroMQ.JZCertStore_Fingerprinter));
  TRegTypes.RegisterType('Android.JeroMQ.JZCertStore_Hasher', TypeInfo(Android.JeroMQ.JZCertStore_Hasher));
  TRegTypes.RegisterType('Android.JeroMQ.JZCertStore_Timestamper', TypeInfo(Android.JeroMQ.JZCertStore_Timestamper));
  TRegTypes.RegisterType('Android.JeroMQ.JZConfig', TypeInfo(Android.JeroMQ.JZConfig));
  TRegTypes.RegisterType('Android.JeroMQ.JZConfig_ReadException', TypeInfo(Android.JeroMQ.JZConfig_ReadException));
  TRegTypes.RegisterType('Android.JeroMQ.JZContext', TypeInfo(Android.JeroMQ.JZContext));
  TRegTypes.RegisterType('Android.JeroMQ.JZFrame', TypeInfo(Android.JeroMQ.JZFrame));
  TRegTypes.RegisterType('Android.JeroMQ.JZLoop', TypeInfo(Android.JeroMQ.JZLoop));
  TRegTypes.RegisterType('Android.JeroMQ.JZLoop_IZLoopHandler', TypeInfo(Android.JeroMQ.JZLoop_IZLoopHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ', TypeInfo(Android.JeroMQ.JZMQ));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Context', TypeInfo(Android.JeroMQ.JZMQ_Context));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Curve', TypeInfo(Android.JeroMQ.JZMQ_Curve));
  TRegTypes.RegisterType('Android.JeroMQ.JCurve_KeyPair', TypeInfo(Android.JeroMQ.JCurve_KeyPair));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Error', TypeInfo(Android.JeroMQ.JZMQ_Error));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Event', TypeInfo(Android.JeroMQ.JZMQ_Event));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_PollItem', TypeInfo(Android.JeroMQ.JZMQ_PollItem));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Poller', TypeInfo(Android.JeroMQ.JZMQ_Poller));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQ_Socket', TypeInfo(Android.JeroMQ.JZMQ_Socket));
  TRegTypes.RegisterType('Android.JeroMQ.JSocket_Mechanism', TypeInfo(Android.JeroMQ.JSocket_Mechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQException', TypeInfo(Android.JeroMQ.JZMQException));
  TRegTypes.RegisterType('Android.JeroMQ.JZMQQueue', TypeInfo(Android.JeroMQ.JZMQQueue));
  TRegTypes.RegisterType('Android.JeroMQ.JZMonitor', TypeInfo(Android.JeroMQ.JZMonitor));
  TRegTypes.RegisterType('Android.JeroMQ.JZMonitor_Event', TypeInfo(Android.JeroMQ.JZMonitor_Event));
  TRegTypes.RegisterType('Android.JeroMQ.JZMonitor_ZEvent', TypeInfo(Android.JeroMQ.JZMonitor_ZEvent));
  TRegTypes.RegisterType('Android.JeroMQ.JZMsg', TypeInfo(Android.JeroMQ.JZMsg));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller', TypeInfo(Android.JeroMQ.JZPoller));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_ComposeEventsHandler', TypeInfo(Android.JeroMQ.JZPoller_ComposeEventsHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_EventsHandler', TypeInfo(Android.JeroMQ.JZPoller_EventsHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_ItemCreator', TypeInfo(Android.JeroMQ.JZPoller_ItemCreator));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_ItemHolder', TypeInfo(Android.JeroMQ.JZPoller_ItemHolder));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_SimpleCreator', TypeInfo(Android.JeroMQ.JZPoller_SimpleCreator));
  TRegTypes.RegisterType('Android.JeroMQ.JZPoller_ZPollItem', TypeInfo(Android.JeroMQ.JZPoller_ZPollItem));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy', TypeInfo(Android.JeroMQ.JZProxy));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_Command', TypeInfo(Android.JeroMQ.JZProxy_Command));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_Plug', TypeInfo(Android.JeroMQ.JZProxy_Plug));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_Proxy', TypeInfo(Android.JeroMQ.JZProxy_Proxy));
  TRegTypes.RegisterType('Android.JeroMQ.JProxy_SimpleProxy', TypeInfo(Android.JeroMQ.JProxy_SimpleProxy));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_Pump', TypeInfo(Android.JeroMQ.JZProxy_Pump));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_State', TypeInfo(Android.JeroMQ.JZProxy_State));
  TRegTypes.RegisterType('Android.JeroMQ.JZProxy_ZPump', TypeInfo(Android.JeroMQ.JZProxy_ZPump));
  TRegTypes.RegisterType('Android.JeroMQ.JZPump_Transformer', TypeInfo(Android.JeroMQ.JZPump_Transformer));
  TRegTypes.RegisterType('Android.JeroMQ.JZSocket', TypeInfo(Android.JeroMQ.JZSocket));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_TimeTaker', TypeInfo(Android.JeroMQ.JZStar_TimeTaker));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_Entourage', TypeInfo(Android.JeroMQ.JZStar_Entourage));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_Exit', TypeInfo(Android.JeroMQ.JZStar_Exit));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_Fortune', TypeInfo(Android.JeroMQ.JZStar_Fortune));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_Set', TypeInfo(Android.JeroMQ.JZStar_Set));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_SimpleSet', TypeInfo(Android.JeroMQ.JZStar_SimpleSet));
  TRegTypes.RegisterType('Android.JeroMQ.JZStar_Star', TypeInfo(Android.JeroMQ.JZStar_Star));
  TRegTypes.RegisterType('Android.JeroMQ.JZThread', TypeInfo(Android.JeroMQ.JZThread));
  TRegTypes.RegisterType('Android.JeroMQ.JZThread_IAttachedRunnable', TypeInfo(Android.JeroMQ.JZThread_IAttachedRunnable));
  TRegTypes.RegisterType('Android.JeroMQ.JZThread_IDetachedRunnable', TypeInfo(Android.JeroMQ.JZThread_IDetachedRunnable));
  TRegTypes.RegisterType('Android.JeroMQ.JZTimer', TypeInfo(Android.JeroMQ.JZTimer));
  TRegTypes.RegisterType('Android.JeroMQ.JTimers_Handler', TypeInfo(Android.JeroMQ.JTimers_Handler));
  TRegTypes.RegisterType('Android.JeroMQ.JTimerHandler', TypeInfo(Android.JeroMQ.JTimerHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JZTimer_Handler', TypeInfo(Android.JeroMQ.JZTimer_Handler));
  TRegTypes.RegisterType('Android.JeroMQ.JZTimer_Timer', TypeInfo(Android.JeroMQ.JZTimer_Timer));
  TRegTypes.RegisterType('Android.JeroMQ.JZNeedle', TypeInfo(Android.JeroMQ.JZNeedle));
  TRegTypes.RegisterType('Android.JeroMQ.JZPicture', TypeInfo(Android.JeroMQ.JZPicture));
  TRegTypes.RegisterType('Android.JeroMQ.JZTicker', TypeInfo(Android.JeroMQ.JZTicker));
  TRegTypes.RegisterType('Android.JeroMQ.JZTicket', TypeInfo(Android.JeroMQ.JZTicket));
  TRegTypes.RegisterType('Android.JeroMQ.JZTicket_Ticket', TypeInfo(Android.JeroMQ.JZTicket_Ticket));
  TRegTypes.RegisterType('Android.JeroMQ.Jtimer_ZTimer', TypeInfo(Android.JeroMQ.Jtimer_ZTimer));
  TRegTypes.RegisterType('Android.JeroMQ.Jtimer_ZTimer_Timer', TypeInfo(Android.JeroMQ.Jtimer_ZTimer_Timer));
  TRegTypes.RegisterType('Android.JeroMQ.JZData', TypeInfo(Android.JeroMQ.JZData));
  TRegTypes.RegisterType('Android.JeroMQ.JZDigest', TypeInfo(Android.JeroMQ.JZDigest));
  TRegTypes.RegisterType('Android.JeroMQ.JZMetadata', TypeInfo(Android.JeroMQ.JZMetadata));
  TRegTypes.RegisterType('Android.JeroMQ.JCommand', TypeInfo(Android.JeroMQ.JCommand));
  TRegTypes.RegisterType('Android.JeroMQ.JCommand_Type', TypeInfo(Android.JeroMQ.JCommand_Type));
  TRegTypes.RegisterType('Android.JeroMQ.Jzmq_Config', TypeInfo(Android.JeroMQ.Jzmq_Config));
  TRegTypes.RegisterType('Android.JeroMQ.JCtx', TypeInfo(Android.JeroMQ.JCtx));
  TRegTypes.RegisterType('Android.JeroMQ.JCtx_Endpoint', TypeInfo(Android.JeroMQ.JCtx_Endpoint));
  TRegTypes.RegisterType('Android.JeroMQ.JMailbox', TypeInfo(Android.JeroMQ.JMailbox));
  TRegTypes.RegisterType('Android.JeroMQ.JMsg', TypeInfo(Android.JeroMQ.JMsg));
  TRegTypes.RegisterType('Android.JeroMQ.JMsg_Builder', TypeInfo(Android.JeroMQ.JMsg_Builder));
  TRegTypes.RegisterType('Android.JeroMQ.JOptions', TypeInfo(Android.JeroMQ.JOptions));
  TRegTypes.RegisterType('Android.JeroMQ.JZObject', TypeInfo(Android.JeroMQ.JZObject));
  TRegTypes.RegisterType('Android.JeroMQ.JOwn', TypeInfo(Android.JeroMQ.JOwn));
  TRegTypes.RegisterType('Android.JeroMQ.JSocketBase', TypeInfo(Android.JeroMQ.JSocketBase));
  TRegTypes.RegisterType('Android.JeroMQ.Jzmq_Utils', TypeInfo(Android.JeroMQ.Jzmq_Utils));
  TRegTypes.RegisterType('Android.JeroMQ.JZError', TypeInfo(Android.JeroMQ.JZError));
  TRegTypes.RegisterType('Android.JeroMQ.JZError_CtxTerminatedException', TypeInfo(Android.JeroMQ.JZError_CtxTerminatedException));
  TRegTypes.RegisterType('Android.JeroMQ.JZError_IOException', TypeInfo(Android.JeroMQ.JZError_IOException));
  TRegTypes.RegisterType('Android.JeroMQ.JZError_InstantiationException', TypeInfo(Android.JeroMQ.JZError_InstantiationException));
  TRegTypes.RegisterType('Android.JeroMQ.Jzmq_ZMQ', TypeInfo(Android.JeroMQ.Jzmq_ZMQ));
  TRegTypes.RegisterType('Android.JeroMQ.Jzmq_ZMQ_Event', TypeInfo(Android.JeroMQ.Jzmq_ZMQ_Event));
  TRegTypes.RegisterType('Android.JeroMQ.JEngineNotImplemented', TypeInfo(Android.JeroMQ.JEngineNotImplemented));
  TRegTypes.RegisterType('Android.JeroMQ.JIEngine', TypeInfo(Android.JeroMQ.JIEngine));
  TRegTypes.RegisterType('Android.JeroMQ.JIOObject', TypeInfo(Android.JeroMQ.JIOObject));
  TRegTypes.RegisterType('Android.JeroMQ.JIOThread', TypeInfo(Android.JeroMQ.JIOThread));
  TRegTypes.RegisterType('Android.JeroMQ.Jio_Metadata', TypeInfo(Android.JeroMQ.Jio_Metadata));
  TRegTypes.RegisterType('Android.JeroMQ.JMetadata_ParseListener', TypeInfo(Android.JeroMQ.JMetadata_ParseListener));
  TRegTypes.RegisterType('Android.JeroMQ.JMsgs', TypeInfo(Android.JeroMQ.JMsgs));
  TRegTypes.RegisterType('Android.JeroMQ.JSessionBase', TypeInfo(Android.JeroMQ.JSessionBase));
  TRegTypes.RegisterType('Android.JeroMQ.JStreamEngine', TypeInfo(Android.JeroMQ.JStreamEngine));
  TRegTypes.RegisterType('Android.JeroMQ.JStreamEngine_ErrorReason', TypeInfo(Android.JeroMQ.JStreamEngine_ErrorReason));
  TRegTypes.RegisterType('Android.JeroMQ.JDecoderBase', TypeInfo(Android.JeroMQ.JDecoderBase));
  TRegTypes.RegisterType('Android.JeroMQ.Jcoder_Decoder', TypeInfo(Android.JeroMQ.Jcoder_Decoder));
  TRegTypes.RegisterType('Android.JeroMQ.JEncoderBase', TypeInfo(Android.JeroMQ.JEncoderBase));
  TRegTypes.RegisterType('Android.JeroMQ.Jcoder_Encoder', TypeInfo(Android.JeroMQ.Jcoder_Encoder));
  TRegTypes.RegisterType('Android.JeroMQ.JIDecoder', TypeInfo(Android.JeroMQ.JIDecoder));
  TRegTypes.RegisterType('Android.JeroMQ.JIDecoder_Step', TypeInfo(Android.JeroMQ.JIDecoder_Step));
  TRegTypes.RegisterType('Android.JeroMQ.JStep_Result', TypeInfo(Android.JeroMQ.JStep_Result));
  TRegTypes.RegisterType('Android.JeroMQ.JIEncoder', TypeInfo(Android.JeroMQ.JIEncoder));
  TRegTypes.RegisterType('Android.JeroMQ.JRawDecoder', TypeInfo(Android.JeroMQ.JRawDecoder));
  TRegTypes.RegisterType('Android.JeroMQ.JRawEncoder', TypeInfo(Android.JeroMQ.JRawEncoder));
  TRegTypes.RegisterType('Android.JeroMQ.JV1Decoder', TypeInfo(Android.JeroMQ.JV1Decoder));
  TRegTypes.RegisterType('Android.JeroMQ.JV1Encoder', TypeInfo(Android.JeroMQ.JV1Encoder));
  TRegTypes.RegisterType('Android.JeroMQ.JV1Protocol', TypeInfo(Android.JeroMQ.JV1Protocol));
  TRegTypes.RegisterType('Android.JeroMQ.JV2Decoder', TypeInfo(Android.JeroMQ.JV2Decoder));
  TRegTypes.RegisterType('Android.JeroMQ.JV2Encoder', TypeInfo(Android.JeroMQ.JV2Encoder));
  TRegTypes.RegisterType('Android.JeroMQ.JV2Protocol', TypeInfo(Android.JeroMQ.JV2Protocol));
  TRegTypes.RegisterType('Android.JeroMQ.JMechanism', TypeInfo(Android.JeroMQ.JMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JMechanism_Status', TypeInfo(Android.JeroMQ.JMechanism_Status));
  TRegTypes.RegisterType('Android.JeroMQ.JMechanisms', TypeInfo(Android.JeroMQ.JMechanisms));
  TRegTypes.RegisterType('Android.JeroMQ.JCurve', TypeInfo(Android.JeroMQ.JCurve));
  TRegTypes.RegisterType('Android.JeroMQ.JCurveClientMechanism', TypeInfo(Android.JeroMQ.JCurveClientMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JCurveServerMechanism', TypeInfo(Android.JeroMQ.JCurveServerMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JGssapiClientMechanism', TypeInfo(Android.JeroMQ.JGssapiClientMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JGssapiServerMechanism', TypeInfo(Android.JeroMQ.JGssapiServerMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JPlainClientMechanism', TypeInfo(Android.JeroMQ.JPlainClientMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.JPlainServerMechanism', TypeInfo(Android.JeroMQ.JPlainServerMechanism));
  TRegTypes.RegisterType('Android.JeroMQ.Jnet_Address', TypeInfo(Android.JeroMQ.Jnet_Address));
  TRegTypes.RegisterType('Android.JeroMQ.JAddress_IZAddress', TypeInfo(Android.JeroMQ.JAddress_IZAddress));
  TRegTypes.RegisterType('Android.JeroMQ.JNetProtocol', TypeInfo(Android.JeroMQ.JNetProtocol));
  TRegTypes.RegisterType('Android.JeroMQ.Jnet_ProtocolFamily', TypeInfo(Android.JeroMQ.Jnet_ProtocolFamily));
  TRegTypes.RegisterType('Android.JeroMQ.JSelectorProviderChooser', TypeInfo(Android.JeroMQ.JSelectorProviderChooser));
  TRegTypes.RegisterType('Android.JeroMQ.Jnet_StandardProtocolFamily', TypeInfo(Android.JeroMQ.Jnet_StandardProtocolFamily));
  TRegTypes.RegisterType('Android.JeroMQ.JIpcAddress', TypeInfo(Android.JeroMQ.JIpcAddress));
  TRegTypes.RegisterType('Android.JeroMQ.JTcpAddress', TypeInfo(Android.JeroMQ.JTcpAddress));
  TRegTypes.RegisterType('Android.JeroMQ.JIpcAddress_IpcAddressMask', TypeInfo(Android.JeroMQ.JIpcAddress_IpcAddressMask));
  TRegTypes.RegisterType('Android.JeroMQ.JTcpConnecter', TypeInfo(Android.JeroMQ.JTcpConnecter));
  TRegTypes.RegisterType('Android.JeroMQ.JIpcConnecter', TypeInfo(Android.JeroMQ.JIpcConnecter));
  TRegTypes.RegisterType('Android.JeroMQ.JTcpListener', TypeInfo(Android.JeroMQ.JTcpListener));
  TRegTypes.RegisterType('Android.JeroMQ.JIpcListener', TypeInfo(Android.JeroMQ.JIpcListener));
  TRegTypes.RegisterType('Android.JeroMQ.JNormEngine', TypeInfo(Android.JeroMQ.JNormEngine));
  TRegTypes.RegisterType('Android.JeroMQ.JPgmReceiver', TypeInfo(Android.JeroMQ.JPgmReceiver));
  TRegTypes.RegisterType('Android.JeroMQ.JPgmSender', TypeInfo(Android.JeroMQ.JPgmSender));
  TRegTypes.RegisterType('Android.JeroMQ.JSocksConnecter', TypeInfo(Android.JeroMQ.JSocksConnecter));
  TRegTypes.RegisterType('Android.JeroMQ.JTcpAddress_TcpAddressMask', TypeInfo(Android.JeroMQ.JTcpAddress_TcpAddressMask));
  TRegTypes.RegisterType('Android.JeroMQ.JTcpUtils', TypeInfo(Android.JeroMQ.JTcpUtils));
  TRegTypes.RegisterType('Android.JeroMQ.JTipcConnecter', TypeInfo(Android.JeroMQ.JTipcConnecter));
  TRegTypes.RegisterType('Android.JeroMQ.JTipcListener', TypeInfo(Android.JeroMQ.JTipcListener));
  TRegTypes.RegisterType('Android.JeroMQ.JMsgAllocator', TypeInfo(Android.JeroMQ.JMsgAllocator));
  TRegTypes.RegisterType('Android.JeroMQ.JMsgAllocatorDirect', TypeInfo(Android.JeroMQ.JMsgAllocatorDirect));
  TRegTypes.RegisterType('Android.JeroMQ.JMsgAllocatorHeap', TypeInfo(Android.JeroMQ.JMsgAllocatorHeap));
  TRegTypes.RegisterType('Android.JeroMQ.JMsgAllocatorThreshold', TypeInfo(Android.JeroMQ.JMsgAllocatorThreshold));
  TRegTypes.RegisterType('Android.JeroMQ.Jpipe_Pipe', TypeInfo(Android.JeroMQ.Jpipe_Pipe));
  TRegTypes.RegisterType('Android.JeroMQ.JPipe_IPipeEvents', TypeInfo(Android.JeroMQ.JPipe_IPipeEvents));
  TRegTypes.RegisterType('Android.JeroMQ.JYPipe', TypeInfo(Android.JeroMQ.JYPipe));
  TRegTypes.RegisterType('Android.JeroMQ.JYPipeBase', TypeInfo(Android.JeroMQ.JYPipeBase));
  TRegTypes.RegisterType('Android.JeroMQ.JYPipeConflate', TypeInfo(Android.JeroMQ.JYPipeConflate));
  TRegTypes.RegisterType('Android.JeroMQ.JIPollEvents', TypeInfo(Android.JeroMQ.JIPollEvents));
  TRegTypes.RegisterType('Android.JeroMQ.JPollItem', TypeInfo(Android.JeroMQ.JPollItem));
  TRegTypes.RegisterType('Android.JeroMQ.JPoller', TypeInfo(Android.JeroMQ.JPoller));
  TRegTypes.RegisterType('Android.JeroMQ.JPoller_Handle', TypeInfo(Android.JeroMQ.JPoller_Handle));
  TRegTypes.RegisterType('Android.JeroMQ.JFQ', TypeInfo(Android.JeroMQ.JFQ));
  TRegTypes.RegisterType('Android.JeroMQ.JLB', TypeInfo(Android.JeroMQ.JLB));
  TRegTypes.RegisterType('Android.JeroMQ.Jsocket_Pair', TypeInfo(Android.JeroMQ.Jsocket_Pair));
  TRegTypes.RegisterType('Android.JeroMQ.JSockets', TypeInfo(Android.JeroMQ.JSockets));
  TRegTypes.RegisterType('Android.JeroMQ.Jsocket_Stream', TypeInfo(Android.JeroMQ.Jsocket_Stream));
  TRegTypes.RegisterType('Android.JeroMQ.JPull', TypeInfo(Android.JeroMQ.JPull));
  TRegTypes.RegisterType('Android.JeroMQ.JPush', TypeInfo(Android.JeroMQ.JPush));
  TRegTypes.RegisterType('Android.JeroMQ.JMtrie_IMtrieHandler', TypeInfo(Android.JeroMQ.JMtrie_IMtrieHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JXPub', TypeInfo(Android.JeroMQ.JXPub));
  TRegTypes.RegisterType('Android.JeroMQ.JPub', TypeInfo(Android.JeroMQ.JPub));
  TRegTypes.RegisterType('Android.JeroMQ.JXSub', TypeInfo(Android.JeroMQ.JXSub));
  TRegTypes.RegisterType('Android.JeroMQ.JSub', TypeInfo(Android.JeroMQ.JSub));
  TRegTypes.RegisterType('Android.JeroMQ.JTrie_ITrieHandler', TypeInfo(Android.JeroMQ.JTrie_ITrieHandler));
  TRegTypes.RegisterType('Android.JeroMQ.JDealer', TypeInfo(Android.JeroMQ.JDealer));
  TRegTypes.RegisterType('Android.JeroMQ.JRouter', TypeInfo(Android.JeroMQ.JRouter));
  TRegTypes.RegisterType('Android.JeroMQ.JRep', TypeInfo(Android.JeroMQ.JRep));
  TRegTypes.RegisterType('Android.JeroMQ.JReq', TypeInfo(Android.JeroMQ.JReq));
  TRegTypes.RegisterType('Android.JeroMQ.JReq_ReqSession', TypeInfo(Android.JeroMQ.JReq_ReqSession));
  TRegTypes.RegisterType('Android.JeroMQ.Jutil_Blob', TypeInfo(Android.JeroMQ.Jutil_Blob));
  TRegTypes.RegisterType('Android.JeroMQ.Jutil_Clock', TypeInfo(Android.JeroMQ.Jutil_Clock));
  TRegTypes.RegisterType('Android.JeroMQ.JDraft', TypeInfo(Android.JeroMQ.JDraft));
  TRegTypes.RegisterType('Android.JeroMQ.JErrno', TypeInfo(Android.JeroMQ.JErrno));
  TRegTypes.RegisterType('Android.JeroMQ.JMultiMap', TypeInfo(Android.JeroMQ.JMultiMap));
  TRegTypes.RegisterType('Android.JeroMQ.Jutil_Objects', TypeInfo(Android.JeroMQ.Jutil_Objects));
  TRegTypes.RegisterType('Android.JeroMQ.JTimers', TypeInfo(Android.JeroMQ.JTimers));
  TRegTypes.RegisterType('Android.JeroMQ.JTimers_Timer', TypeInfo(Android.JeroMQ.JTimers_Timer));
  TRegTypes.RegisterType('Android.JeroMQ.Jutil_Utils', TypeInfo(Android.JeroMQ.Jutil_Utils));
  TRegTypes.RegisterType('Android.JeroMQ.JValueReference', TypeInfo(Android.JeroMQ.JValueReference));
  TRegTypes.RegisterType('Android.JeroMQ.Jutil_Wire', TypeInfo(Android.JeroMQ.Jutil_Wire));
  TRegTypes.RegisterType('Android.JeroMQ.JZ85', TypeInfo(Android.JeroMQ.JZ85));
  TRegTypes.RegisterType('Android.JeroMQ.Jfunction_BiFunction', TypeInfo(Android.JeroMQ.Jfunction_BiFunction));
  TRegTypes.RegisterType('Android.JeroMQ.Jfunction_Consumer', TypeInfo(Android.JeroMQ.Jfunction_Consumer));
  TRegTypes.RegisterType('Android.JeroMQ.Jfunction_Function', TypeInfo(Android.JeroMQ.Jfunction_Function));
  TRegTypes.RegisterType('Android.JeroMQ.Jfunction_Supplier', TypeInfo(Android.JeroMQ.Jfunction_Supplier));
end;

initialization
  RegisterTypes;
end.

