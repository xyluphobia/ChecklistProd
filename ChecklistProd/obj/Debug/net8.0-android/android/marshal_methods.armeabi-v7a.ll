; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [348 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [690 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 257
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 291
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 57725457, ; 8: it\Microsoft.Data.SqlClient.resources => 0x370d211 => 302
	i32 57727992, ; 9: ja\Microsoft.Data.SqlClient.resources => 0x370dbf8 => 303
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 342
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 203
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 275
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 275
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 295
	i32 139659294, ; 20: ja/Microsoft.Data.SqlClient.resources.dll => 0x853081e => 303
	i32 142721839, ; 21: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 231
	i32 166535111, ; 25: ru/Microsoft.Data.SqlClient.resources.dll => 0x9ed1fc7 => 306
	i32 172961045, ; 26: Syncfusion.Maui.Core.dll => 0xa4f2d15 => 207
	i32 176265551, ; 27: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 28: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 277
	i32 184328833, ; 29: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 30: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 339
	i32 199333315, ; 31: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 340
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 229
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 251
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 234
	i32 264223668, ; 41: zh-Hans\Microsoft.Data.SqlClient.resources => 0xfbfbbb4 => 307
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 253
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 250
	i32 280992041, ; 45: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 311
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 339
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 220
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 330147069, ; 51: Microsoft.SqlServer.Server => 0x13ada4fd => 204
	i32 336156722, ; 52: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 324
	i32 342366114, ; 53: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 252
	i32 356389973, ; 54: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 323
	i32 360082299, ; 55: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 376991480, ; 59: en-US/Syncfusion.Maui.Buttons.resources.dll => 0x16786ef8 => 343
	i32 379916513, ; 60: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 61: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 62: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 63: _Microsoft.Android.Resource.Designer => 0x17969339 => 344
	i32 403441872, ; 64: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 65: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 335
	i32 441335492, ; 66: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 235
	i32 442565967, ; 67: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 68: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 248
	i32 451504562, ; 69: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 70: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 71: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 72: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 73: System.dll => 0x1bff388e => 164
	i32 476646585, ; 74: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 250
	i32 485463106, ; 75: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 192
	i32 486930444, ; 76: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 263
	i32 498788369, ; 77: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 78: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 322
	i32 503918385, ; 79: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 316
	i32 513247710, ; 80: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 189
	i32 526420162, ; 81: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 82: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 295
	i32 530272170, ; 83: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 84: Microsoft.Extensions.Logging => 0x20216150 => 185
	i32 540030774, ; 85: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 86: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 87: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 88: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 179
	i32 549171840, ; 89: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 90: Jsr305Binding => 0x213954e7 => 288
	i32 568561038, ; 91: Syncfusion.Maui.ProgressBar.dll => 0x21e38d8e => 208
	i32 569601784, ; 92: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 286
	i32 577335427, ; 93: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 94: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 330
	i32 597488923, ; 95: CommunityToolkit.Maui => 0x239cf51b => 176
	i32 601371474, ; 96: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 97: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 98: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 623678609, ; 99: Syncfusion.Maui.ProgressBar => 0x252c9491 => 208
	i32 627609679, ; 100: Xamarin.AndroidX.CustomView => 0x2568904f => 240
	i32 627931235, ; 101: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 328
	i32 639843206, ; 102: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 246
	i32 643868501, ; 103: System.Net => 0x2660a755 => 81
	i32 662205335, ; 104: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 105: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 282
	i32 666292255, ; 106: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 227
	i32 672442732, ; 107: System.Collections.Concurrent => 0x2814a96c => 8
	i32 676419328, ; 108: en-US\Syncfusion.Maui.Buttons.resources => 0x28515700 => 343
	i32 683518922, ; 109: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 110: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 310
	i32 690569205, ; 111: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 112: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 297
	i32 693804605, ; 113: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 114: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 115: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 292
	i32 700358131, ; 116: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 117: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 325
	i32 709557578, ; 118: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 313
	i32 720511267, ; 119: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 296
	i32 722857257, ; 120: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 121: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 122: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 123: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 217
	i32 759454413, ; 124: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 125: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775189201, ; 126: System.Data.SqlClient.dll => 0x2e3472d1 => 210
	i32 775507847, ; 127: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 128: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 334
	i32 789151979, ; 129: Microsoft.Extensions.Options => 0x2f0980eb => 188
	i32 790371945, ; 130: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 241
	i32 804715423, ; 131: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 132: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 255
	i32 823281589, ; 133: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 134: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 135: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 136: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 137: Xamarin.AndroidX.Print => 0x3246f6cd => 268
	i32 873119928, ; 138: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 139: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 140: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 141: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 142: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 143: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 337
	i32 928116545, ; 144: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 291
	i32 952186615, ; 145: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 146: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 296
	i32 966729478, ; 147: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 289
	i32 967690846, ; 148: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 252
	i32 975236339, ; 149: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 150: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 151: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 152: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 153: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 154: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 155: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 156: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 272
	i32 1019214401, ; 157: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 158: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 184
	i32 1029334545, ; 159: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 312
	i32 1031528504, ; 160: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 290
	i32 1035644815, ; 161: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 225
	i32 1036536393, ; 162: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 163: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048439329, ; 164: de/Microsoft.Data.SqlClient.resources.dll => 0x3e7dea21 => 299
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 259
	i32 1062017875, ; 166: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 191
	i32 1065976540, ; 167: ChecklistProd => 0x3f8982dc => 0
	i32 1067306892, ; 168: GoogleGson => 0x3f9dcf8c => 178
	i32 1082857460, ; 169: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 170: Xamarin.Kotlin.StdLib => 0x409e66d8 => 293
	i32 1089913930, ; 171: System.Diagnostics.EventLog.dll => 0x40f6c44a => 211
	i32 1098259244, ; 172: System => 0x41761b2c => 164
	i32 1118262833, ; 173: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 325
	i32 1121599056, ; 174: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 258
	i32 1127624469, ; 175: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 187
	i32 1138436374, ; 176: Microsoft.Data.SqlClient.dll => 0x43db2916 => 180
	i32 1149092582, ; 177: Xamarin.AndroidX.Window => 0x447dc2e6 => 285
	i32 1168523401, ; 178: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 331
	i32 1170634674, ; 179: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 180: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 281
	i32 1178241025, ; 181: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 266
	i32 1203215381, ; 182: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 329
	i32 1204270330, ; 183: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 227
	i32 1208641965, ; 184: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 185: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 186: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 327
	i32 1243150071, ; 187: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 286
	i32 1253011324, ; 188: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 189: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 311
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 276
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 280
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 232
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 297
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 224
	i32 1293217323, ; 195: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 243
	i32 1309188875, ; 196: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 197: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 285
	i32 1324164729, ; 198: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 199: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 200: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 201: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 341
	i32 1376866003, ; 202: Xamarin.AndroidX.SavedState => 0x52114ed3 => 272
	i32 1379779777, ; 203: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 236
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 209: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 309
	i32 1434145427, ; 210: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 211: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 289
	i32 1439761251, ; 212: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 213: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 214: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 215: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 216: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 217: System.IdentityModel.Tokens.Jwt => 0x57137723 => 212
	i32 1461004990, ; 218: es\Microsoft.Maui.Controls.resources => 0x57152abe => 315
	i32 1461234159, ; 219: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 220: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 221: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 222: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 226
	i32 1470490898, ; 223: Microsoft.Extensions.Primitives => 0x57a5e912 => 189
	i32 1479771757, ; 224: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 225: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 226: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 227: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 273
	i32 1493001747, ; 228: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 319
	i32 1498168481, ; 229: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 193
	i32 1514721132, ; 230: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 314
	i32 1536373174, ; 231: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1537889881, ; 232: Syncfusion.Maui.Buttons.dll => 0x5baa5659 => 206
	i32 1543031311, ; 233: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 234: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 235: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 236: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 334
	i32 1565310744, ; 237: System.Runtime.Caching => 0x5d4cbf18 => 214
	i32 1565862583, ; 238: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 239: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 240: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 241: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 242: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 243: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 242
	i32 1592978981, ; 244: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1596263029, ; 245: zh-Hant\Microsoft.Data.SqlClient.resources => 0x5f250a75 => 308
	i32 1596911864, ; 246: Syncfusion.Maui.Buttons => 0x5f2ef0f8 => 206
	i32 1597949149, ; 247: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 290
	i32 1601112923, ; 248: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 249: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 250: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 251: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 262
	i32 1622358360, ; 252: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 253: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 284
	i32 1628113371, ; 254: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 196
	i32 1634654947, ; 255: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 177
	i32 1635184631, ; 256: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 246
	i32 1636350590, ; 257: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 239
	i32 1639515021, ; 258: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 259: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 260: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 261: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 262: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 278
	i32 1658251792, ; 263: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 287
	i32 1670060433, ; 264: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 234
	i32 1675553242, ; 265: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 266: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 267: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 268: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 269: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 270: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 271: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 294
	i32 1701541528, ; 272: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 273: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 255
	i32 1726116996, ; 274: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 275: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 276: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 230
	i32 1736233607, ; 277: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 332
	i32 1743415430, ; 278: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 310
	i32 1744735666, ; 279: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 280: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 281: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 282: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 283: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 284: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 285: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 277
	i32 1770582343, ; 286: Microsoft.Extensions.Logging.dll => 0x6988f147 => 185
	i32 1776026572, ; 287: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 288: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 289: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 290: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 326
	i32 1788241197, ; 291: Xamarin.AndroidX.Fragment => 0x6a96652d => 248
	i32 1793755602, ; 292: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 318
	i32 1794500907, ; 293: Microsoft.Identity.Client.dll => 0x6af5e92b => 190
	i32 1796167890, ; 294: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 179
	i32 1808609942, ; 295: Xamarin.AndroidX.Loader => 0x6bcd3296 => 262
	i32 1813058853, ; 296: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 293
	i32 1813201214, ; 297: Xamarin.Google.Android.Material => 0x6c13413e => 287
	i32 1818569960, ; 298: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 267
	i32 1818787751, ; 299: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 300: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 301: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 302: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 186
	i32 1842015223, ; 303: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 338
	i32 1847515442, ; 304: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 217
	i32 1853025655, ; 305: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 335
	i32 1858542181, ; 306: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 307: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 308: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 196
	i32 1875935024, ; 309: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 317
	i32 1879696579, ; 310: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 311: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 228
	i32 1888955245, ; 312: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 313: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 314: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 315: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 316: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 317: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 318: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 319: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 274
	i32 1968388702, ; 320: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 181
	i32 1983156543, ; 321: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 294
	i32 1985761444, ; 322: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 219
	i32 1986222447, ; 323: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 197
	i32 2003115576, ; 324: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 314
	i32 2011961780, ; 325: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 326: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 259
	i32 2025202353, ; 327: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 309
	i32 2031763787, ; 328: Xamarin.Android.Glide => 0x791a414b => 216
	i32 2040764568, ; 329: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 191
	i32 2045470958, ; 330: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 331: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 254
	i32 2060060697, ; 332: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 333: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 313
	i32 2070888862, ; 334: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 335: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 336: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 337: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 338: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 339: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 340: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 341: Microsoft.Maui => 0x80bd55ad => 201
	i32 2169148018, ; 342: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 321
	i32 2181898931, ; 343: Microsoft.Extensions.Options.dll => 0x820d22b3 => 188
	i32 2192057212, ; 344: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 186
	i32 2193016926, ; 345: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 346: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 298
	i32 2201231467, ; 347: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 348: it\Microsoft.Maui.Controls.resources => 0x839595db => 323
	i32 2217644978, ; 349: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 281
	i32 2222056684, ; 350: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2228745826, ; 351: pt-BR\Microsoft.Data.SqlClient.resources => 0x84d7f662 => 305
	i32 2244775296, ; 352: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 263
	i32 2252106437, ; 353: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2253551641, ; 354: Microsoft.IdentityModel.Protocols => 0x86527819 => 195
	i32 2256313426, ; 355: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 356: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 357: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 182
	i32 2267999099, ; 358: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 218
	i32 2270573516, ; 359: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 317
	i32 2279755925, ; 360: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 270
	i32 2293034957, ; 361: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 362: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 363: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 364: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 327
	i32 2305521784, ; 365: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2309278602, ; 366: ko\Microsoft.Data.SqlClient.resources => 0x89a4cb8a => 304
	i32 2315684594, ; 367: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 222
	i32 2320631194, ; 368: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 369: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 370: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 371: System.Net.Primitives => 0x8c40e0db => 70
	i32 2354730003, ; 372: Syncfusion.Licensing => 0x8c5a5413 => 205
	i32 2368005991, ; 373: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 374: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 194
	i32 2371007202, ; 375: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 181
	i32 2378619854, ; 376: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 377: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 378: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 322
	i32 2401565422, ; 379: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 380: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 245
	i32 2421380589, ; 381: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 382: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 232
	i32 2427813419, ; 383: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 319
	i32 2435356389, ; 384: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 385: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 386: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 387: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 388: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 389: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 235
	i32 2471841756, ; 390: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 391: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 392: Microsoft.Maui.Controls => 0x93dba8a1 => 199
	i32 2483903535, ; 393: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 394: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 395: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 396: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 397: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 257
	i32 2509217888, ; 398: System.Diagnostics.EventLog => 0x958fa060 => 211
	i32 2522472828, ; 399: Xamarin.Android.Glide.dll => 0x9659e17c => 216
	i32 2538310050, ; 400: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 401: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 320
	i32 2562349572, ; 402: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 403: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 404: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 258
	i32 2581819634, ; 405: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 280
	i32 2585220780, ; 406: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 407: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 408: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 409: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 329
	i32 2605712449, ; 410: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 298
	i32 2615233544, ; 411: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 249
	i32 2616218305, ; 412: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 187
	i32 2617129537, ; 413: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 414: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 415: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 239
	i32 2624644809, ; 416: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 244
	i32 2626831493, ; 417: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 324
	i32 2627185994, ; 418: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 419: System.Memory.Data => 0x9ca74fdc => 213
	i32 2629843544, ; 420: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 421: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 253
	i32 2640290731, ; 422: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 194
	i32 2640706905, ; 423: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 424: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 215
	i32 2663391936, ; 425: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 218
	i32 2663698177, ; 426: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 427: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 428: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 429: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 430: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 431: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 432: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 433: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 278
	i32 2715334215, ; 434: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 435: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 436: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 437: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 438: Xamarin.AndroidX.Activity => 0xa2e0939b => 220
	i32 2735172069, ; 439: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 440: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 226
	i32 2740051746, ; 441: Microsoft.Identity.Client => 0xa351df22 => 190
	i32 2740948882, ; 442: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 443: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 444: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 330
	i32 2755098380, ; 445: Microsoft.SqlServer.Server.dll => 0xa437770c => 204
	i32 2758225723, ; 446: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 200
	i32 2764765095, ; 447: Microsoft.Maui.dll => 0xa4caf7a7 => 201
	i32 2765824710, ; 448: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 449: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 292
	i32 2778768386, ; 450: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 283
	i32 2779977773, ; 451: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 271
	i32 2785988530, ; 452: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 336
	i32 2788224221, ; 453: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 249
	i32 2801831435, ; 454: Microsoft.Maui.Graphics => 0xa7008e0b => 203
	i32 2803228030, ; 455: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2804509662, ; 456: es/Microsoft.Data.SqlClient.resources.dll => 0xa7296bde => 300
	i32 2806116107, ; 457: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 315
	i32 2810250172, ; 458: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 236
	i32 2819470561, ; 459: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 460: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 461: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 271
	i32 2824502124, ; 462: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 463: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 328
	i32 2838993487, ; 464: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 260
	i32 2841937114, ; 465: it/Microsoft.Data.SqlClient.resources.dll => 0xa96484da => 302
	i32 2849599387, ; 466: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 467: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 283
	i32 2855708567, ; 468: Xamarin.AndroidX.Transition => 0xaa36a797 => 279
	i32 2861098320, ; 469: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 470: Microsoft.Maui.Essentials => 0xaa8a4878 => 202
	i32 2867946736, ; 471: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 215
	i32 2868488919, ; 472: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 177
	i32 2868557005, ; 473: Syncfusion.Licensing.dll => 0xaafab4cd => 205
	i32 2870099610, ; 474: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 221
	i32 2875164099, ; 475: Jsr305Binding.dll => 0xab5f85c3 => 288
	i32 2875220617, ; 476: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 477: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 247
	i32 2887636118, ; 478: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 479: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 480: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 481: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 482: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 483: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 484: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 284
	i32 2919462931, ; 485: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 486: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 223
	i32 2936416060, ; 487: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 488: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 489: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 490: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 209
	i32 2959614098, ; 491: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 492: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2970759306, ; 493: BCrypt.Net-Next.dll => 0xb112308a => 175
	i32 2972252294, ; 494: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 495: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 243
	i32 2987532451, ; 496: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 274
	i32 2996846495, ; 497: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 256
	i32 3012788804, ; 498: System.Configuration.ConfigurationManager => 0xb3938244 => 209
	i32 3016983068, ; 499: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 276
	i32 3023353419, ; 500: WindowsBase.dll => 0xb434b64b => 165
	i32 3023511517, ; 501: ru\Microsoft.Data.SqlClient.resources => 0xb4371fdd => 306
	i32 3024354802, ; 502: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 251
	i32 3033605958, ; 503: System.Memory.Data.dll => 0xb4d12746 => 213
	i32 3038032645, ; 504: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 344
	i32 3056245963, ; 505: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 273
	i32 3057625584, ; 506: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 264
	i32 3059408633, ; 507: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 508: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 509: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 510: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 321
	i32 3084678329, ; 511: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 197
	i32 3090735792, ; 512: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 513: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 514: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 515: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 516: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 517: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 518: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 519: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3147228406, ; 520: Syncfusion.Maui.Core => 0xbb96e4f6 => 207
	i32 3148237826, ; 521: GoogleGson.dll => 0xbba64c02 => 178
	i32 3158628304, ; 522: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 0xbc44d7d0 => 308
	i32 3159123045, ; 523: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 524: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 525: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 265
	i32 3192346100, ; 526: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 527: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 528: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 529: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 530: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 242
	i32 3220365878, ; 531: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 532: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 533: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 534: Xamarin.AndroidX.CardView => 0xc235e84d => 230
	i32 3265493905, ; 535: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 536: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3268887220, ; 537: fr/Microsoft.Data.SqlClient.resources.dll => 0xc2d742b4 => 301
	i32 3276600297, ; 538: pt-BR/Microsoft.Data.SqlClient.resources.dll => 0xc34cf3e9 => 305
	i32 3277815716, ; 539: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 540: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 541: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 542: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 543: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 544: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 545: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 316
	i32 3312457198, ; 546: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 193
	i32 3316684772, ; 547: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 548: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 240
	i32 3317144872, ; 549: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 550: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 228
	i32 3343947874, ; 551: fr\Microsoft.Data.SqlClient.resources => 0xc7509862 => 301
	i32 3345895724, ; 552: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 269
	i32 3346324047, ; 553: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 266
	i32 3357674450, ; 554: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 333
	i32 3358260929, ; 555: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 556: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 221
	i32 3362522851, ; 557: Xamarin.AndroidX.Core => 0xc86c06e3 => 237
	i32 3366347497, ; 558: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 559: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 195
	i32 3374999561, ; 560: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 270
	i32 3381016424, ; 561: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 312
	i32 3395150330, ; 562: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 563: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 564: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 241
	i32 3428513518, ; 565: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 183
	i32 3429136800, ; 566: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 567: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 568: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 244
	i32 3442671072, ; 569: ChecklistProd.dll => 0xcd32fde0 => 0
	i32 3445260447, ; 570: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 571: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 198
	i32 3463511458, ; 572: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 320
	i32 3471940407, ; 573: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3472012038, ; 574: BCrypt.Net-Next => 0xcef2b306 => 175
	i32 3476120550, ; 575: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 576: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 333
	i32 3484440000, ; 577: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 332
	i32 3485117614, ; 578: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 579: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 580: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 233
	i32 3509114376, ; 581: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 582: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 583: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 584: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 585: Microsoft.Data.SqlClient => 0xd35114f1 => 180
	i32 3555084973, ; 586: de\Microsoft.Data.SqlClient.resources => 0xd3e64aad => 299
	i32 3560100363, ; 587: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 588: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 589: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 590: System.Runtime.Caching.dll => 0xd4d3289f => 214
	i32 3580758918, ; 591: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 340
	i32 3597029428, ; 592: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 219
	i32 3598340787, ; 593: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 594: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 595: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 596: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 268
	i32 3633644679, ; 597: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 223
	i32 3638274909, ; 598: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 599: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 254
	i32 3643446276, ; 600: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 337
	i32 3643854240, ; 601: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 265
	i32 3645089577, ; 602: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 603: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 182
	i32 3660523487, ; 604: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 605: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 606: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 229
	i32 3684561358, ; 607: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 233
	i32 3697841164, ; 608: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 342
	i32 3700591436, ; 609: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 192
	i32 3700866549, ; 610: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 611: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 238
	i32 3716563718, ; 612: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 613: Xamarin.AndroidX.Annotation => 0xdda814c6 => 222
	i32 3724971120, ; 614: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 264
	i32 3732100267, ; 615: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 616: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 617: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 618: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 619: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 231
	i32 3792276235, ; 620: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 621: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 198
	i32 3802395368, ; 622: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3803019198, ; 623: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 0xe2ad77be => 307
	i32 3817368567, ; 624: CommunityToolkit.Maui.dll => 0xe3886bf7 => 176
	i32 3819260425, ; 625: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 626: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 627: System.Numerics.dll => 0xe4436460 => 83
	i32 3834665012, ; 628: System.Data.SqlClient => 0xe4905834 => 210
	i32 3841636137, ; 629: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 184
	i32 3844307129, ; 630: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3848348906, ; 631: es\Microsoft.Data.SqlClient.resources => 0xe56124ea => 300
	i32 3849253459, ; 632: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 633: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 634: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 635: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 636: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 637: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 279
	i32 3888767677, ; 638: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 269
	i32 3889960447, ; 639: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 341
	i32 3896106733, ; 640: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 641: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 237
	i32 3901907137, ; 642: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 643: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 644: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 282
	i32 3928044579, ; 645: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 646: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 647: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 267
	i32 3945713374, ; 648: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 649: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 650: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 225
	i32 3959773229, ; 651: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 256
	i32 3980434154, ; 652: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 336
	i32 3987592930, ; 653: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 318
	i32 4003436829, ; 654: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 655: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 224
	i32 4025784931, ; 656: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 657: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 200
	i32 4054681211, ; 658: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 659: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 660: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 661: Microsoft.Maui.Essentials.dll => 0xf40add04 => 202
	i32 4099507663, ; 662: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 663: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 664: Xamarin.AndroidX.Emoji2 => 0xf479582c => 245
	i32 4102112229, ; 665: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 331
	i32 4125707920, ; 666: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 326
	i32 4126470640, ; 667: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 183
	i32 4127667938, ; 668: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 669: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 670: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 671: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 338
	i32 4151237749, ; 672: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 673: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 674: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 675: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 676: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 677: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 261
	i32 4185676441, ; 678: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 679: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 680: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 681: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 238
	i32 4257443520, ; 682: ko/Microsoft.Data.SqlClient.resources.dll => 0xfdc36ec0 => 304
	i32 4258378803, ; 683: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 260
	i32 4260525087, ; 684: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 685: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 212
	i32 4271975918, ; 686: Microsoft.Maui.Controls.dll => 0xfea12dee => 199
	i32 4274976490, ; 687: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 688: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 261
	i32 4294763496 ; 689: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 247
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [690 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 257, ; 3
	i32 291, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 302, ; 8
	i32 303, ; 9
	i32 30, ; 10
	i32 342, ; 11
	i32 124, ; 12
	i32 203, ; 13
	i32 102, ; 14
	i32 275, ; 15
	i32 107, ; 16
	i32 275, ; 17
	i32 139, ; 18
	i32 295, ; 19
	i32 303, ; 20
	i32 77, ; 21
	i32 124, ; 22
	i32 13, ; 23
	i32 231, ; 24
	i32 306, ; 25
	i32 207, ; 26
	i32 132, ; 27
	i32 277, ; 28
	i32 151, ; 29
	i32 339, ; 30
	i32 340, ; 31
	i32 18, ; 32
	i32 229, ; 33
	i32 26, ; 34
	i32 251, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 234, ; 40
	i32 307, ; 41
	i32 147, ; 42
	i32 253, ; 43
	i32 250, ; 44
	i32 311, ; 45
	i32 54, ; 46
	i32 69, ; 47
	i32 339, ; 48
	i32 220, ; 49
	i32 83, ; 50
	i32 204, ; 51
	i32 324, ; 52
	i32 252, ; 53
	i32 323, ; 54
	i32 131, ; 55
	i32 55, ; 56
	i32 149, ; 57
	i32 74, ; 58
	i32 343, ; 59
	i32 145, ; 60
	i32 62, ; 61
	i32 146, ; 62
	i32 344, ; 63
	i32 165, ; 64
	i32 335, ; 65
	i32 235, ; 66
	i32 12, ; 67
	i32 248, ; 68
	i32 125, ; 69
	i32 152, ; 70
	i32 113, ; 71
	i32 166, ; 72
	i32 164, ; 73
	i32 250, ; 74
	i32 192, ; 75
	i32 263, ; 76
	i32 84, ; 77
	i32 322, ; 78
	i32 316, ; 79
	i32 189, ; 80
	i32 150, ; 81
	i32 295, ; 82
	i32 60, ; 83
	i32 185, ; 84
	i32 51, ; 85
	i32 103, ; 86
	i32 114, ; 87
	i32 179, ; 88
	i32 40, ; 89
	i32 288, ; 90
	i32 208, ; 91
	i32 286, ; 92
	i32 120, ; 93
	i32 330, ; 94
	i32 176, ; 95
	i32 52, ; 96
	i32 44, ; 97
	i32 119, ; 98
	i32 208, ; 99
	i32 240, ; 100
	i32 328, ; 101
	i32 246, ; 102
	i32 81, ; 103
	i32 136, ; 104
	i32 282, ; 105
	i32 227, ; 106
	i32 8, ; 107
	i32 343, ; 108
	i32 73, ; 109
	i32 310, ; 110
	i32 155, ; 111
	i32 297, ; 112
	i32 154, ; 113
	i32 92, ; 114
	i32 292, ; 115
	i32 45, ; 116
	i32 325, ; 117
	i32 313, ; 118
	i32 296, ; 119
	i32 109, ; 120
	i32 129, ; 121
	i32 25, ; 122
	i32 217, ; 123
	i32 72, ; 124
	i32 55, ; 125
	i32 210, ; 126
	i32 46, ; 127
	i32 334, ; 128
	i32 188, ; 129
	i32 241, ; 130
	i32 22, ; 131
	i32 255, ; 132
	i32 86, ; 133
	i32 43, ; 134
	i32 160, ; 135
	i32 71, ; 136
	i32 268, ; 137
	i32 3, ; 138
	i32 42, ; 139
	i32 63, ; 140
	i32 16, ; 141
	i32 53, ; 142
	i32 337, ; 143
	i32 291, ; 144
	i32 105, ; 145
	i32 296, ; 146
	i32 289, ; 147
	i32 252, ; 148
	i32 34, ; 149
	i32 158, ; 150
	i32 85, ; 151
	i32 32, ; 152
	i32 12, ; 153
	i32 51, ; 154
	i32 56, ; 155
	i32 272, ; 156
	i32 36, ; 157
	i32 184, ; 158
	i32 312, ; 159
	i32 290, ; 160
	i32 225, ; 161
	i32 35, ; 162
	i32 58, ; 163
	i32 299, ; 164
	i32 259, ; 165
	i32 191, ; 166
	i32 0, ; 167
	i32 178, ; 168
	i32 17, ; 169
	i32 293, ; 170
	i32 211, ; 171
	i32 164, ; 172
	i32 325, ; 173
	i32 258, ; 174
	i32 187, ; 175
	i32 180, ; 176
	i32 285, ; 177
	i32 331, ; 178
	i32 153, ; 179
	i32 281, ; 180
	i32 266, ; 181
	i32 329, ; 182
	i32 227, ; 183
	i32 29, ; 184
	i32 52, ; 185
	i32 327, ; 186
	i32 286, ; 187
	i32 5, ; 188
	i32 311, ; 189
	i32 276, ; 190
	i32 280, ; 191
	i32 232, ; 192
	i32 297, ; 193
	i32 224, ; 194
	i32 243, ; 195
	i32 85, ; 196
	i32 285, ; 197
	i32 61, ; 198
	i32 112, ; 199
	i32 57, ; 200
	i32 341, ; 201
	i32 272, ; 202
	i32 99, ; 203
	i32 19, ; 204
	i32 236, ; 205
	i32 111, ; 206
	i32 101, ; 207
	i32 102, ; 208
	i32 309, ; 209
	i32 104, ; 210
	i32 289, ; 211
	i32 71, ; 212
	i32 38, ; 213
	i32 32, ; 214
	i32 103, ; 215
	i32 73, ; 216
	i32 212, ; 217
	i32 315, ; 218
	i32 9, ; 219
	i32 123, ; 220
	i32 46, ; 221
	i32 226, ; 222
	i32 189, ; 223
	i32 9, ; 224
	i32 43, ; 225
	i32 4, ; 226
	i32 273, ; 227
	i32 319, ; 228
	i32 193, ; 229
	i32 314, ; 230
	i32 31, ; 231
	i32 206, ; 232
	i32 138, ; 233
	i32 92, ; 234
	i32 93, ; 235
	i32 334, ; 236
	i32 214, ; 237
	i32 49, ; 238
	i32 141, ; 239
	i32 112, ; 240
	i32 140, ; 241
	i32 174, ; 242
	i32 242, ; 243
	i32 115, ; 244
	i32 308, ; 245
	i32 206, ; 246
	i32 290, ; 247
	i32 157, ; 248
	i32 76, ; 249
	i32 79, ; 250
	i32 262, ; 251
	i32 37, ; 252
	i32 284, ; 253
	i32 196, ; 254
	i32 177, ; 255
	i32 246, ; 256
	i32 239, ; 257
	i32 64, ; 258
	i32 138, ; 259
	i32 15, ; 260
	i32 116, ; 261
	i32 278, ; 262
	i32 287, ; 263
	i32 234, ; 264
	i32 48, ; 265
	i32 70, ; 266
	i32 80, ; 267
	i32 126, ; 268
	i32 94, ; 269
	i32 121, ; 270
	i32 294, ; 271
	i32 26, ; 272
	i32 255, ; 273
	i32 97, ; 274
	i32 28, ; 275
	i32 230, ; 276
	i32 332, ; 277
	i32 310, ; 278
	i32 149, ; 279
	i32 169, ; 280
	i32 4, ; 281
	i32 98, ; 282
	i32 33, ; 283
	i32 93, ; 284
	i32 277, ; 285
	i32 185, ; 286
	i32 21, ; 287
	i32 41, ; 288
	i32 170, ; 289
	i32 326, ; 290
	i32 248, ; 291
	i32 318, ; 292
	i32 190, ; 293
	i32 179, ; 294
	i32 262, ; 295
	i32 293, ; 296
	i32 287, ; 297
	i32 267, ; 298
	i32 2, ; 299
	i32 134, ; 300
	i32 111, ; 301
	i32 186, ; 302
	i32 338, ; 303
	i32 217, ; 304
	i32 335, ; 305
	i32 58, ; 306
	i32 95, ; 307
	i32 196, ; 308
	i32 317, ; 309
	i32 39, ; 310
	i32 228, ; 311
	i32 25, ; 312
	i32 94, ; 313
	i32 89, ; 314
	i32 99, ; 315
	i32 10, ; 316
	i32 87, ; 317
	i32 100, ; 318
	i32 274, ; 319
	i32 181, ; 320
	i32 294, ; 321
	i32 219, ; 322
	i32 197, ; 323
	i32 314, ; 324
	i32 7, ; 325
	i32 259, ; 326
	i32 309, ; 327
	i32 216, ; 328
	i32 191, ; 329
	i32 88, ; 330
	i32 254, ; 331
	i32 154, ; 332
	i32 313, ; 333
	i32 33, ; 334
	i32 116, ; 335
	i32 82, ; 336
	i32 20, ; 337
	i32 11, ; 338
	i32 162, ; 339
	i32 3, ; 340
	i32 201, ; 341
	i32 321, ; 342
	i32 188, ; 343
	i32 186, ; 344
	i32 84, ; 345
	i32 298, ; 346
	i32 64, ; 347
	i32 323, ; 348
	i32 281, ; 349
	i32 143, ; 350
	i32 305, ; 351
	i32 263, ; 352
	i32 157, ; 353
	i32 195, ; 354
	i32 41, ; 355
	i32 117, ; 356
	i32 182, ; 357
	i32 218, ; 358
	i32 317, ; 359
	i32 270, ; 360
	i32 131, ; 361
	i32 75, ; 362
	i32 66, ; 363
	i32 327, ; 364
	i32 172, ; 365
	i32 304, ; 366
	i32 222, ; 367
	i32 143, ; 368
	i32 106, ; 369
	i32 151, ; 370
	i32 70, ; 371
	i32 205, ; 372
	i32 156, ; 373
	i32 194, ; 374
	i32 181, ; 375
	i32 121, ; 376
	i32 127, ; 377
	i32 322, ; 378
	i32 152, ; 379
	i32 245, ; 380
	i32 141, ; 381
	i32 232, ; 382
	i32 319, ; 383
	i32 20, ; 384
	i32 14, ; 385
	i32 135, ; 386
	i32 75, ; 387
	i32 59, ; 388
	i32 235, ; 389
	i32 167, ; 390
	i32 168, ; 391
	i32 199, ; 392
	i32 15, ; 393
	i32 74, ; 394
	i32 6, ; 395
	i32 23, ; 396
	i32 257, ; 397
	i32 211, ; 398
	i32 216, ; 399
	i32 91, ; 400
	i32 320, ; 401
	i32 1, ; 402
	i32 136, ; 403
	i32 258, ; 404
	i32 280, ; 405
	i32 134, ; 406
	i32 69, ; 407
	i32 146, ; 408
	i32 329, ; 409
	i32 298, ; 410
	i32 249, ; 411
	i32 187, ; 412
	i32 88, ; 413
	i32 96, ; 414
	i32 239, ; 415
	i32 244, ; 416
	i32 324, ; 417
	i32 31, ; 418
	i32 213, ; 419
	i32 45, ; 420
	i32 253, ; 421
	i32 194, ; 422
	i32 173, ; 423
	i32 215, ; 424
	i32 218, ; 425
	i32 109, ; 426
	i32 158, ; 427
	i32 35, ; 428
	i32 22, ; 429
	i32 174, ; 430
	i32 114, ; 431
	i32 57, ; 432
	i32 278, ; 433
	i32 144, ; 434
	i32 118, ; 435
	i32 120, ; 436
	i32 110, ; 437
	i32 220, ; 438
	i32 139, ; 439
	i32 226, ; 440
	i32 190, ; 441
	i32 54, ; 442
	i32 105, ; 443
	i32 330, ; 444
	i32 204, ; 445
	i32 200, ; 446
	i32 201, ; 447
	i32 133, ; 448
	i32 292, ; 449
	i32 283, ; 450
	i32 271, ; 451
	i32 336, ; 452
	i32 249, ; 453
	i32 203, ; 454
	i32 159, ; 455
	i32 300, ; 456
	i32 315, ; 457
	i32 236, ; 458
	i32 163, ; 459
	i32 132, ; 460
	i32 271, ; 461
	i32 161, ; 462
	i32 328, ; 463
	i32 260, ; 464
	i32 302, ; 465
	i32 140, ; 466
	i32 283, ; 467
	i32 279, ; 468
	i32 169, ; 469
	i32 202, ; 470
	i32 215, ; 471
	i32 177, ; 472
	i32 205, ; 473
	i32 221, ; 474
	i32 288, ; 475
	i32 40, ; 476
	i32 247, ; 477
	i32 81, ; 478
	i32 56, ; 479
	i32 37, ; 480
	i32 97, ; 481
	i32 166, ; 482
	i32 172, ; 483
	i32 284, ; 484
	i32 82, ; 485
	i32 223, ; 486
	i32 98, ; 487
	i32 30, ; 488
	i32 159, ; 489
	i32 209, ; 490
	i32 18, ; 491
	i32 127, ; 492
	i32 175, ; 493
	i32 119, ; 494
	i32 243, ; 495
	i32 274, ; 496
	i32 256, ; 497
	i32 209, ; 498
	i32 276, ; 499
	i32 165, ; 500
	i32 306, ; 501
	i32 251, ; 502
	i32 213, ; 503
	i32 344, ; 504
	i32 273, ; 505
	i32 264, ; 506
	i32 170, ; 507
	i32 16, ; 508
	i32 144, ; 509
	i32 321, ; 510
	i32 197, ; 511
	i32 125, ; 512
	i32 118, ; 513
	i32 38, ; 514
	i32 115, ; 515
	i32 47, ; 516
	i32 142, ; 517
	i32 117, ; 518
	i32 34, ; 519
	i32 207, ; 520
	i32 178, ; 521
	i32 308, ; 522
	i32 95, ; 523
	i32 53, ; 524
	i32 265, ; 525
	i32 129, ; 526
	i32 153, ; 527
	i32 24, ; 528
	i32 161, ; 529
	i32 242, ; 530
	i32 148, ; 531
	i32 104, ; 532
	i32 89, ; 533
	i32 230, ; 534
	i32 60, ; 535
	i32 142, ; 536
	i32 301, ; 537
	i32 305, ; 538
	i32 100, ; 539
	i32 5, ; 540
	i32 13, ; 541
	i32 122, ; 542
	i32 135, ; 543
	i32 28, ; 544
	i32 316, ; 545
	i32 193, ; 546
	i32 72, ; 547
	i32 240, ; 548
	i32 24, ; 549
	i32 228, ; 550
	i32 301, ; 551
	i32 269, ; 552
	i32 266, ; 553
	i32 333, ; 554
	i32 137, ; 555
	i32 221, ; 556
	i32 237, ; 557
	i32 168, ; 558
	i32 195, ; 559
	i32 270, ; 560
	i32 312, ; 561
	i32 101, ; 562
	i32 123, ; 563
	i32 241, ; 564
	i32 183, ; 565
	i32 163, ; 566
	i32 167, ; 567
	i32 244, ; 568
	i32 0, ; 569
	i32 39, ; 570
	i32 198, ; 571
	i32 320, ; 572
	i32 17, ; 573
	i32 175, ; 574
	i32 171, ; 575
	i32 333, ; 576
	i32 332, ; 577
	i32 137, ; 578
	i32 150, ; 579
	i32 233, ; 580
	i32 155, ; 581
	i32 130, ; 582
	i32 19, ; 583
	i32 65, ; 584
	i32 180, ; 585
	i32 299, ; 586
	i32 147, ; 587
	i32 173, ; 588
	i32 47, ; 589
	i32 214, ; 590
	i32 340, ; 591
	i32 219, ; 592
	i32 79, ; 593
	i32 61, ; 594
	i32 106, ; 595
	i32 268, ; 596
	i32 223, ; 597
	i32 49, ; 598
	i32 254, ; 599
	i32 337, ; 600
	i32 265, ; 601
	i32 14, ; 602
	i32 182, ; 603
	i32 68, ; 604
	i32 171, ; 605
	i32 229, ; 606
	i32 233, ; 607
	i32 342, ; 608
	i32 192, ; 609
	i32 78, ; 610
	i32 238, ; 611
	i32 108, ; 612
	i32 222, ; 613
	i32 264, ; 614
	i32 67, ; 615
	i32 63, ; 616
	i32 27, ; 617
	i32 160, ; 618
	i32 231, ; 619
	i32 10, ; 620
	i32 198, ; 621
	i32 11, ; 622
	i32 307, ; 623
	i32 176, ; 624
	i32 78, ; 625
	i32 126, ; 626
	i32 83, ; 627
	i32 210, ; 628
	i32 184, ; 629
	i32 66, ; 630
	i32 300, ; 631
	i32 107, ; 632
	i32 65, ; 633
	i32 128, ; 634
	i32 122, ; 635
	i32 77, ; 636
	i32 279, ; 637
	i32 269, ; 638
	i32 341, ; 639
	i32 8, ; 640
	i32 237, ; 641
	i32 2, ; 642
	i32 44, ; 643
	i32 282, ; 644
	i32 156, ; 645
	i32 128, ; 646
	i32 267, ; 647
	i32 23, ; 648
	i32 133, ; 649
	i32 225, ; 650
	i32 256, ; 651
	i32 336, ; 652
	i32 318, ; 653
	i32 29, ; 654
	i32 224, ; 655
	i32 62, ; 656
	i32 200, ; 657
	i32 90, ; 658
	i32 87, ; 659
	i32 148, ; 660
	i32 202, ; 661
	i32 36, ; 662
	i32 86, ; 663
	i32 245, ; 664
	i32 331, ; 665
	i32 326, ; 666
	i32 183, ; 667
	i32 50, ; 668
	i32 6, ; 669
	i32 90, ; 670
	i32 338, ; 671
	i32 21, ; 672
	i32 162, ; 673
	i32 96, ; 674
	i32 50, ; 675
	i32 113, ; 676
	i32 261, ; 677
	i32 130, ; 678
	i32 76, ; 679
	i32 27, ; 680
	i32 238, ; 681
	i32 304, ; 682
	i32 260, ; 683
	i32 7, ; 684
	i32 212, ; 685
	i32 199, ; 686
	i32 110, ; 687
	i32 261, ; 688
	i32 247 ; 689
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
