" Vim syntax file
" Language:	    MQL4
" Maintainer:   phaubos <x3nox@free.fr>
" Last Change:	2012 October 15
" Based on C syntax by Bram Moolenaar

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Data types
syn keyword mql4Type    bool color datetime double int string void

" Memory classes
syn keyword mql4StorageClass    static extern

" Operators
syn keyword	mql4Statement	break continue return
syn keyword	mql4Conditional	if else switch
syn keyword	mql4Repeat		while for
syn keyword mql4Label       case default

" Boolean
syn keyword mql4Boolean     false true

" Comments
syn region mql4CommentSingle	start="//" end="$" keepend
syn region mql4CommentMulti 	start="/\*" end="\*/" keepend

" Strings
syn region mql4String   start=/"/ skip=/\\\\\|\\"\|\\/ end=/"/
syn region mql4String   start=/'/ skip=/\\\\\|\\'\|\\/ end=/'/

" Numbers
syn match mql4Number    /[0-9]\+\(\.[0-9]\+\)\?/

" Series arrays constants
syn keyword mql4Constant    MODE_OPEN MODE_LOW MODE_HIGH MODE_CLOSE MODE_VOLUME MODE_TIME

" Timeframes constants
syn keyword mql4Constant    PERIOD_M1 PERIOD_M5 PERIOD_M15 PERIOD_M30 PERIOD_H1 PERIOD_H4 PERIOD_D1 PERIOD_W1 PERIOD_MN1

" Trade operations constants
syn keyword mql4Constant    OP_BUY OP_SELL OP_BUYLIMIT OP_SELLLIMIT OP_BUYSTOP OP_SELLSTOP

" Price constants
syn keyword mql4Constant    PRICE_CLOSE PRICE_OPEN PRICE_HIGH PRICE_LOW PRICE_MEDIAN PRICE_TYPICAL PRICE_WEIGHTED

" MarketInfo constants
syn keyword mql4Constant    MODE_LOW MODE_HIGH MODE_TIME MODE_BID MODE_ASK MODE_POINT MODE_DIGITS MODE_SPREAD MODE_STOPLEVEL MODE_LOTSIZE MODE_TICKVALUE MODE_TICKSIZE MODE_SWAPLONG MODE_SWAPSHORT MODE_STARTING MODE_EXPIRATION MODE_TRADEALLOWED MODE_MINLOT MODE_LOTSTEP MODE_MAXLOT MODE_SWAPTYPE MODE_PROFITCALCMODE MODE_MARGINCALCMODE MODE_MARGININIT MODE_MARGINMAINTENANCE MODE_MARGINHEDGED MODE_MARGINREQUIRED MODE_FREEZELEVEL

" Drawing styles constants
syn keyword mql4Constant    DRAW_LINE DRAW_SECTION DRAW_HISTOGRAM DRAW_ARROW DRAW_ZIGZAG DRAW_NONE STYLE_SOLID STYLE_DASH STYLE_DOT STYLE_DASHDOT STYLE_DASHDOTDOT

" Arrow codes constants
syn keyword mql4Constant    SYMBOL_THUMBSUP SYMBOL_THUMBSDOWN SYMBOL_ARROWUP SYMBOL_ARROWDOWN SYMBOL_STOPSIGN SYMBOL_CHECKSIGN SYMBOL_LEFTPRICE SYMBOL_RIGHTPRICE

" Web colors constants
syn keyword mql4Constant    Black DarkGreen DarkSlateGray Olive Green Teal Navy Purple Maroon Indigo MidnightBlue DarkBlue DarkOliveGreen SaddleBrown ForestGreen OliveDrab SeaGreen DarkGoldenrod DarkSlateBlue Sienna MediumBlue Brown DarkTurquoise DimGray LightSeaGreen DarkViolet FireBrick MediumVioletRed MediumSeaGreen Chocolate Crimson SteelBlue Goldenrod MediumSpringGreen LawnGreen CadetBlue DarkOrchid YellowGreen LimeGreen OrangeRed DarkOrange Orange Gold Yellow Chartreuse Lime SpringGreen Aqua DeepSkyBlue Blue Magenta Red Gray SlateGray Peru BlueViolet LightSlateGray DeepPink MediumTurquoise DodgerBlue Turquoise RoyalBlue SlateBlue DarkKhaki IndianRed MediumOrchid GreenYellow MediumAquamarine DarkSeaGreen Tomato RosyBrown Orchid MediumPurple PaleVioletRed Coral CornflowerBlue DarkGray SandyBrown MediumSlateBlue Tan DarkSalmon BurlyWood HotPink Salmon Violet LightCoral SkyBlue LightSalmon Plum Khaki LightGreen Aquamarine Silver LightSkyBlue LightSteelBlue LightBlue PaleGreen Thistle PowderBlue PaleGoldenrod PaleTurquoise LightGray Wheat NavajoWhite Moccasin LightPink Gainsboro PeachPuff Pink Bisque LightGoldenrod BlanchedAlmond LemonChiffon Beige AntiqueWhite PapayaWhip Cornsilk LightYellow LightCyan Linen Lavender MistyRose OldLace WhiteSmoke Seashell Ivory Honeydew AliceBlue

" Indicator lines constants
syn keyword mql4Constant    MODE_MAIN MODE_SIGNAL MODE_PLUSDI MODE_MINUSDI MODE_UPPER MODE_LOWER

" Ichimoku Kinko Hyo constants
syn keyword mql4Constant    MODE_TENKANSEN MODE_KIJUNSEN MODE_SENKOUSPANA MODE_SENKOUSPANB MODE_CHINKOUSPAN

" Moving Average methods constants
syn keyword mql4Constant    MODE_SMA MODE_EMA MODE_SMMA MODE_LWMA

" MessageBox constants
syn keyword mql4Constant    IDOK IDCANCEL IDABORT IDRETRY IDIGNORE IDYES IDNO IDTRYAGAIN IDCONTINUE MB_OK MB_OKCANCEL MB_ABORTRETRYIGNORE MB_YESNOCANCEL MB_YESNO MB_RETRYCANCEL MB_CANCELTRYCONTINUE MB_ICONSTOP MB_ICONERROR MB_ICONHAND MB_ICONQUESTION MB_ICONEXCLAMATION MB_ICONWARNING MB_ICONINFORMATION MB_ICONASTERISK MB_DEFBUTTON1 MB_DEFBUTTON2 MB_DEFBUTTON3 MB_DEFBUTTON4 

" Object types constants
syn keyword mql4Constant    OBJ_VLINE OBJ_HLINE OBJ_TREND OBJ_TRENDBYANGLE OBJ_REGRESSION OBJ_CHANNEL OBJ_STDDEVCHANNEL OBJ_GANNLINE OBJ_GANNFAN OBJ_GANNGRID OBJ_FIBO OBJ_FIBOTIMES OBJ_FIBOFAN OBJ_FIBOARC OBJ_EXPANSION OBJ_FIBOCHANNEL OBJ_RECTANGLE OBJ_TRIANGLE OBJ_ELLIPSE OBJ_PITCHFORK OBJ_CYCLES OBJ_TEXT OBJ_ARROW OBJ_LABEL

" Object properties constants
syn keyword mql4Constant    OBJPROP_TIME1 OBJPROP_PRICE1 OBJPROP_TIME2 OBJPROP_PRICE2 OBJPROP_TIME3 OBJPROP_PRICE3 OBJPROP_COLOR OBJPROP_STYLE OBJPROP_WIDTH OBJPROP_BACK OBJPROP_RAY OBJPROP_ELLIPSE OBJPROP_SCALE OBJPROP_ANGLE OBJPROP_ARROWCODE OBJPROP_TIMEFRAMES OBJPROP_DEVIATION OBJPROP_FONTSIZE OBJPROP_CORNER OBJPROP_XDISTANCE OBJPROP_YDISTANCE OBJPROP_FIBOLEVELS OBJPROP_LEVELCOLOR OBJPROP_LEVELSTYLE OBJPROP_LEVELWIDTH OBJPROP_FIRSTLEVEL

" Object visibility constants
syn keyword mql4Constant    OBJ_PERIOD_M1 OBJ_PERIOD_M5 OBJ_PERIOD_M15 OBJ_PERIOD_M30 OBJ_PERIOD_H1 OBJ_PERIOD_H4 OBJ_PERIOD_D1 OBJ_PERIOD_W1 OBJ_PERIOD_MN1 OBJ_ALL_PERIODS NULL EMPTY

" Uninitialize reason codes constants
syn keyword mql4Constant    REASON_REMOVE REASON_RECOMPILE REASON_CHARTCHANGE REASON_CHARTCLOSE REASON_PARAMETERS REASON_ACCOUNT

" Special constants
syn keyword mql4Constant    NULL EMPTY EMPTY_VALUE CLR_NONE WHOLE_ARRAY

" Error codes constants
syn keyword mql4Constant    ERR_NO_ERROR ERR_NO_RESULT ERR_COMMON_ERROR ERR_INVALID_TRADE_PARAMETERS ERR_SERVER_BUSY ERR_OLD_VERSION ERR_NO_CONNECTION ERR_NOT_ENOUGH_RIGHTS ERR_TOO_FREQUENT_REQUESTS ERR_MALFUNCTIONAL_TRADE ERR_ACCOUNT_DISABLED ERR_INVALID_ACCOUNT ERR_TRADE_TIMEOUT ERR_INVALID_PRICE ERR_INVALID_STOPS ERR_INVALID_TRADE_VOLUME ERR_MARKET_CLOSED ERR_TRADE_DISABLED ERR_NOT_ENOUGH_MONEY ERR_PRICE_CHANGED ERR_OFF_QUOTES ERR_BROKER_BUSY ERR_REQUOTE ERR_ORDER_LOCKED ERR_LONG_POSITIONS_ONLY_ALLOWED ERR_TOO_MANY_REQUESTS ERR_TRADE_MODIFY_DENIED ERR_TRADE_CONTEXT_BUSY ERR_TRADE_EXPIRATION_DENIED ERR_TRADE_TOO_MANY_ORDERS ERR_TRADE_HEDGE_PROHIBITED ERR_TRADE_PROHIBITED_BY_FIFO ERR_NO_MQLERROR ERR_WRONG_FUNCTION_POINTER ERR_ARRAY_INDEX_OUT_OF_RANGE ERR_NO_MEMORY_FOR_CALL_STACK ERR_RECURSIVE_STACK_OVERFLOW ERR_NOT_ENOUGH_STACK_FOR_PARAM ERR_NO_MEMORY_FOR_PARAM_STRING ERR_NO_MEMORY_FOR_TEMP_STRING ERR_NOT_INITIALIZED_STRING ERR_NOT_INITIALIZED_ARRAYSTRING ERR_NO_MEMORY_FOR_ARRAYSTRING ERR_TOO_LONG_STRING ERR_REMAINDER_FROM_ZERO_DIVIDE ERR_ZERO_DIVIDE ERR_UNKNOWN_COMMAND ERR_WRONG_JUMP ERR_NOT_INITIALIZED_ARRAY ERR_DLL_CALLS_NOT_ALLOWED ERR_CANNOT_LOAD_LIBRARY ERR_CANNOT_CALL_FUNCTION ERR_EXTERNAL_CALLS_NOT_ALLOWED ERR_NO_MEMORY_FOR_RETURNED_STR ERR_SYSTEM_BUSY ERR_INVALID_FUNCTION_PARAMSCNT ERR_INVALID_FUNCTION_PARAMVALUE ERR_STRING_FUNCTION_INTERNAL ERR_SOME_ARRAY_ERROR ERR_INCORRECT_SERIESARRAY_USING ERR_CUSTOM_INDICATOR_ERROR ERR_INCOMPATIBLE_ARRAYS ERR_GLOBAL_VARIABLES_PROCESSING ERR_GLOBAL_VARIABLE_NOT_FOUND ERR_FUNC_NOT_ALLOWED_IN_TESTING ERR_FUNCTION_NOT_CONFIRMED ERR_SEND_MAIL_ERROR ERR_STRING_PARAMETER_EXPECTED ERR_INTEGER_PARAMETER_EXPECTED ERR_DOUBLE_PARAMETER_EXPECTED ERR_ARRAY_AS_PARAMETER_EXPECTED ERR_HISTORY_WILL_UPDATED ERR_TRADE_ERROR ERR_END_OF_FILE ERR_SOME_FILE_ERROR ERR_WRONG_FILE_NAME ERR_TOO_MANY_OPENED_FILES ERR_CANNOT_OPEN_FILE ERR_INCOMPATIBLE_FILEACCESS ERR_NO_ORDER_SELECTED ERR_UNKNOWN_SYMBOL ERR_INVALID_PRICE_PARAM ERR_INVALID_TICKET ERR_TRADE_NOT_ALLOWED ERR_LONGS_NOT_ALLOWED ERR_SHORTS_NOT_ALLOWED ERR_OBJECT_ALREADY_EXISTS ERR_UNKNOWN_OBJECT_PROPERTY ERR_OBJECT_DOES_NOT_EXIST ERR_UNKNOWN_OBJECT_TYPE ERR_NO_OBJECT_NAME ERR_OBJECT_COORDINATES_ERROR ERR_NO_SPECIFIED_SUBWINDOW ERR_SOME_OBJECT_ERROR ERR_NOTIFICATION_SEND_ERROR ERR_NOTIFICATION_WRONG_PARAMETER ERR_NOTIFICATION_WRONG_SETTINGS ERR_NOTIFICATION_TOO_FREQUENT

" Predefined variables
syn keyword mql4Identifier    Ask Bars Bid Close Digits High Low Open Point Time Volume

" Account information functions
syn keyword mql4Function    AccountBalance AccountCredit AccountCompany AccountCurrency AccountEquity AccountFreeMargin AccountFreeMarginCheck AccountFreeMarginMode AccountLeverage AccountMargin AccountName AccountNumber AccountProfit AccountServer AccountStopoutLevel AccountStopoutMode

" Array functions
syn keyword mql4Function    ArrayBsearch ArrayCopy ArrayCopyRates ArrayCopySeries ArrayDimension ArrayGetAsSeries ArrayInitialize ArrayIsSeries ArrayMaximum ArrayMinimum ArrayRange ArrayResize ArraySetAsSeries ArraySize ArraySort

" Array functions
syn keyword mql4Function    GetLastError IsConnected IsDemo IsDllsAllowed IsExpertEnabled IsLibrariesAllowed IsOptimization IsStopped IsTesting IsTradeAllowed IsTradeContextBusy IsVisualMode UninitializeReason

" Client terminal functions
syn keyword mql4Function    TerminalCompany TerminalName TerminalPath

" Common functions
syn keyword mql4Function    Alert Comment GetTickCount MarketInfo MessageBox PlaySound Print SendFTP SendMail SendNotification Sleep
" Conversion functions
syn keyword mql4Function    CharToStr DoubleToStr NormalizeDouble StrToDouble StrToInteger StrToTime TimeToStr

" Custom indicators functions
syn keyword mql4Function    IndicatorBuffers IndicatorCounted IndicatorDigits IndicatorShortName SetIndexArrow SetIndexBuffer SetIndexDrawBegin SetIndexEmptyValue SetIndexLabel SetIndexShift SetIndexStyle SetLevelStyle SetLevelValue

" Date & Time functions
syn keyword mql4Function    Day DayOfWeek DayOfYear Hour Minute Month Seconds TimeCurrent TimeDay TimeDayOfWeek TimeDayOfYear TimeHour TimeLocal TimeMinute TimeMonth TimeSeconds TimeYear Year

" File functions
syn keyword mql4Function    FileClose FileDelete FileFlush FileIsEnding FileIsLineEnding FileOpen FileOpenHistory FileReadArray FileReadDouble FileReadInteger FileReadNumber FileReadString FileSeek FileSize FileTell FileWrite FileWriteArray FileWriteDouble FileWriteInteger FileWriteString

" Global variables functions
syn keyword mql4Function    GlobalVariableCheck GlobalVariableDel GlobalVariableGet GlobalVariableName GlobalVariableSet GlobalVariableSetOnCondition GlobalVariablesDeleteAll GlobalVariablesTotal

" Math & Trig functions
syn keyword mql4Function    MathAbs MathArccos MathArcsin MathArctan MathCeil MathCos MathExp MathFloor MathLog MathMax MathMin MathMod MathPow MathRand MathRound MathSin MathSqrt MathSrand MathTan

" Object functions
syn keyword mql4Function    ObjectCreate ObjectDelete ObjectDescription ObjectFind ObjectGet ObjectGetFiboDescription ObjectGetShiftByValue ObjectGetValueByShift ObjectMove ObjectName ObjectsDeleteAll ObjectSet ObjectSetFiboDescription ObjectSetText ObjectsTotal ObjectType

" String functions
syn keyword mql4Function    StringConcatenate StringFind StringGetChar StringLen StringSetChar StringSubstr StringTrimLeft StringTrimRight

" Technical indicators functions
syn keyword mql4Function    iAC iAD iAlligator iADX iATR iAO iBearsPower iBands iBandsOnArray iBullsPower iCCI iCCIOnArray iCustom iDeMarker iEnvelopes iEnvelopesOnArray iForce iFractals iGator iIchimoku iBWMFI iMomentum iMomentumOnArray iMFI iMA iMAOnArray iOsMA iMACD iOBV iSAR iRSI iRSIOnArray iRVI iStdDev iStdDevOnArray iStochastic iWPR

" Timeseries access functions
syn keyword mql4Function    iBars iBarShift iClose iHigh iHighest iLow iLowest iOpen iTime iVolume

" Trading functions
syn keyword mql4Function    OrderClose OrderCloseBy OrderClosePrice OrderCloseTime OrderComment OrderCommission OrderDelete OrderExpiration OrderLots OrderMagicNumber OrderModify OrderOpenPrice OrderOpenTime OrderPrint OrderProfit OrderSelect OrderSend OrdersHistoryTotal OrderStopLoss OrdersTotal OrderSwap OrderSymbol OrderTakeProfit OrderTicket OrderType

" Window functions
syn keyword mql4Function    HideTestIndicators Period RefreshRates Symbol WindowBarsPerChart WindowExpertName WindowFind WindowFirstVisibleBar WindowHandle WindowIsVisible WindowOnDropped WindowPriceMax WindowPriceMin WindowPriceOnDropped WindowRedraw WindowScreenShot WindowTimeOnDropped WindowsTotal WindowXOnDropped WindowYOnDropped

" Obsolete functions
syn keyword mql4Obsolete    BarsPerWindow ClientTerminalName CurTime CompanyName FirstVisibleBar Highest HistoryTotal LocalTime Lowest ObjectsRedraw PriceOnDropped ScreenShot ServerAddress TimeOnDropped 

" Define the highlighting.
hi def link mql4Type            Type
hi def link mql4StorageClass    StorageClass
hi def link mql4Statement       Statement
hi def link mql4Conditional     Conditional
hi def link mql4Repeat          Repeat
hi def link mql4Label           Label
hi def link mql4Boolean         Boolean
hi def link mql4CommentSingle   Comment
hi def link mql4CommentMulti    Comment
hi def link mql4String          String
hi def link mql4Number          Number
hi def link mql4Constant        Constant
hi def link mql4Identifier      Identifier
hi def link mql4Function        Function
hi def link mql4Obsolete        Error

let b:current_syntax = "mql4"
