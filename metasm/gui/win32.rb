#    This file is part of Metasm, the Ruby assembly manipulation suite
#    Copyright (C) 2006-2009 Yoann GUILLOT
#
#    Licence is LGPL, see LICENCE in the top-level directory

require 'metasm/dynldr'

module Metasm
module Gui
class Win32Gui < DynLdr
	new_api_c <<EOS
#line #{__LINE__}
typedef char CHAR;
typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned int UINT;
typedef long LONG;
typedef unsigned long ULONG, DWORD;
typedef int BOOL;

typedef long LONG_PTR;
typedef unsigned long ULONG_PTR, DWORD_PTR;
typedef int INT_PTR;
typedef unsigned int UINT_PTR;
typedef LONG_PTR LPARAM;
typedef const CHAR *LPSTR, *LPCSTR;
typedef LONG_PTR LRESULT;
typedef UINT_PTR WPARAM;
typedef void VOID, *PVOID, *LPVOID;

typedef WORD ATOM;
typedef void *HANDLE;
typedef void *HBITMAP;
typedef void *HBRUSH;
typedef void *HCURSOR;
typedef void *HDC;
typedef void *HICON;
typedef void *HINSTANCE;
typedef void *HMENU;
typedef void *HMODULE;
typedef void *HPEN;
typedef void *HWND;

#define DECLSPEC_IMPORT __declspec(dllimport)
#define WINUSERAPI DECLSPEC_IMPORT
#define WINAPI __stdcall
#define CALLBACK __stdcall
#define CONST const
#define __in __attribute__((in))
#define __out __attribute__((out))
#define __opt __attribute__((opt))
#define __inout __in __out
#define __in_opt __in __opt
#define __out_opt __out __opt
#define __in_ecount(c) __in
#define __out_ecount(c) __out
#define __inout_ecount(c) __inout

#define CW_USEDEFAULT       ((int)0x80000000)

#define WS_OVERLAPPED       0x00000000L
#define WS_POPUP            0x80000000L
#define WS_CHILD            0x40000000L
#define WS_MINIMIZE         0x20000000L
#define WS_VISIBLE          0x10000000L
#define WS_DISABLED         0x08000000L
#define WS_CLIPSIBLINGS     0x04000000L
#define WS_CLIPCHILDREN     0x02000000L
#define WS_MAXIMIZE         0x01000000L
#define WS_CAPTION          0x00C00000L     /* WS_BORDER | WS_DLGFRAME  */
#define WS_BORDER           0x00800000L
#define WS_DLGFRAME         0x00400000L
#define WS_VSCROLL          0x00200000L
#define WS_HSCROLL          0x00100000L
#define WS_SYSMENU          0x00080000L
#define WS_THICKFRAME       0x00040000L
#define WS_GROUP            0x00020000L
#define WS_TABSTOP          0x00010000L
#define WS_MINIMIZEBOX      0x00020000L
#define WS_MAXIMIZEBOX      0x00010000L
#define WS_TILED            WS_OVERLAPPED
#define WS_ICONIC           WS_MINIMIZE
#define WS_SIZEBOX          WS_THICKFRAME
#define WS_TILEDWINDOW      WS_OVERLAPPEDWINDOW
#define WS_OVERLAPPEDWINDOW (WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX)
#define WS_POPUPWINDOW      (WS_POPUP |  WS_BORDER | WS_SYSMENU)
#define WS_CHILDWINDOW      (WS_CHILD)

#define WS_EX_DLGMODALFRAME     0x00000001L
#define WS_EX_NOPARENTNOTIFY    0x00000004L
#define WS_EX_TOPMOST           0x00000008L
#define WS_EX_ACCEPTFILES       0x00000010L
#define WS_EX_TRANSPARENT       0x00000020L
#define WS_EX_MDICHILD          0x00000040L
#define WS_EX_TOOLWINDOW        0x00000080L
#define WS_EX_WINDOWEDGE        0x00000100L
#define WS_EX_CLIENTEDGE        0x00000200L
#define WS_EX_CONTEXTHELP       0x00000400L
#define WS_EX_RIGHT             0x00001000L
#define WS_EX_LEFT              0x00000000L
#define WS_EX_RTLREADING        0x00002000L
#define WS_EX_LTRREADING        0x00000000L
#define WS_EX_LEFTSCROLLBAR     0x00004000L
#define WS_EX_RIGHTSCROLLBAR    0x00000000L
#define WS_EX_CONTROLPARENT     0x00010000L
#define WS_EX_STATICEDGE        0x00020000L
#define WS_EX_APPWINDOW         0x00040000L
#define WS_EX_OVERLAPPEDWINDOW  (WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE)
#define WS_EX_PALETTEWINDOW     (WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST)
#define WS_EX_LAYERED           0x00080000

#define WM_NULL                         0x0000
#define WM_CREATE                       0x0001
#define WM_DESTROY                      0x0002
#define WM_MOVE                         0x0003
#define WM_SIZE                         0x0005

#define WM_ACTIVATE                     0x0006
#define     WA_INACTIVE     0
#define     WA_ACTIVE       1
#define     WA_CLICKACTIVE  2

#define WM_SETFOCUS                     0x0007
#define WM_KILLFOCUS                    0x0008
#define WM_ENABLE                       0x000A
#define WM_SETREDRAW                    0x000B
#define WM_SETTEXT                      0x000C
#define WM_GETTEXT                      0x000D
#define WM_GETTEXTLENGTH                0x000E
#define WM_PAINT                        0x000F
#define WM_CLOSE                        0x0010
#define WM_QUERYENDSESSION              0x0011
#define WM_QUERYOPEN                    0x0013
#define WM_ENDSESSION                   0x0016
#define WM_QUIT                         0x0012
#define WM_ERASEBKGND                   0x0014
#define WM_SYSCOLORCHANGE               0x0015
#define WM_SHOWWINDOW                   0x0018
#define WM_WININICHANGE                 0x001A
#define WM_SETTINGCHANGE                WM_WININICHANGE
#define WM_DEVMODECHANGE                0x001B
#define WM_ACTIVATEAPP                  0x001C
#define WM_FONTCHANGE                   0x001D
#define WM_TIMECHANGE                   0x001E
#define WM_CANCELMODE                   0x001F
#define WM_SETCURSOR                    0x0020
#define WM_MOUSEACTIVATE                0x0021
#define WM_CHILDACTIVATE                0x0022
#define WM_QUEUESYNC                    0x0023
#define WM_GETMINMAXINFO                0x0024
typedef struct tagPOINT {
    LONG  x;
    LONG  y;
} POINT, *PPOINT, *LPPOINT;

typedef struct tagMINMAXINFO {
    POINT ptReserved;
    POINT ptMaxSize;
    POINT ptMaxPosition;
    POINT ptMinTrackSize;
    POINT ptMaxTrackSize;
} MINMAXINFO, *PMINMAXINFO, *LPMINMAXINFO;

#define WM_PAINTICON                    0x0026
#define WM_ICONERASEBKGND               0x0027
#define WM_NEXTDLGCTL                   0x0028
#define WM_SPOOLERSTATUS                0x002A
#define WM_DRAWITEM                     0x002B
#define WM_MEASUREITEM                  0x002C
#define WM_DELETEITEM                   0x002D
#define WM_VKEYTOITEM                   0x002E
#define WM_CHARTOITEM                   0x002F
#define WM_SETFONT                      0x0030
#define WM_GETFONT                      0x0031
#define WM_SETHOTKEY                    0x0032
#define WM_GETHOTKEY                    0x0033
#define WM_QUERYDRAGICON                0x0037
#define WM_COMPAREITEM                  0x0039
#define WM_GETOBJECT                    0x003D
#define WM_COMPACTING                   0x0041
#define WM_COMMNOTIFY                   0x0044
#define WM_WINDOWPOSCHANGING            0x0046
#define WM_WINDOWPOSCHANGED             0x0047
#define WM_POWER                        0x0048
#define PWR_OK              1
#define PWR_FAIL            (-1)
#define PWR_SUSPENDREQUEST  1
#define PWR_SUSPENDRESUME   2
#define PWR_CRITICALRESUME  3
#define WM_COPYDATA                     0x004A
typedef struct tagCOPYDATASTRUCT {
    ULONG_PTR dwData;
    DWORD cbData;
    PVOID lpData;
} COPYDATASTRUCT, *PCOPYDATASTRUCT;

#define WM_CANCELJOURNAL                0x004B

typedef struct tagMDINEXTMENU {
    HMENU   hmenuIn;
    HMENU   hmenuNext;
    HWND    hwndNext;
} MDINEXTMENU, *PMDINEXTMENU, *LPMDINEXTMENU;

#define WM_NOTIFY                       0x004E
#define WM_INPUTLANGCHANGEREQUEST       0x0050
#define WM_INPUTLANGCHANGE              0x0051
#define WM_TCARD                        0x0052
#define WM_HELP                         0x0053
#define WM_USERCHANGED                  0x0054
#define WM_NOTIFYFORMAT                 0x0055
#define NFR_ANSI                             1
#define NFR_UNICODE                          2
#define NF_QUERY                             3
#define NF_REQUERY                           4
#define WM_CONTEXTMENU                  0x007B
#define WM_STYLECHANGING                0x007C
#define WM_STYLECHANGED                 0x007D
#define WM_DISPLAYCHANGE                0x007E
#define WM_GETICON                      0x007F
#define WM_SETICON                      0x0080
#define WM_NCCREATE                     0x0081
#define WM_NCDESTROY                    0x0082
#define WM_NCCALCSIZE                   0x0083
#define WM_NCHITTEST                    0x0084
#define WM_NCPAINT                      0x0085
#define WM_NCACTIVATE                   0x0086
#define WM_GETDLGCODE                   0x0087
#define WM_SYNCPAINT                    0x0088
#define WM_NCMOUSEMOVE                  0x00A0
#define WM_NCLBUTTONDOWN                0x00A1
#define WM_NCLBUTTONUP                  0x00A2
#define WM_NCLBUTTONDBLCLK              0x00A3
#define WM_NCRBUTTONDOWN                0x00A4
#define WM_NCRBUTTONUP                  0x00A5
#define WM_NCRBUTTONDBLCLK              0x00A6
#define WM_NCMBUTTONDOWN                0x00A7
#define WM_NCMBUTTONUP                  0x00A8
#define WM_NCMBUTTONDBLCLK              0x00A9
#define WM_NCXBUTTONDOWN                0x00AB
#define WM_NCXBUTTONUP                  0x00AC
#define WM_NCXBUTTONDBLCLK              0x00AD
#define WM_INPUT                        0x00FF
#define WM_KEYFIRST                     0x0100
#define WM_KEYDOWN                      0x0100
#define WM_KEYUP                        0x0101
#define WM_CHAR                         0x0102
#define WM_DEADCHAR                     0x0103
#define WM_SYSKEYDOWN                   0x0104
#define WM_SYSKEYUP                     0x0105
#define WM_SYSCHAR                      0x0106
#define WM_SYSDEADCHAR                  0x0107
#define WM_UNICHAR                      0x0109
#define WM_KEYLAST                      0x0109
#define UNICODE_NOCHAR                  0xFFFF
#define WM_IME_STARTCOMPOSITION         0x010D
#define WM_IME_ENDCOMPOSITION           0x010E
#define WM_IME_COMPOSITION              0x010F
#define WM_IME_KEYLAST                  0x010F

#define WM_INITDIALOG                   0x0110
#define WM_COMMAND                      0x0111
#define WM_SYSCOMMAND                   0x0112
#define WM_TIMER                        0x0113
#define WM_HSCROLL                      0x0114
#define WM_VSCROLL                      0x0115
#define WM_INITMENU                     0x0116
#define WM_INITMENUPOPUP                0x0117
#define WM_MENUSELECT                   0x011F
#define WM_MENUCHAR                     0x0120
#define WM_ENTERIDLE                    0x0121
#define WM_MENURBUTTONUP                0x0122
#define WM_MENUDRAG                     0x0123
#define WM_MENUGETOBJECT                0x0124
#define WM_UNINITMENUPOPUP              0x0125
#define WM_MENUCOMMAND                  0x0126
#define WM_CHANGEUISTATE                0x0127
#define WM_UPDATEUISTATE                0x0128
#define WM_QUERYUISTATE                 0x0129
#define UIS_SET                         1
#define UIS_CLEAR                       2
#define UIS_INITIALIZE                  3
#define UISF_HIDEFOCUS                  0x1
#define UISF_HIDEACCEL                  0x2
#define WM_CTLCOLORMSGBOX               0x0132
#define WM_CTLCOLOREDIT                 0x0133
#define WM_CTLCOLORLISTBOX              0x0134
#define WM_CTLCOLORBTN                  0x0135
#define WM_CTLCOLORDLG                  0x0136
#define WM_CTLCOLORSCROLLBAR            0x0137
#define WM_CTLCOLORSTATIC               0x0138
#define MN_GETHMENU                     0x01E1
#define WM_MOUSEFIRST                   0x0200
#define WM_MOUSEMOVE                    0x0200
#define WM_LBUTTONDOWN                  0x0201
#define WM_LBUTTONUP                    0x0202
#define WM_LBUTTONDBLCLK                0x0203
#define WM_RBUTTONDOWN                  0x0204
#define WM_RBUTTONUP                    0x0205
#define WM_RBUTTONDBLCLK                0x0206
#define WM_MBUTTONDOWN                  0x0207
#define WM_MBUTTONUP                    0x0208
#define WM_MBUTTONDBLCLK                0x0209
#define WM_MOUSEWHEEL                   0x020A
#define WM_XBUTTONDOWN                  0x020B
#define WM_XBUTTONUP                    0x020C
#define WM_XBUTTONDBLCLK                0x020D
#define WHEEL_DELTA                     120

#define WHEEL_PAGESCROLL                (UINT_MAX)
#define GET_WHEEL_DELTA_WPARAM(wParam)  ((short)HIWORD(wParam))
#define GET_KEYSTATE_WPARAM(wParam)     (LOWORD(wParam))
#define GET_NCHITTEST_WPARAM(wParam)    ((short)LOWORD(wParam))
#define GET_XBUTTON_WPARAM(wParam)      (HIWORD(wParam))

#define XBUTTON1      0x0001
#define XBUTTON2      0x0002

#define WM_PARENTNOTIFY                 0x0210
#define WM_ENTERMENULOOP                0x0211
#define WM_EXITMENULOOP                 0x0212
#define WM_NEXTMENU                     0x0213
#define WM_SIZING                       0x0214
#define WM_CAPTURECHANGED               0x0215
#define WM_MOVING                       0x0216
#define WM_DEVICECHANGE                 0x0219
#define WM_MDICREATE                    0x0220
#define WM_MDIDESTROY                   0x0221
#define WM_MDIACTIVATE                  0x0222
#define WM_MDIRESTORE                   0x0223
#define WM_MDINEXT                      0x0224
#define WM_MDIMAXIMIZE                  0x0225
#define WM_MDITILE                      0x0226
#define WM_MDICASCADE                   0x0227
#define WM_MDIICONARRANGE               0x0228
#define WM_MDIGETACTIVE                 0x0229
#define WM_MDISETMENU                   0x0230
#define WM_ENTERSIZEMOVE                0x0231
#define WM_EXITSIZEMOVE                 0x0232
#define WM_DROPFILES                    0x0233
#define WM_MDIREFRESHMENU               0x0234
#define WM_IME_SETCONTEXT               0x0281
#define WM_IME_NOTIFY                   0x0282
#define WM_IME_CONTROL                  0x0283
#define WM_IME_COMPOSITIONFULL          0x0284
#define WM_IME_SELECT                   0x0285
#define WM_IME_CHAR                     0x0286
#define WM_IME_REQUEST                  0x0288
#define WM_IME_KEYDOWN                  0x0290
#define WM_IME_KEYUP                    0x0291
#define WM_NCMOUSEHOVER                 0x02A0
#define WM_MOUSEHOVER                   0x02A1
#define WM_NCMOUSELEAVE                 0x02A2
#define WM_MOUSELEAVE                   0x02A3
#define WM_WTSSESSION_CHANGE            0x02B1
#define WM_TABLET_FIRST                 0x02c0
#define WM_TABLET_LAST                  0x02df
#define WM_CUT                          0x0300
#define WM_COPY                         0x0301
#define WM_PASTE                        0x0302
#define WM_CLEAR                        0x0303
#define WM_UNDO                         0x0304
#define WM_RENDERFORMAT                 0x0305
#define WM_RENDERALLFORMATS             0x0306
#define WM_DESTROYCLIPBOARD             0x0307
#define WM_DRAWCLIPBOARD                0x0308
#define WM_PAINTCLIPBOARD               0x0309
#define WM_VSCROLLCLIPBOARD             0x030A
#define WM_SIZECLIPBOARD                0x030B
#define WM_ASKCBFORMATNAME              0x030C
#define WM_CHANGECBCHAIN                0x030D
#define WM_HSCROLLCLIPBOARD             0x030E
#define WM_QUERYNEWPALETTE              0x030F
#define WM_PALETTEISCHANGING            0x0310
#define WM_PALETTECHANGED               0x0311
#define WM_HOTKEY                       0x0312
#define WM_PRINT                        0x0317
#define WM_PRINTCLIENT                  0x0318
#define WM_APPCOMMAND                   0x0319
#define WM_THEMECHANGED                 0x031A
#define WM_HANDHELDFIRST                0x0358
#define WM_HANDHELDLAST                 0x035F
#define WM_AFXFIRST                     0x0360
#define WM_AFXLAST                      0x037F
#define WM_PENWINFIRST                  0x0380
#define WM_PENWINLAST                   0x038F
#define WM_USER                         0x0400
#define WM_APP                          0x8000

#define WMSZ_LEFT           1
#define WMSZ_RIGHT          2
#define WMSZ_TOP            3
#define WMSZ_TOPLEFT        4
#define WMSZ_TOPRIGHT       5
#define WMSZ_BOTTOM         6
#define WMSZ_BOTTOMLEFT     7
#define WMSZ_BOTTOMRIGHT    8

#define SIZE_RESTORED       0
#define SIZE_MINIMIZED      1
#define SIZE_MAXIMIZED      2
#define SIZE_MAXSHOW        3
#define SIZE_MAXHIDE        4

typedef struct tagWINDOWPOS {
    HWND    hwnd;
    HWND    hwndInsertAfter;
    int     x;
    int     y;
    int     cx;
    int     cy;
    UINT    flags;
} WINDOWPOS, *LPWINDOWPOS, *PWINDOWPOS;

#define MK_LBUTTON          0x0001
#define MK_RBUTTON          0x0002
#define MK_SHIFT            0x0004
#define MK_CONTROL          0x0008
#define MK_MBUTTON          0x0010
#define MK_XBUTTON1         0x0020
#define MK_XBUTTON2         0x0040

typedef struct tagTRACKMOUSEEVENT {
    DWORD cbSize;
    DWORD dwFlags;
    HWND  hwndTrack;
    DWORD dwHoverTime;
} TRACKMOUSEEVENT, *LPTRACKMOUSEEVENT;

WINUSERAPI
BOOL
WINAPI
TrackMouseEvent(
    __inout LPTRACKMOUSEEVENT lpEventTrack);

#define FVIRTKEY  TRUE          /* Assumed to be == TRUE */
#define FNOINVERT 0x02
#define FSHIFT    0x04
#define FCONTROL  0x08
#define FALT      0x10

typedef struct tagACCEL {
    BYTE   fVirt;               /* Also called the flags field */
    WORD   key;
    WORD   cmd;
} ACCEL, *LPACCEL;

#define FALSE 0
#define TRUE 1

#define SW_HIDE             0
#define SW_SHOWNORMAL       1
#define SW_NORMAL           1
#define SW_SHOWMINIMIZED    2
#define SW_SHOWMAXIMIZED    3
#define SW_MAXIMIZE         3
#define SW_SHOWNOACTIVATE   4
#define SW_SHOW             5
#define SW_MINIMIZE         6
#define SW_SHOWMINNOACTIVE  7
#define SW_SHOWNA           8
#define SW_RESTORE          9
#define SW_SHOWDEFAULT      10
#define SW_FORCEMINIMIZE    11
#define SW_MAX              11

#define CS_VREDRAW          0x0001
#define CS_HREDRAW          0x0002
#define CS_DBLCLKS          0x0008
#define CS_OWNDC            0x0020
#define CS_CLASSDC          0x0040
#define CS_PARENTDC         0x0080
#define CS_NOCLOSE          0x0200
#define CS_SAVEBITS         0x0800
#define CS_BYTEALIGNCLIENT  0x1000
#define CS_BYTEALIGNWINDOW  0x2000
#define CS_GLOBALCLASS      0x4000
#define CS_IME              0x00010000
#define CS_DROPSHADOW       0x00020000

#define MF_INSERT           0x00000000L
#define MF_CHANGE           0x00000080L
#define MF_APPEND           0x00000100L
#define MF_DELETE           0x00000200L
#define MF_REMOVE           0x00001000L
#define MF_BYCOMMAND        0x00000000L
#define MF_BYPOSITION       0x00000400L
#define MF_SEPARATOR        0x00000800L
#define MF_ENABLED          0x00000000L
#define MF_GRAYED           0x00000001L
#define MF_DISABLED         0x00000002L
#define MF_UNCHECKED        0x00000000L
#define MF_CHECKED          0x00000008L
#define MF_USECHECKBITMAPS  0x00000200L
#define MF_STRING           0x00000000L
#define MF_BITMAP           0x00000004L
#define MF_OWNERDRAW        0x00000100L
#define MF_POPUP            0x00000010L
#define MF_MENUBARBREAK     0x00000020L
#define MF_MENUBREAK        0x00000040L
#define MF_UNHILITE         0x00000000L
#define MF_HILITE           0x00000080L
#define MF_DEFAULT          0x00001000L
#define MF_SYSMENU          0x00002000L
#define MF_HELP             0x00004000L
#define MF_RIGHTJUSTIFY     0x00004000L
#define MF_MOUSESELECT      0x00008000L
#define MFT_STRING          MF_STRING
#define MFT_BITMAP          MF_BITMAP
#define MFT_MENUBARBREAK    MF_MENUBARBREAK
#define MFT_MENUBREAK       MF_MENUBREAK
#define MFT_OWNERDRAW       MF_OWNERDRAW
#define MFT_RADIOCHECK      0x00000200L
#define MFT_SEPARATOR       MF_SEPARATOR
#define MFT_RIGHTORDER      0x00002000L
#define MFT_RIGHTJUSTIFY    MF_RIGHTJUSTIFY
// Menu flags for Add/Check/EnableMenuItem
#define MFS_GRAYED          0x00000003L
#define MFS_DISABLED        MFS_GRAYED
#define MFS_CHECKED         MF_CHECKED
#define MFS_HILITE          MF_HILITE
#define MFS_ENABLED         MF_ENABLED
#define MFS_UNCHECKED       MF_UNCHECKED
#define MFS_UNHILITE        MF_UNHILITE
#define MFS_DEFAULT         MF_DEFAULT

#define IDI_APPLICATION     32512
#define IDI_HAND            32513
#define IDI_QUESTION        32514
#define IDI_EXCLAMATION     32515
#define IDI_ASTERISK        32516
#define IDI_WINLOGO         32517

#define MB_OK                       0x00000000L
#define MB_OKCANCEL                 0x00000001L
#define MB_ABORTRETRYIGNORE         0x00000002L
#define MB_YESNOCANCEL              0x00000003L
#define MB_YESNO                    0x00000004L
#define MB_RETRYCANCEL              0x00000005L
#define MB_CANCELTRYCONTINUE        0x00000006L
#define MB_ICONHAND                 0x00000010L
#define MB_ICONQUESTION             0x00000020L
#define MB_ICONEXCLAMATION          0x00000030L
#define MB_ICONASTERISK             0x00000040L
#define MB_USERICON                 0x00000080L
#define MB_ICONWARNING              MB_ICONEXCLAMATION
#define MB_ICONERROR                MB_ICONHAND
#define MB_ICONINFORMATION          MB_ICONASTERISK
#define MB_ICONSTOP                 MB_ICONHAND
#define MB_DEFBUTTON1               0x00000000L
#define MB_DEFBUTTON2               0x00000100L
#define MB_DEFBUTTON3               0x00000200L
#define MB_DEFBUTTON4               0x00000300L
#define MB_APPLMODAL                0x00000000L
#define MB_SYSTEMMODAL              0x00001000L
#define MB_TASKMODAL                0x00002000L
#define MB_HELP                     0x00004000L
#define MB_NOFOCUS                  0x00008000L
#define MB_SETFOREGROUND            0x00010000L
#define MB_DEFAULT_DESKTOP_ONLY     0x00020000L
#define MB_TOPMOST                  0x00040000L
#define MB_RIGHT                    0x00080000L
#define MB_RTLREADING               0x00100000L
#define MB_SERVICE_NOTIFICATION          0x00200000L
#define MB_SERVICE_NOTIFICATION_NT3X     0x00040000L

#define IDOK                1
#define IDCANCEL            2
#define IDABORT             3
#define IDRETRY             4
#define IDIGNORE            5
#define IDYES               6
#define IDNO                7
#define IDCLOSE         8
#define IDHELP          9
#define IDTRYAGAIN      10
#define IDCONTINUE      11
#define IDTIMEOUT 32000

#define PM_NOREMOVE     0
#define PM_REMOVE       1
#define PM_NOYIELD      2

#define IDC_ARROW           32512
#define IDC_IBEAM           32513
#define IDC_WAIT            32514
#define IDC_CROSS           32515
#define IDC_UPARROW         32516
#define IDC_SIZE            32640
#define IDC_ICON            32641
#define IDC_SIZENWSE        32642
#define IDC_SIZENESW        32643
#define IDC_SIZEWE          32644
#define IDC_SIZENS          32645
#define IDC_SIZEALL         32646
#define IDC_NO              32648
#define IDC_HAND            32649
#define IDC_APPSTARTING     32650
#define IDC_HELP            32651

#define WHITE_BRUSH         0
#define LTGRAY_BRUSH        1
#define GRAY_BRUSH          2
#define DKGRAY_BRUSH        3
#define BLACK_BRUSH         4
#define NULL_BRUSH          5
#define HOLLOW_BRUSH        NULL_BRUSH
#define WHITE_PEN           6
#define BLACK_PEN           7
#define NULL_PEN            8
#define OEM_FIXED_FONT      10
#define ANSI_FIXED_FONT     11
#define ANSI_VAR_FONT       12
#define SYSTEM_FONT         13
#define DEVICE_DEFAULT_FONT 14
#define DEFAULT_PALETTE     15
#define SYSTEM_FIXED_FONT   16
#define DEFAULT_GUI_FONT    17
#define DC_BRUSH            18
#define DC_PEN              19

#define BS_SOLID            0
#define BS_NULL             1
#define BS_HOLLOW           BS_NULL
#define BS_HATCHED          2
#define BS_PATTERN          3
#define BS_INDEXED          4
#define BS_DIBPATTERN       5
#define BS_DIBPATTERNPT     6
#define BS_PATTERN8X8       7
#define BS_DIBPATTERN8X8    8
#define BS_MONOPPATTERN     9

#define HS_HORIZONTAL       0
#define HS_VERTICAL         1
#define HS_FDIAGONAL        2
#define HS_BDIAGONAL        3
#define HS_CROSS            4
#define HS_DIAGCROSS        5

#define PS_SOLID            0
#define PS_DASH             1
#define PS_DOT              2
#define PS_DASHDOT          3
#define PS_DASHDOTDOT       4
#define PS_NULL             5
#define PS_INSIDEFRAME      6
#define PS_USERSTYLE        7
#define PS_ALTERNATE        8

#define KF_EXTENDED       0x0100
#define KF_DLGMODE        0x0800
#define KF_MENUMODE       0x1000
#define KF_ALTDOWN        0x2000
#define KF_REPEAT         0x4000
#define KF_UP             0x8000

#define VK_LBUTTON        0x01
#define VK_RBUTTON        0x02
#define VK_CANCEL         0x03
#define VK_MBUTTON        0x04
#define VK_XBUTTON1       0x05
#define VK_XBUTTON2       0x06
#define VK_BACK           0x08
#define VK_TAB            0x09
#define VK_CLEAR          0x0C
#define VK_RETURN         0x0D
#define VK_SHIFT          0x10
#define VK_CONTROL        0x11
#define VK_MENU           0x12
#define VK_PAUSE          0x13
#define VK_CAPITAL        0x14
#define VK_ESCAPE         0x1B
#define VK_CONVERT        0x1C
#define VK_NONCONVERT     0x1D
#define VK_ACCEPT         0x1E
#define VK_MODECHANGE     0x1F
#define VK_SPACE          0x20
#define VK_PRIOR          0x21
#define VK_NEXT           0x22
#define VK_END            0x23
#define VK_HOME           0x24
#define VK_LEFT           0x25
#define VK_UP             0x26
#define VK_RIGHT          0x27
#define VK_DOWN           0x28
#define VK_SELECT         0x29
#define VK_PRINT          0x2A
#define VK_EXECUTE        0x2B
#define VK_SNAPSHOT       0x2C
#define VK_INSERT         0x2D
#define VK_DELETE         0x2E
#define VK_HELP           0x2F
// VK_0 - VK_9 are the same as ASCII '0' - '9' (0x30 - 0x39)
// VK_A - VK_Z are the same as ASCII 'A' - 'Z' (0x41 - 0x5A)
#define VK_LWIN           0x5B
#define VK_RWIN           0x5C
#define VK_APPS           0x5D
#define VK_SLEEP          0x5F
#define VK_NUMPAD0        0x60
#define VK_NUMPAD1        0x61
#define VK_NUMPAD2        0x62
#define VK_NUMPAD3        0x63
#define VK_NUMPAD4        0x64
#define VK_NUMPAD5        0x65
#define VK_NUMPAD6        0x66
#define VK_NUMPAD7        0x67
#define VK_NUMPAD8        0x68
#define VK_NUMPAD9        0x69
#define VK_MULTIPLY       0x6A
#define VK_ADD            0x6B
#define VK_SEPARATOR      0x6C
#define VK_SUBTRACT       0x6D
#define VK_DECIMAL        0x6E
#define VK_DIVIDE         0x6F
#define VK_F1             0x70
#define VK_F2             0x71
#define VK_F3             0x72
#define VK_F4             0x73
#define VK_F5             0x74
#define VK_F6             0x75
#define VK_F7             0x76
#define VK_F8             0x77
#define VK_F9             0x78
#define VK_F10            0x79
#define VK_F11            0x7A
#define VK_F12            0x7B
#define VK_F13            0x7C
#define VK_F14            0x7D
#define VK_F15            0x7E
#define VK_F16            0x7F
#define VK_F17            0x80
#define VK_F18            0x81
#define VK_F19            0x82
#define VK_F20            0x83
#define VK_F21            0x84
#define VK_F22            0x85
#define VK_F23            0x86
#define VK_F24            0x87

#define SM_CXSCREEN             0
#define SM_CYSCREEN             1
#define SM_CXVSCROLL            2
#define SM_CYHSCROLL            3
#define SM_CYCAPTION            4
#define SM_CXBORDER             5
#define SM_CYBORDER             6
#define SM_CXDLGFRAME           7
#define SM_CYDLGFRAME           8
#define SM_CYVTHUMB             9
#define SM_CXHTHUMB             10
#define SM_CXICON               11
#define SM_CYICON               12
#define SM_CXCURSOR             13
#define SM_CYCURSOR             14
#define SM_CYMENU               15
#define SM_CXFULLSCREEN         16
#define SM_CYFULLSCREEN         17
#define SM_CYKANJIWINDOW        18
#define SM_MOUSEPRESENT         19
#define SM_CYVSCROLL            20
#define SM_CXHSCROLL            21
#define SM_DEBUG                22
#define SM_SWAPBUTTON           23
#define SM_RESERVED1            24
#define SM_RESERVED2            25
#define SM_RESERVED3            26
#define SM_RESERVED4            27
#define SM_CXMIN                28
#define SM_CYMIN                29
#define SM_CXSIZE               30
#define SM_CYSIZE               31
#define SM_CXFRAME              32
#define SM_CYFRAME              33
#define SM_CXMINTRACK           34
#define SM_CYMINTRACK           35
#define SM_CXDOUBLECLK          36
#define SM_CYDOUBLECLK          37
#define SM_CXICONSPACING        38
#define SM_CYICONSPACING        39
#define SM_MENUDROPALIGNMENT    40
#define SM_PENWINDOWS           41
#define SM_DBCSENABLED          42
#define SM_CMOUSEBUTTONS        43
#define SM_CXFIXEDFRAME           SM_CXDLGFRAME  /* ;win40 name change */
#define SM_CYFIXEDFRAME           SM_CYDLGFRAME  /* ;win40 name change */
#define SM_CXSIZEFRAME            SM_CXFRAME     /* ;win40 name change */
#define SM_CYSIZEFRAME            SM_CYFRAME     /* ;win40 name change */
#define SM_SECURE               44
#define SM_CXEDGE               45
#define SM_CYEDGE               46
#define SM_CXMINSPACING         47
#define SM_CYMINSPACING         48
#define SM_CXSMICON             49
#define SM_CYSMICON             50
#define SM_CYSMCAPTION          51
#define SM_CXSMSIZE             52
#define SM_CYSMSIZE             53
#define SM_CXMENUSIZE           54
#define SM_CYMENUSIZE           55
#define SM_ARRANGE              56
#define SM_CXMINIMIZED          57
#define SM_CYMINIMIZED          58
#define SM_CXMAXTRACK           59
#define SM_CYMAXTRACK           60
#define SM_CXMAXIMIZED          61
#define SM_CYMAXIMIZED          62
#define SM_NETWORK              63
#define SM_CLEANBOOT            67
#define SM_CXDRAG               68
#define SM_CYDRAG               69
#define SM_SHOWSOUNDS           70
#define SM_CXMENUCHECK          71   /* Use instead of GetMenuCheckMarkDimensions()! */
#define SM_CYMENUCHECK          72
#define SM_SLOWMACHINE          73
#define SM_MIDEASTENABLED       74
#define SM_MOUSEWHEELPRESENT    75
#define SM_XVIRTUALSCREEN       76
#define SM_YVIRTUALSCREEN       77
#define SM_CXVIRTUALSCREEN      78
#define SM_CYVIRTUALSCREEN      79
#define SM_CMONITORS            80
#define SM_SAMEDISPLAYFORMAT    81
#define SM_IMMENABLED           82
#define SM_CXFOCUSBORDER        83
#define SM_CYFOCUSBORDER        84
#define SM_TABLETPC             86
#define SM_MEDIACENTER          87
#define SM_STARTER              88
#define SM_SERVERR2             89
#define SM_REMOTESESSION        0x1000
#define SM_SHUTTINGDOWN         0x2000
#define SM_REMOTECONTROL        0x2001
#define SM_CARETBLINKINGENABLED 0x2002

#define QS_KEY              0x0001
#define QS_MOUSEMOVE        0x0002
#define QS_MOUSEBUTTON      0x0004
#define QS_POSTMESSAGE      0x0008
#define QS_TIMER            0x0010
#define QS_PAINT            0x0020
#define QS_SENDMESSAGE      0x0040
#define QS_HOTKEY           0x0080
#define QS_ALLPOSTMESSAGE   0x0100
#define QS_RAWINPUT         0x0400
#define QS_MOUSE           (QS_MOUSEMOVE | QS_MOUSEBUTTON)
#define QS_INPUT           (QS_MOUSE | QS_KEY | QS_RAWINPUT)
#define QS_ALLEVENTS       (QS_INPUT | QS_POSTMESSAGE | QS_TIMER | QS_PAINT | QS_HOTKEY)
#define QS_ALLINPUT        (QS_ALLEVENTS | QS_SENDMESSAGE)

#define WAIT_TIMEOUT        258L 

#define CF_TEXT             1
#define CF_BITMAP           2
#define CF_METAFILEPICT     3
#define CF_SYLK             4
#define CF_DIF              5
#define CF_TIFF             6
#define CF_OEMTEXT          7
#define CF_DIB              8
#define CF_PALETTE          9
#define CF_PENDATA          10
#define CF_RIFF             11
#define CF_WAVE             12
#define CF_UNICODETEXT      13
#define CF_ENHMETAFILE      14
#define CF_HDROP            15
#define CF_LOCALE           16
#define CF_DIBV5            17

#define COLOR_SCROLLBAR         0
#define COLOR_BACKGROUND        1
#define COLOR_ACTIVECAPTION     2
#define COLOR_INACTIVECAPTION   3
#define COLOR_MENU              4
#define COLOR_WINDOW            5
#define COLOR_WINDOWFRAME       6
#define COLOR_MENUTEXT          7
#define COLOR_WINDOWTEXT        8
#define COLOR_CAPTIONTEXT       9
#define COLOR_ACTIVEBORDER      10
#define COLOR_INACTIVEBORDER    11
#define COLOR_APPWORKSPACE      12
#define COLOR_HIGHLIGHT         13
#define COLOR_HIGHLIGHTTEXT     14
#define COLOR_BTNFACE           15
#define COLOR_BTNSHADOW         16
#define COLOR_GRAYTEXT          17
#define COLOR_BTNTEXT           18
#define COLOR_INACTIVECAPTIONTEXT 19
#define COLOR_BTNHIGHLIGHT      20
#define COLOR_3DDKSHADOW        21
#define COLOR_3DLIGHT           22
#define COLOR_INFOTEXT          23
#define COLOR_INFOBK            24
#define COLOR_HOTLIGHT          26
#define COLOR_GRADIENTACTIVECAPTION 27
#define COLOR_GRADIENTINACTIVECAPTION 28
#define COLOR_MENUHILIGHT       29
#define COLOR_MENUBAR           30
#define COLOR_DESKTOP           COLOR_BACKGROUND
#define COLOR_3DFACE            COLOR_BTNFACE
#define COLOR_3DSHADOW          COLOR_BTNSHADOW
#define COLOR_3DHIGHLIGHT       COLOR_BTNHIGHLIGHT
#define COLOR_3DHILIGHT         COLOR_BTNHIGHLIGHT
#define COLOR_BTNHILIGHT        COLOR_BTNHIGHLIGHT


WINUSERAPI DWORD WINAPI GetSysColor(__in int nIndex);


WINUSERAPI
int
WINAPI
GetSystemMetrics(
    __in int nIndex);

typedef struct tagMSG {
    HWND hwnd;
    UINT message;
    WPARAM wParam;
    LPARAM lParam;
    DWORD time;
    POINT pt;
} MSG, *PMSG, *LPMSG;

WINUSERAPI
BOOL
WINAPI
GetMessageA(
    __out LPMSG lpMsg,
    __in_opt HWND hWnd,
    __in UINT wMsgFilterMin,
    __in UINT wMsgFilterMax);
WINUSERAPI
BOOL
WINAPI
PeekMessageA(
    __out LPMSG lpMsg,
    __in_opt HWND hWnd,
    __in UINT wMsgFilterMin,
    __in UINT wMsgFilterMax,
    __in UINT wRemoveMsg);
WINUSERAPI
BOOL
WINAPI
TranslateMessage(
    __in CONST MSG *lpMsg);
WINUSERAPI
LRESULT
WINAPI
DispatchMessageA(
    __in CONST MSG *lpMsg);
#define MOD_ALT         0x0001
#define MOD_CONTROL     0x0002
#define MOD_SHIFT       0x0004
#define MOD_WIN         0x0008
WINUSERAPI
LRESULT
WINAPI
SendMessageA(
    __in HWND hWnd,
    __in UINT Msg,
    __in WPARAM wParam,
    __in LPARAM lParam);
WINUSERAPI
BOOL
WINAPI
PostMessageA(
    __in_opt HWND hWnd,
    __in UINT Msg,
    __in WPARAM wParam,
    __in LPARAM lParam);
WINUSERAPI
LRESULT
WINAPI
DefWindowProcA(
    __in HWND hWnd,
    __in UINT Msg,
    __in WPARAM wParam,
    __in LPARAM lParam);
WINUSERAPI
VOID
WINAPI
PostQuitMessage(
    __in int nExitCode);
WINUSERAPI
DWORD
WINAPI
MsgWaitForMultipleObjects(
    __in DWORD nCount,
    __in_opt CONST HANDLE *pHandles,
    __in BOOL fWaitAll,
    __in DWORD dwMilliseconds,
    __in DWORD dwWakeMask);
WINUSERAPI DWORD WINAPI GetKeyState(__in int nVirtKey);

WINUSERAPI BOOL WINAPI OpenClipboard(__in_opt HWND hWndNewOwner);
WINUSERAPI BOOL WINAPI CloseClipboard(VOID);
WINUSERAPI HANDLE WINAPI SetClipboardData(__in UINT uFormat, __in_opt HANDLE hMem);
WINUSERAPI HANDLE WINAPI GetClipboardData(__in UINT uFormat);
WINUSERAPI BOOL WINAPI EmptyClipboard(VOID);

#define GMEM_FIXED          0x0000
#define GMEM_MOVEABLE       0x0002
#define GMEM_NOCOMPACT      0x0010
#define GMEM_NODISCARD      0x0020
#define GMEM_ZEROINIT       0x0040
#define GMEM_MODIFY         0x0080
#define GMEM_DISCARDABLE    0x0100
#define GMEM_NOT_BANKED     0x1000
#define GMEM_SHARE          0x2000
#define GMEM_DDESHARE       0x2000
#define GMEM_NOTIFY         0x4000
#define GMEM_LOWER          GMEM_NOT_BANKED
#define GMEM_INVALID_HANDLE 0x8000
HANDLE WINAPI GlobalAlloc(__in UINT uFlags, __in DWORD dwBytes);
DWORD WINAPI GlobalSize(__in HANDLE hMem);
LPVOID WINAPI GlobalLock(__in HANDLE hMem);
BOOL WINAPI GlobalUnlock(__in HANDLE hMem);
HANDLE WINAPI GlobalFree(HANDLE hMem);

typedef __stdcall LRESULT (*WNDPROC)(HWND, UINT, WPARAM, LPARAM);
typedef struct tagWNDCLASSA {
    UINT        style;
    WNDPROC     lpfnWndProc;
    int         cbClsExtra;
    int         cbWndExtra;
    HINSTANCE   hInstance;
    HICON       hIcon;
    HCURSOR     hCursor;
    HBRUSH      hbrBackground;
    LPCSTR      lpszMenuName;
    LPCSTR      lpszClassName;
} WNDCLASSA;
WINUSERAPI
ATOM
WINAPI
RegisterClassA(
    __in CONST WNDCLASSA *lpWndClass);

typedef struct tagWNDCLASSEXA {
	UINT cbSize;
	UINT style;
	WNDPROC lpfnWndProc;
	int cbClsExtra;
	int cbWndExtra;
	HINSTANCE hInstance;
	HICON hIcon;
	HCURSOR hCursor;
	HBRUSH hbrBackground;
	LPCSTR lpszMenuName;
	LPCSTR lpszClassName;
	HICON hIconSm;
} WNDCLASSEXA;
WINUSERAPI
ATOM
WINAPI
RegisterClassExA(
    __in CONST WNDCLASSEXA *);
WINUSERAPI
HWND
WINAPI
CreateWindowExA(
    __in DWORD dwExStyle,
    __in_opt LPCSTR lpClassName,
    __in_opt LPCSTR lpWindowName,
    __in DWORD dwStyle,
    __in int X,
    __in int Y,
    __in int nWidth,
    __in int nHeight,
    __in_opt HWND hWndParent,
    __in_opt HMENU hMenu,
    __in_opt HINSTANCE hInstance,
    __in_opt LPVOID lpParam);
WINUSERAPI
BOOL
WINAPI
DestroyWindow(
    __in HWND hWnd);
WINUSERAPI
BOOL
WINAPI
ShowWindow(
    __in HWND hWnd,
    __in int nCmdShow);
WINUSERAPI
BOOL
WINAPI
CloseWindow(
    __in  HWND hWnd);
WINUSERAPI
BOOL
WINAPI
MoveWindow(
    __in HWND hWnd,
    __in int X,
    __in int Y,
    __in int nWidth,
    __in int nHeight,
    __in BOOL bRepaint);
WINUSERAPI
BOOL
WINAPI
SetWindowPos(
    __in HWND hWnd,
    __in_opt HWND hWndInsertAfter,
    __in int X,
    __in int Y,
    __in int cx,
    __in int cy,
    __in UINT uFlags);
WINUSERAPI
BOOL
WINAPI
BringWindowToTop(
    __in HWND hWnd);
WINUSERAPI
BOOL
WINAPI
SetForegroundWindow(
	__in HWND hWnd);
WINUSERAPI
BOOL
WINAPI
EndDialog(
    __in HWND hDlg,
    __in INT_PTR nResult);
#define SRCCOPY             (DWORD)0x00CC0020 /* dest = source                   */
#define SRCPAINT            (DWORD)0x00EE0086 /* dest = source OR dest           */
#define SRCAND              (DWORD)0x008800C6 /* dest = source AND dest          */
#define SRCINVERT           (DWORD)0x00660046 /* dest = source XOR dest          */
#define SRCERASE            (DWORD)0x00440328 /* dest = source AND (NOT dest )   */
#define NOTSRCCOPY          (DWORD)0x00330008 /* dest = (NOT source)             */
#define NOTSRCERASE         (DWORD)0x001100A6 /* dest = (NOT src) AND (NOT dest) */
#define MERGECOPY           (DWORD)0x00C000CA /* dest = (source AND pattern)     */
#define MERGEPAINT          (DWORD)0x00BB0226 /* dest = (NOT source) OR dest     */
#define PATCOPY             (DWORD)0x00F00021 /* dest = pattern                  */
#define PATPAINT            (DWORD)0x00FB0A09 /* dest = DPSnoo                   */
#define PATINVERT           (DWORD)0x005A0049 /* dest = pattern XOR dest         */
#define DSTINVERT           (DWORD)0x00550009 /* dest = (NOT dest)               */
#define BLACKNESS           (DWORD)0x00000042 /* dest = BLACK                    */
#define WHITENESS           (DWORD)0x00FF0062 /* dest = WHITE                    */
#define NOMIRRORBITMAP      (DWORD)0x80000000 /* Do not Mirror the bitmap in this call */
#define CAPTUREBLT          (DWORD)0x40000000 /* Include layered windows */
BOOL    WINAPI BitBlt(__in HDC hdcDst, __in int x, __in int y, __in int cx, __in int cy, __in_opt HDC hdcSrc, __in int x1, __in int y1, __in DWORD rop);
HBITMAP WINAPI CreateBitmap(__in int nWidth, __in int nHeight, __in UINT nPlanes, __in UINT nBitCount, __in_opt LPVOID lpBits);
HBITMAP WINAPI CreateBitmapIndirect(__in LPVOID pbm);
HBRUSH  WINAPI CreateBrushIndirect(__in LPVOID plbrush);
HBITMAP WINAPI CreateCompatibleBitmap(__in HDC hdc, __in int cx, __in int cy);
HBITMAP WINAPI CreateDiscardableBitmap(__in HDC hdc, __in int cx, __in int cy);
HDC     WINAPI CreateCompatibleDC(__in_opt HDC hdc);
HDC     WINAPI CreateDCA(__in_opt LPCSTR pwszDriver, __in_opt LPCSTR pwszDevice, __in_opt LPCSTR pszPort, __in_opt LPVOID pdm);
BOOL    WINAPI DeleteDC(__in HDC hdc);
HDC     WINAPI GetDC(__in_opt HWND hWnd);
int     WINAPI ReleaseDC(__in_opt HWND hWnd, __in HDC hDC);
BOOL
WINAPI
GetTextExtentPoint32A(
	__in HDC hdc,
	__in_ecount(c) LPCSTR lpString,
	__in int c,
	__out LPPOINT lpsz);
WINUSERAPI
int
WINAPI
ToAscii(
	__in UINT uVirtKey,
	__in UINT uScanCode,
	__in_opt CONST BYTE *lpKeyState,
	__out DWORD *lpChar,
	__in UINT uFlags);
WINUSERAPI
HWND
WINAPI
GetDlgItem(
    __in_opt HWND hDlg,
    __in int nIDDlgItem);
WINUSERAPI
BOOL
WINAPI
SetDlgItemInt(
    __in HWND hDlg,
    __in int nIDDlgItem,
    __in UINT uValue,
    __in BOOL bSigned);
WINUSERAPI
UINT
WINAPI
GetDlgItemInt(
    __in HWND hDlg,
    __in int nIDDlgItem,
    __out_opt BOOL *lpTranslated,
    __in BOOL bSigned);
WINUSERAPI
BOOL
WINAPI
SetDlgItemTextA(
    __in HWND hDlg,
    __in int nIDDlgItem,
    __in LPCSTR lpString);
WINUSERAPI
UINT
WINAPI
GetDlgItemTextA(
    __in HWND hDlg,
    __in int nIDDlgItem,
    __out_ecount(cchMax) LPSTR lpString,
    __in int cchMax);
WINUSERAPI
BOOL
WINAPI
CheckDlgButton(
    __in HWND hDlg,
    __in int nIDButton,
    __in UINT uCheck);
WINUSERAPI
BOOL
WINAPI
CheckRadioButton(
    __in HWND hDlg,
    __in int nIDFirstButton,
    __in int nIDLastButton,
    __in int nIDCheckButton);
WINUSERAPI
UINT
WINAPI
IsDlgButtonChecked(
    __in HWND hDlg,
    __in int nIDButton);
WINUSERAPI
LRESULT
WINAPI
SendDlgItemMessageA(
    __in HWND hDlg,
    __in int nIDDlgItem,
    __in UINT Msg,
    __in WPARAM wParam,
    __in LPARAM lParam);
WINUSERAPI
HMENU
WINAPI
LoadMenuA(
    __in_opt HINSTANCE hInstance,
    __in LPCSTR lpMenuName);
WINUSERAPI
HMENU
WINAPI
GetMenu(
    __in HWND hWnd);
WINUSERAPI
BOOL
WINAPI
SetMenu(
    __in HWND hWnd,
    __in_opt HMENU hMenu);
WINUSERAPI
BOOL
WINAPI
ChangeMenuA(
    __in HMENU hMenu,
    __in UINT cmd,
    __in_opt LPCSTR lpszNewItem,
    __in UINT cmdInsert,
    __in UINT flags);
WINUSERAPI
UINT
WINAPI
GetMenuState(
    __in HMENU hMenu,
    __in UINT uId,
    __in UINT uFlags);
WINUSERAPI
HMENU
WINAPI
CreateMenu(VOID);
WINUSERAPI
HMENU
WINAPI
CreatePopupMenu(VOID);
WINUSERAPI
BOOL
WINAPI
DestroyMenu(
    __in HMENU hMenu);
WINUSERAPI
DWORD
WINAPI
CheckMenuItem(
    __in HMENU hMenu,
    __in UINT uIDCheckItem,
    __in UINT uCheck);
WINUSERAPI
BOOL
WINAPI
EnableMenuItem(
    __in HMENU hMenu,
    __in UINT uIDEnableItem,
    __in UINT uEnable);
WINUSERAPI
HMENU
WINAPI
GetSubMenu(
    __in HMENU hMenu,
    __in int nPos);
WINUSERAPI
UINT
WINAPI
GetMenuItemID(
    __in HMENU hMenu,
    __in int nPos);
WINUSERAPI
int
WINAPI
GetMenuItemCount(
    __in_opt HMENU hMenu);
WINUSERAPI
BOOL
WINAPI
InsertMenuA(
    __in HMENU hMenu,
    __in UINT uPosition,
    __in UINT uFlags,
    __in UINT_PTR uIDNewItem,
    __in_opt LPCSTR lpNewItem);
WINUSERAPI
BOOL
WINAPI
AppendMenuA(
    __in HMENU hMenu,
    __in UINT uFlags,
    __in UINT_PTR uIDNewItem,
    __in_opt LPCSTR lpNewItem);
WINUSERAPI
BOOL
WINAPI
ModifyMenuA(
    __in HMENU hMnu,
    __in UINT uPosition,
    __in UINT uFlags,
    __in UINT_PTR uIDNewItem,
    __in_opt LPCSTR lpNewItem);
WINUSERAPI
BOOL
WINAPI RemoveMenu(
    __in HMENU hMenu,
    __in UINT uPosition,
    __in UINT uFlags);
WINUSERAPI
BOOL
WINAPI
DeleteMenu(
    __in HMENU hMenu,
    __in UINT uPosition,
    __in UINT uFlags);

typedef struct tagMENUITEMINFOA
{
    UINT     cbSize;
    UINT     fMask;
    UINT     fType;
    UINT     fState;
    UINT     wID;
    HMENU    hSubMenu;
    HBITMAP  hbmpChecked;
    HBITMAP  hbmpUnchecked;
    ULONG_PTR dwItemData;
    LPSTR    dwTypeData;
    UINT     cch;
    HBITMAP  hbmpItem;
}   MENUITEMINFOA, *LPMENUITEMINFOA, CONST *LPCMENUITEMINFOA;
WINUSERAPI
BOOL
WINAPI
InsertMenuItemA(
    __in HMENU hmenu,
    __in UINT item,
    __in BOOL fByPosition,
    __in LPCMENUITEMINFOA lpmi);

#define TRANSPARENT 1
#define OPAQUE      2
int WINAPI SetBkMode(__in HDC hdc, __in int mode);

typedef struct tagRECT {
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
} RECT, *LPRECT;

WINUSERAPI
int
WINAPI
DrawTextA(
    __in HDC hdc,
    __inout_ecount(cchText) LPCSTR lpchText,
    __in int cchText,
    __inout LPRECT lprc,
    __in UINT format);

typedef struct tagPAINTSTRUCT {
    HDC         hdc;
    BOOL        fErase;
    RECT        rcPaint;
    BOOL        fRestore;
    BOOL        fIncUpdate;
    BYTE        rgbReserved[32];
} PAINTSTRUCT, *LPPAINTSTRUCT;
WINUSERAPI
HDC
WINAPI
BeginPaint(
    __in HWND hWnd,
    __out LPPAINTSTRUCT lpPaint);
WINUSERAPI
BOOL
WINAPI
EndPaint(
    __in HWND hWnd,
    __in CONST PAINTSTRUCT *lpPaint);
WINUSERAPI
BOOL
WINAPI
InvalidateRect(
    __in_opt HWND hWnd,
    __in_opt CONST RECT *lpRect,
    __in BOOL bErase);
WINUSERAPI
BOOL
WINAPI
SetWindowTextA(
    __in HWND hWnd,
    __in_opt LPCSTR lpString);
WINUSERAPI
int
WINAPI
GetWindowTextA(
    __in HWND hWnd,
    __out_ecount(nMaxCount) LPSTR lpString,
    __in int nMaxCount);
WINUSERAPI
int
WINAPI
MessageBoxA(
    __in_opt HWND hWnd,
    __in_opt LPCSTR lpText,
    __in_opt LPCSTR lpCaption,
    __in UINT uType);

typedef struct tagHELPINFO {      // Structure pointed to by lParam of WM_HELP
    UINT    cbSize;
    int     iContextType;
    int     iCtrlId;
    HANDLE  hItemHandle;
    DWORD_PTR dwContextId;
    POINT   MousePos;
} HELPINFO, *LPHELPINFO;
typedef VOID (CALLBACK *MSGBOXCALLBACK)(LPHELPINFO lpHelpInfo);
typedef struct tagMSGBOXPARAMSA
{
    UINT        cbSize;
    HWND        hwndOwner;
    HINSTANCE   hInstance;
    LPCSTR      lpszText;
    LPCSTR      lpszCaption;
    DWORD       dwStyle;
    LPCSTR      lpszIcon;
    DWORD_PTR   dwContextHelpId;
    MSGBOXCALLBACK      lpfnMsgBoxCallback;
    DWORD       dwLanguageId;
} MSGBOXPARAMSA, *PMSGBOXPARAMSA, *LPMSGBOXPARAMSA;
WINUSERAPI
int
WINAPI
MessageBoxIndirectA(
    __in CONST MSGBOXPARAMSA * lpmbp);

WINUSERAPI
BOOL
WINAPI
CheckMenuRadioItem(
    __in HMENU hmenu,
    __in UINT first,
    __in UINT last,
    __in UINT check,
    __in UINT flags);
WINUSERAPI
HICON
WINAPI
LoadIconA(
    __in_opt HINSTANCE hInstance,
    __in LPCSTR lpIconName);
WINUSERAPI
HCURSOR
WINAPI
LoadCursorA(
    __in_opt HINSTANCE hInstance,
    __in LPCSTR lpCursorName);
WINAPI PVOID GetStockObject(__in int i);
WINUSERAPI
BOOL
WINAPI
UpdateWindow(
    __in HWND hWnd);
WINUSERAPI
BOOL
WINAPI
GetClientRect(
    __in HWND hWnd,
    __out LPRECT lpRect);
WINUSERAPI
BOOL
WINAPI
GetWindowRect(
    __in HWND hWnd,
    __out LPRECT lpRect);
WINUSERAPI
BOOL
WINAPI
AdjustWindowRect(
    __inout LPRECT lpRect,
    __in DWORD dwStyle,
    __in BOOL bMenu);
WINUSERAPI
BOOL
WINAPI
AdjustWindowRectEx(
    __inout LPRECT lpRect,
    __in DWORD dwStyle,
    __in BOOL bMenu,
    __in DWORD dwExStyle);
HBRUSH WINAPI CreateSolidBrush(DWORD color);
HPEN WINAPI CreatePen(int style, int width, DWORD color);
DWORD WINAPI SetTextColor(__in HDC hdc, __in DWORD color);
BOOL WINAPI TextOutA( __in HDC hdc, __in int x, __in int y, __in_ecount(c) LPCSTR lpString, __in int c);
BOOL WINAPI MoveToEx( __in HDC hdc, __in int x, __in int y, __out_opt LPPOINT lppt);
BOOL WINAPI LineTo( __in HDC hdc, __in int x, __in int y);
BOOL WINAPI Rectangle(__in HDC hdc, __in int left, __in int top, __in int right, __in int bottom);
HANDLE WINAPI SelectObject(__in HDC hdc, __in HANDLE h);
BOOL WINAPI DeleteObject(__in HANDLE ho);
DWORD WINAPI SetBkColor(__in HDC hdc, __in DWORD color);
DWORD WINAPI SetDCBrushColor(__in HDC hdc, __in DWORD color);
DWORD WINAPI SetDCPenColor(__in HDC hdc, __in DWORD color);
int WINAPI FillRect(__in HDC hDC, __in CONST RECT *lprc, __in HBRUSH hbr);

WINUSERAPI HWND WINAPI GetCapture(VOID);
WINUSERAPI HWND WINAPI SetCapture(__in HWND hWnd);
WINUSERAPI BOOL WINAPI ReleaseCapture(VOID);

#define FORMAT_MESSAGE_ALLOCATE_BUFFER 0x00000100
#define FORMAT_MESSAGE_IGNORE_INSERTS  0x00000200
#define FORMAT_MESSAGE_FROM_STRING     0x00000400
#define FORMAT_MESSAGE_FROM_HMODULE    0x00000800
#define FORMAT_MESSAGE_FROM_SYSTEM     0x00001000
#define FORMAT_MESSAGE_ARGUMENT_ARRAY  0x00002000
#define FORMAT_MESSAGE_MAX_WIDTH_MASK  0x000000FF

DWORD
WINAPI
GetLastError(VOID);
VOID
WINAPI
SetLastError(
    __in DWORD dwErrCode
    );
DWORD
WINAPI
FormatMessageA(
    DWORD dwFlags,
    LPVOID lpSource,
    DWORD dwMessageId,
    DWORD dwLanguageId,
    LPSTR lpBuffer,
    DWORD nSize,
    void *Arguments
    );

#define OFN_READONLY                 0x00000001
#define OFN_OVERWRITEPROMPT          0x00000002
#define OFN_HIDEREADONLY             0x00000004
#define OFN_NOCHANGEDIR              0x00000008
#define OFN_SHOWHELP                 0x00000010
#define OFN_ENABLEHOOK               0x00000020
#define OFN_ENABLETEMPLATE           0x00000040
#define OFN_ENABLETEMPLATEHANDLE     0x00000080
#define OFN_NOVALIDATE               0x00000100
#define OFN_ALLOWMULTISELECT         0x00000200
#define OFN_EXTENSIONDIFFERENT       0x00000400
#define OFN_PATHMUSTEXIST            0x00000800
#define OFN_FILEMUSTEXIST            0x00001000
#define OFN_CREATEPROMPT             0x00002000
#define OFN_SHAREAWARE               0x00004000
#define OFN_NOREADONLYRETURN         0x00008000
#define OFN_NOTESTFILECREATE         0x00010000
#define OFN_NONETWORKBUTTON          0x00020000
#define OFN_NOLONGNAMES              0x00040000     // force no long names for 4.x modules
#define OFN_EXPLORER                 0x00080000     // new look commdlg
#define OFN_NODEREFERENCELINKS       0x00100000
#define OFN_LONGNAMES                0x00200000     // force long names for 3.x modules
#define OFN_ENABLEINCLUDENOTIFY      0x00400000     // send include message to callback
#define OFN_ENABLESIZING             0x00800000
#define OFN_DONTADDTORECENT          0x02000000
#define OFN_FORCESHOWHIDDEN          0x10000000    // Show All files including System and hidden files
typedef struct tagOFNA {
   DWORD        lStructSize;
   HWND         hwndOwner;
   HINSTANCE    hInstance;
   LPCSTR       lpstrFilter;
   LPSTR        lpstrCustomFilter;
   DWORD        nMaxCustFilter;
   DWORD        nFilterIndex;
   LPSTR        lpstrFile;
   DWORD        nMaxFile;
   LPSTR        lpstrFileTitle;
   DWORD        nMaxFileTitle;
   LPCSTR       lpstrInitialDir;
   LPCSTR       lpstrTitle;
   DWORD        Flags;
   WORD         nFileOffset;
   WORD         nFileExtension;
   LPCSTR       lpstrDefExt;
   LPARAM       lCustData;
   LPVOID       lpfnHook;
   LPCSTR       lpTemplateName;
   void *       pvReserved;
   DWORD        dwReserved;
   DWORD        FlagsEx;
} OPENFILENAMEA, *LPOPENFILENAMEA;
BOOL WINAPI GetOpenFileNameA(LPOPENFILENAMEA);
BOOL WINAPI GetSaveFileNameA(LPOPENFILENAMEA);
EOS

end

module Protect
	@@lasterror = Time.now
	def protect
		yield
	rescue Object
		puts $!.message, $!.backtrace   # also dump on stdout, for c/c
		delay = Time.now-@@lasterror
		sleep 1-delay if delay < 1      # msgbox flood protection
		@@lasterror = Time.now
		messagebox([$!.message, $!.backtrace].join("\n"), $!.class.name)
	end
end

module Msgbox
	include Protect

	def toplevel
		@hwnd || 0
	end

	# shows a message box (non-modal)
	# args: message, title/optionhash
	def messagebox(*a)
		MessageBox.new(toplevel, *a)
	end

	# asks for user input, yields the result (unless 'cancel' clicked)
	# args: prompt, :text => default text, :title => title
	def inputbox(*a)
		InputBox.new(toplevel, *a) { |*ya| protect { yield(*ya) } }
	end

	# asks to chose a file to open, yields filename
	# args: title, :path => path
	def openfile(*a)
		OpenFile.new(toplevel, *a) { |*ya| protect { yield(*ya) } }
	end

	# same as openfile, but for writing a (new) file
	def savefile(*a)
		SaveFile.new(toplevel, *a) { |*ya| protect { yield(*ya) } }
	end

	# displays a popup showing a table, yields the selected row
	# args: title, [[col0 title, col1 title...], [col0 val0, col1 val0...], [val1], [val2]...]
	def listwindow(*a)
		ListWindow.new(toplevel, *a) { |*ya| protect { yield(*ya) } }
	end
end

class WinWidget
	include Msgbox
	attr_accessor :parent, :hwnd, :x, :y, :width, :height

	def initialize
		@parent = nil
		@hwnd = nil
		@x = @y = @width = @height = 0
	end
end

class ContainerChoiceWidget < WinWidget
	attr_accessor :views, :view_indexes
	def initialize(*a, &b)
		@views = {}
		@view_indexes = []
		@curview = nil
		@visible = false

		super()

		initialize_widget(*a, &b)
	end

	def initialize_visible_
		@visible = true
		@views.each { |k, v| v.initialize_visible_ }
	end

	def view(i)
		@views[i]
	end

	def showview(i)
		@curview = @views[i]
		@curview.redraw if @curview
	end

	def addview(name, w)
		@view_indexes << name
		@views[name] = w
		@curview ||= w
		w.parent = self
		w.hwnd = @hwnd
		w.x, w.y, w.width, w.height = @x, @y, @width, @height
		w.initialize_visible_ if @visible
		w
	end

	def curview
		@curview
	end

	def curview_index
		@views.index(@curview)
	end

	%w[click click_ctrl mouserelease mousemove rightclick doubleclick mouse_wheel mouse_wheel_ctrl keypress_ keypress_ctrl_].each { |m|
		define_method(m) { |*a| @curview.send(m, *a) if @curview and @curview.respond_to? m }
	}

	def paint_(rc)
		@curview.paint_(rc) if @curview
	end

	def resized_(w, h)
		@width = w
		@height = h
		@views.each { |k, v| v.resized_(w, h) }
	end

	def hwnd=(h)
		@hwnd = h
		@views.each { |k, v| v.hwnd = h }
	end
end

class ContainerVBoxWidget < WinWidget
end

module TextWidget
	attr_accessor :caret_x, :caret_y, :hl_word

	def initialize_text
		@caret_x = @caret_y = 0		# text cursor position
		@oldcaret_x = @oldcaret_y = 1
		@hl_word = nil
	end

	def update_hl_word(line, offset)
		return if not line
		word = line[0...offset].to_s[/\w*$/] << line[offset..-1].to_s[/^\w*/]
		word = nil if word == ''
		@hl_word = word if @hl_word != word
	end

	def set_caret_from_click(x, y)
		@caret_x = (x-1).to_i / @font_width
		@caret_y = y.to_i / @font_height
		update_caret
	end

	def invalidate_caret(cx, cy, x=0, y=0)
		invalidate(x + cx*@font_width, y + cy*@font_height, 2, @font_height)
	end

	def clipboard_copy(buf)
		Win32Gui.openclipboard(@hwnd)
		Win32Gui.emptyclipboard
		if buf and not buf.empty?
			h = Win32Gui.globalalloc(Win32Gui::GMEM_MOVEABLE, buf.length+1)
			ptr = Win32Gui.globallock(h)
			Win32Gui.memory_write(ptr, buf)
			Win32Gui.globalunlock(h)
			Win32Gui.setclipboarddata(Win32Gui::CF_TEXT, h)
			# on(WM_DESTROYCLIPBOARD) { Win32Gui.globalfree(h) }
		end
		Win32Gui.closeclipboard
	end

	def clipboard_paste
		Win32Gui.openclipboard(@hwnd)
		h = Win32Gui.getclipboarddata(Win32Gui::CF_TEXT)
		if h and h != 0 and h != Win32Gui::GMEM_INVALID_HANDLE
			sz = Win32Gui.globalsize(h)
			ptr = Win32Gui.globallock(h)
			buf = Win32Gui.memory_read(ptr, sz)
			Win32Gui.globalunlock(h)
			Win32Gui.closeclipboard
			buf.chomp(0.chr)
		end
	end
end

class DrawableWidget < WinWidget
	include TextWidget

	def initialize(*a, &b)
puts "init #{self.class}", caller if self.class.name =~ /AsmList/
		@color = {}
		@default_color_association = { :background => :palegrey }

		super()

		initialize_text
		initialize_widget(*a, &b)
	end

	def initialize_visible_
		{ :white => 'fff', :palegrey => 'ddd', :black => '000', :grey => '444',
			:red => 'f00', :darkred => '800', :palered => 'fcc',
			:green => '0f0', :darkgreen => '080', :palegreen => 'cfc',
			:blue => '00f', :darkblue => '008', :paleblue => 'ccf',
			:yellow => 'ff0', :darkyellow => '440', :paleyellow => 'ffc',
		}.each { |tag, val|
			@color[tag] = color(val)
		}
		@color[:winbg] = Win32Gui.getsyscolor(Win32Gui::COLOR_BTNFACE)
		set_color_association(@default_color_association)	# should be called after Gui.main
		set_font('courier 10')
		initialize_visible if respond_to? :initialize_visible
	end

	def set_color_association(h)
		h.each { |k, v| @color[k] = color(v) }
		gui_update
	end

	def set_font(todo)
		hdc = Win32Gui.getdc(@hwnd)
		# selectobject(hdc, hfont)
		sz = Win32Gui.alloc_c_struct('POINT')
		Win32Gui.gettextextentpoint32a(hdc, 'x', 1, sz)
		@font_width = sz[:x]
		@font_height = sz[:y]
		Win32Gui.releasedc(@hwnd, hdc)
	end

	def grab_focus
		@parent.set_focus(self) if @parent and @parent.respond_to? :set_focus
	end
	
	def focus?
		if @parent and @parent.respond_to? :has_focus?
			@parent.has_focus?(self)
		else true
		end
	end

	def paint_(realhdc)
		@hdc = Win32Gui.createcompatibledc(realhdc)
		bmp = Win32Gui.createcompatiblebitmap(realhdc, @width, @height)
		Win32Gui.selectobject(@hdc, bmp)
		Win32Gui.selectobject(@hdc, Win32Gui.getstockobject(Win32Gui::DC_BRUSH))
		Win32Gui.selectobject(@hdc, Win32Gui.getstockobject(Win32Gui::DC_PEN))
		Win32Gui.selectobject(@hdc, Win32Gui.getstockobject(Win32Gui::ANSI_FIXED_FONT))
		Win32Gui.setbkmode(@hdc, Win32Gui::TRANSPARENT)
		draw_rectangle_color(:background, 0, 0, @width, @height)
		paint
		Win32Gui.bitblt(realhdc, @x, @y, @width, @height, @hdc, 0, 0, Win32Gui::SRCCOPY)
		Win32Gui.deleteobject(bmp)
		Win32Gui.deletedc(@hdc)
		@hdc = nil
	end

	def resized_(w, h)
		@width = w
		@height = h
		resized(w, h) if respond_to? :resized
	end

	def keypress_(key)
		# XXX my gtk api sux
		if not respond_to? :keypress or not keypress(key)
			@parent.keypress(key) if @parent.respond_to? :keypress
		end
	end

	def keypress_ctrl_(key)
		if not respond_to? :keypress_ctrl or not keypress_ctrl(key)
			@parent.keypress_ctrl(key) if @parent.respond_to? :keypress_ctrl
		end
	end

	def gui_update
		redraw
	end

	def redraw
		invalidate(0, 0, @width, @height)
	end

	def invalidate(x, y, w, h)
		rect = Win32Gui.alloc_c_struct('RECT', :left => @x+x, :right => @x+x+w, :top => @y+y, :bottom => @y+y+h)
		Win32Gui.invalidaterect(@hwnd, rect, Win32Gui::FALSE)
	end

	def color(col)
		@color[col] ||= col.sub(/^(\w)(\w)(\w)$/, '\\3\\3\\2\\2\\1\\1').to_i(16)
	end

	def draw_color(col)
		col = color(col)
		Win32Gui.settextcolor(@hdc, col)
		Win32Gui.setdcpencolor(@hdc, col)
		Win32Gui.setdcbrushcolor(@hdc, col)
	end

	def draw_line(x, y, ex, ey)
		Win32Gui.movetoex(@hdc, x, y, 0)
		Win32Gui.lineto(@hdc, ex, ey)
	end

	def draw_line_color(col, x, y, ex, ey)
		Win32Gui.setdcpencolor(@hdc, color(col))
		draw_line(x, y, ex, ey)
	end

	def draw_rectangle(x, y, w, h)
		Win32Gui.rectangle(@hdc, x, y, x+w, y+h)
	end

	def draw_rectangle_color(col, x, y, w, h)
		Win32Gui.setdcbrushcolor(@hdc, color(col))
		Win32Gui.setdcpencolor(@hdc, color(col))	# rect border
		draw_rectangle(x, y, w, h)
	end

	def draw_string(x, y, text)
		Win32Gui.textouta(@hdc, x, y, text, text.length)
	end

	def draw_string_color(col, x, y, text)
		Win32Gui.settextcolor(@hdc, color(col))
		draw_string(x, y, text)
	end

	def kbd_shift
		Win32Gui.getkeystate(Win32Gui::VK_SHIFT) & 0x8000 > 0
	end
end

class Window
	include Msgbox

	attr_accessor :menu, :hwnd
	def initialize(*a, &b)
		@widget = nil
		@controlid = 1	# next free control id for menu items, buttons etc
		@control_action = {}
		(@@mainwindow_list ||= []) << self
		@visible = false

		cname = "metasm_w32gui_#{object_id}"
		cls = Win32Gui.alloc_c_struct 'WNDCLASSEXA', :cbsize => :size,
				:style => Win32Gui::CS_DBLCLKS,
				:hcursor => Win32Gui.loadcursora(0, Win32Gui::IDC_ARROW),
				:lpszclassname => cname,
  				:lpfnwndproc => Win32Gui.callback_alloc_c('__stdcall int wndproc(int, int, int, int)') { |hwnd, msg, wp, lp| windowproc(hwnd, msg, wp, lp) }

		Win32Gui.registerclassexa(cls)
		
		@hwnd = Win32Gui.createwindowexa(nil, cname, 'win32gui window', Win32Gui::WS_OVERLAPPEDWINDOW, Win32Gui::CW_USEDEFAULT, Win32Gui::CW_USEDEFAULT, Win32Gui::CW_USEDEFAULT, Win32Gui::CW_USEDEFAULT, 0, 0, 0, 0)

		initialize_window(*a, &b)

		if respond_to? :build_menu
			@menu = new_menu
			build_menu
			Win32Gui.setmenu(@hwnd, @menu)
		end

		Win32Gui.showwindow(@hwnd, Win32Gui::SW_SHOWDEFAULT)
		Win32Gui.updatewindow(@hwnd)
	end

	# keypress event keyval traduction table
	Keyboard_trad = Win32Gui.constants.grep(/^VK_/).inject({}) { |h, cst|
		v = Win32Gui.const_get(cst)
		key = cst.to_s.sub(/^VK_/, '').downcase.to_sym
		h.update v => {
			:prior => :pgup, :next => :pgdown,
			:escape => :esc, :return => :enter,
			:back => :backspace,
		}.fetch(key, key)
	}

	MSGNAME = Win32Gui.constants.grep(/WM_/).inject({}) { |h, c| h.update Win32Gui.const_get(c) => c }
	def windowproc(hwnd, msg, wparam, lparam)
case msg
when Win32Gui::WM_NCHITTEST, Win32Gui::WM_SETCURSOR, Win32Gui::WM_MOUSEMOVE
else
puts "wproc #{'%x' % hwnd} #{MSGNAME[msg] || msg} #{'%x' % wparam} #{'%x' % lparam}"
end
		case msg
		when Win32Gui::WM_NCHITTEST, Win32Gui::WM_SETCURSOR
			# most frequent messages (with MOUSEMOVE)
			return Win32Gui.defwindowproca(hwnd, msg, wparam, lparam)
		when Win32Gui::WM_MOUSEMOVE, Win32Gui::WM_LBUTTONDOWN, Win32Gui::WM_RBUTTONDOWN,
			Win32Gui::WM_LBUTTONDBLCLK, Win32Gui::WM_MOUSEWHEEL, Win32Gui::WM_LBUTTONUP
			mouse_msg(msg, wparam, lparam)
		when Win32Gui::WM_PAINT
			ps = Win32Gui.alloc_c_struct('PAINTSTRUCT')
			hdc = Win32Gui.beginpaint(hwnd, ps)
			if @widget
				@widget.paint_(hdc)
			else
				Win32Gui.selectobject(hdc, Win32Gui.getstockobject(Win32Gui::DC_BRUSH))
				Win32Gui.selectobject(hdc, Win32Gui.getstockobject(Win32Gui::DC_PEN))
				col = Win32Gui.getsyscolor(Win32Gui::COLOR_BTNFACE)
				Win32Gui.setdcbrushcolor(hdc, col)
				Win32Gui.setdcpencolor(hdc, col)
				Win32Gui.rectangle(hdc, 0, 0, @width, @height)
			end
			Win32Gui.endpaint(hwnd, ps)
		when Win32Gui::WM_MOVE
			rect = Win32Gui.alloc_c_struct('RECT')
			Win32Gui.getwindowrect(@hwnd, rect)
			@x, @y, @width, @height = rect[:left], rect[:top], rect[:right]-rect[:left], rect[:bottom]-rect[:top]
		when Win32Gui::WM_SIZE
			rect = Win32Gui.alloc_c_struct('RECT')
			Win32Gui.getwindowrect(@hwnd, rect)
			@x, @y, @width, @height = rect[:left], rect[:top], rect[:right]-rect[:left], rect[:bottom]-rect[:top]
			@widget.resized_(lparam & 0xffff, (lparam >> 16) & 0xffff) if @widget
			redraw
		when Win32Gui::WM_CREATE
			@visible = true
			@widget.initialize_visible_ if @widget
		when Win32Gui::WM_KEYDOWN, Win32Gui::WM_SYSKEYDOWN
			# SYSKEYDOWN for f10 (default = activate the menu bar)
			if key = Keyboard_trad[wparam]
				if Win32Gui.getkeystate(Win32Gui::VK_CONTROL) & 0x8000 > 0
					@widget.keypress_ctrl_(key) if @widget
				else
					@widget.keypress_(key) if @widget
					Win32Gui.defwindowproca(hwnd, msg, wparam, lparam) if key == :f4	# alt+f4
				end
			end
		when Win32Gui::WM_CHAR
			if Win32Gui.getkeystate(Win32Gui::VK_CONTROL) & 0x8000 > 0
				wparam += ((Win32Gui.getkeystate(Win32Gui::VK_SHIFT) & 0x8000 > 0) ? ?A : ?a) - 1 if wparam < 0x1a
				@widget.keypress_ctrl_(wparam) if @widget
			else
				@widget.keypress_(wparam) if @widget
			end
		when Win32Gui::WM_DESTROY
			destroy_window
		when Win32Gui::WM_COMMAND
			if a = @control_action[wparam]
				protect { a.call }
			end
		else return Win32Gui.defwindowproca(hwnd, msg, wparam, lparam)
		end
		0
	end

	def mouse_msg(msg, wparam, lparam)
		return if not @widget
		x = lparam & 0xffff
		y = (lparam >> 16) & 0xffff
		ctrl = true if wparam & Win32Gui::MK_CONTROL > 0
		cmsg =
		case msg
		when Win32Gui::WM_MOUSEMOVE
			:mousemove
		when Win32Gui::WM_LBUTTONDOWN
			ctrl ? :click_ctrl : :click
		when Win32Gui::WM_LBUTTONUP
			:mouserelease
		when Win32Gui::WM_RBUTTONDOWN
			:rightclick
		when Win32Gui::WM_LBUTTONDBLCLK
			:doubleclick
		when Win32Gui::WM_MOUSEWHEEL
			off = Expression.make_signed(wparam >> 16, 16)
			dir = off > 0 ? :up : :down
			if ctrl
				return(@widget.mouse_wheel_ctrl(dir, x, y) if @widget.respond_to? :mouse_wheel_ctrl)
			else
				return(@widget.mouse_wheel(dir) if @widget.respond_to? :mouse_wheel)
			end
		end
		@widget.send(cmsg, x, y) if cmsg and @widget.respond_to? cmsg
	end

	attr_reader :x, :y, :width, :height
	def x=(newx)
		Win32Gui.movewindow(@hwnd, newx, @y, @width, @height, Win32Gui::TRUE)
	end
	def y=(newy)
		Win32Gui.movewindow(@hwnd, @x, newy, @width, @height, Win32Gui::TRUE)
	end
	def width=(newwidth)
		Win32Gui.movewindow(@hwnd, @x, @y, newwidth, @height, Win32Gui::TRUE)
	end
	def height=(newheight)
		Win32Gui.movewindow(@hwnd, @x, @y, @width, newheight, Win32Gui::TRUE)
	end

	def widget ; @widget ; end
	def widget=(w)
		@widget = w
		w.hwnd = @hwnd if w
		w.parent = self
		if @visible and w
			@widget.initialize_visible_
			rect = Win32Gui.alloc_c_struct('RECT')
			Win32Gui.getclientrect(@hwnd, rect)
			@widget.resized_(rect[:right], rect[:bottom])
		end
		redraw
	end

	def redraw
		Win32Gui.invalidaterect(@hwnd, 0, Win32Gui::FALSE)
	end

	def destroy
		Win32Gui.sendmessagea(@hwnd, Win32Gui::WM_CLOSE, 0, 0)
	end

	def destroy_window
		@@mainwindow_list.delete self
		Gui.main_quit if @@mainwindow_list.empty?	# XXX we didn't call Gui.main, we shouldn't Gui.main_quit...
	end

	def new_menu
		Win32Gui.createmenu()
	end

	def addsubmenu(menu, *args, &action)
		stock = (%w[OPEN SAVE CLOSE QUIT] & args).first
		args.delete stock if stock
		accel = args.grep(/^\^?(\w|<\w+>)$/).first
		args.delete accel if accel
		check = args.delete :check
		submenu = args.grep(Integer).first
		args.delete submenu if submenu
		label = args.shift

		label ||= '_' + stock.capitalize if stock

		flags = 0

		if check
			checked = args.shift
			flags |= (checked ? Win32Gui::MF_CHECKED : Win32Gui::MF_UNCHECKED)
		end
		flags |= Win32Gui::MF_POPUP if submenu
		if label
			flags |= Win32Gui::MF_STRING
			label = label.gsub('&', '&&')
			label = label.tr('_', '&')
		else
			flags |= Win32Gui::MF_SEPARATOR
		end

		if accel
			key = accel[-1]
			key = accel[/<(.*)>/, 1] if key == ?>
			label += "\t#{'c-' if accel[0] == ?^}#{key.kind_of?(Integer) ? key.chr : key}"
		end

		if action
			id = @controlid
			if not check
				@control_action[id] = action
			else
				@control_action[id] = lambda {
					checked = action.call(!checked)
					Win32Gui.checkmenuitem(@menu, id, (checked ? Win32Gui::MF_CHECKED : Win32Gui::MF_UNCHECKED))
				}
			end
			@controlid += 1
		end

		Win32Gui.appendmenua(menu, flags, id || submenu, label)
	end

	def hack_accel_group
	end

	def title; @title; end
	def title=(t)
		@title = t
		Win32Gui.setwindowtexta(@hwnd, @title)
	end
end

class OpenFile
	def w32api(arg)
		Win32Gui.getopenfilenamea(arg)
	end
	def w32flags
		Win32Gui::OFN_PATHMUSTEXIST
	end

	def initialize(hwnd, title, opts={})
		hwnd = 0	# non-modal
		buf = 0.chr*512
		ofn = Win32Gui.alloc_c_struct 'OPENFILENAMEA',
			:lstructsize => :size,
  			:hwndowner => hwnd,
			:lpstrfilter => "All Files\0*.*\0\0",
			:lpstrfile => buf,
			:lpstrtitle => title,
			:nmaxfile => buf.length,
			:flags => Win32Gui::OFN_DONTADDTORECENT | Win32Gui::OFN_LONGNAMES |
				Win32Gui::OFN_HIDEREADONLY | w32flags
		ofn[:lpstrinitialdir] = opts[:path] if opts[:path]
		return if w32api(ofn) == 0
		buf = buf[0, buf.index(0.chr)] if buf.index(0.chr)
		yield buf if buf != ''
	end
end

class SaveFile < OpenFile
	def w32api(arg)
		Win32Gui.getsavefilenamea(arg)
	end
	def w32flags
		Win32Gui::OFN_OVERWRITEPROMPT
	end
end

class MessageBox
	def initialize(hwnd, msg, opts={})
		hwnd = 0	# non-modal
		opts = { :title => opts } if opts.kind_of? String
		Win32Gui.messageboxa(hwnd, msg, opts[:title], 0)
	end
end

class InputBox < Window
class IBoxWidget < DrawableWidget
	def initialize_widget(hwnd, label, opts, &b)
		@parent_hwnd = hwnd
		@label = label
		@action = b
		@curline = ''
		@b1down = @b2down = @textdown = false
		@caret_x_select = nil

		@default_color_association = { :background => :winbg, :label => :black,
			:text => :black, :textbg => :white, :caret => :black, :btnc1 => :palegrey,
			:btnc2 => :grey, :textsel => :white, :textselbg => :darkblue }
	end

	def initialize_visible
		r1 = Win32Gui.alloc_c_struct('RECT')
		Win32Gui.getwindowrect(@parent_hwnd, r1)
		r2 = Win32Gui.alloc_c_struct('RECT', :left => 0, :top => 0, :right => 40*@font_width, :bottom => 8*@font_height)
		Win32Gui.adjustwindowrect(r2, Win32Gui::WS_OVERLAPPED, Win32Gui::FALSE)
		x = r1[:left]+(r1[:right]-r1[:left]-r2[:right]+r2[:left])/2
		y = r1[:top]+(r1[:bottom]-r1[:top]-r2[:bottom]+r2[:top])/2
		Win32Gui.movewindow(@hwnd, x, y, r2[:right]-r2[:left], r2[:bottom]-r2[:top], Win32Gui::FALSE)
	end

	def paint
		y = @font_height/2

		fixedfont = Win32Gui.selectobject(@hdc, Win32Gui.getstockobject(Win32Gui::ANSI_VAR_FONT))
		sz = Win32Gui.alloc_c_struct('POINT')
		Win32Gui.gettextextentpoint32a(@hdc, 'x', 1, sz)
		var_font_height = sz[:y]
		@label.each_line { |l|
			draw_string_color(:label, @font_width, y, l)
			y += var_font_height
		}
		y += @font_height
		@texty = y-1
		@texth = @font_height+1

		y += @font_height*2
		@by = y
		@bw = 10*@font_width
		@bh = @font_height*3/2
		@bx1 = (@width - 2*@bw - 3*@font_width) / 2
		@bx2 = @bx1 + 3*@font_width + @bw

		c1 = @b1down ? :btnc2 : :btnc1
		c2 = @b1down ? :btnc1 : :btnc2
		draw_string_color(:text, @bx1+4*@font_width, @by+@font_height*3/8, 'Ok')
		draw_line_color(c1, @bx1, @by, @bx1, @by+@bh)
		draw_line_color(c1, @bx1, @by, @bx1+@bw, @by)
		draw_line_color(c2, @bx1+@bw, @by+@bh, @bx1, @by+@bh)
		draw_line_color(c2, @bx1+@bw, @by+@bh, @bx1+@bw, @by)

		c1 = @b2down ? :btnc2 : :btnc1
		c2 = @b2down ? :btnc1 : :btnc2
		draw_string_color(:text, @bx2+3*@font_width, @by+@font_height*3/8, 'Cancel')
		draw_line_color(c1, @bx2, @by, @bx2, @by+@bh)
		draw_line_color(c1, @bx2, @by, @bx2+@bw, @by)
		draw_line_color(c2, @bx2+@bw, @by+@bh, @bx2, @by+@bh)
		draw_line_color(c2, @bx2+@bw, @by+@bh, @bx2+@bw, @by)

		Win32Gui.selectobject(@hdc, fixedfont)
		w_c = width/@font_width - 2

		if @caret_x < w_c
			@textoff = 0
		else
			@textoff = @caret_x-w_c+1
		end
		draw_rectangle_color(:textbg, @font_width, @texty-1, @width-2*@font_width, @font_height+1)
		draw_string_color(:text, @font_width+1, @texty, @curline[@textoff, w_c])

		if @caret_x_select
			c1, c2 = [@caret_x_select, @caret_x].sort
			c1 = [[c1, @textoff].max, @textoff+w_c].min
			c2 = [[c2, @textoff].max, @textoff+w_c].min
			if c1 != c2
				draw_rectangle_color(:textselbg, @font_width+1+(c1-@textoff)*@font_width, @texty-1, (c2-c1)*@font_width, @font_height+1)
				draw_string_color(:textsel, @font_width+1+(c1-@textoff)*@font_width, @texty, @curline[c1...c2])
			end
		end

		cx = [@caret_x+1, w_c].min*@font_width+1
		draw_line_color(:caret, cx, @texty, cx, @texty+@font_height-1)
		@oldcaret_x = @caret_x
	end

	def keypress_ctrl(key)
		case key
		when ?a
			@caret_x_select = 0
			@caret_x = @curline.length
			redraw
		when ?c
			if @caret_x_select
				c1, c2 = [@caret_x, @caret_x_select].sort
				clipboard_copy @curline[c1...c2]
			end
		when ?v
			cptext = clipboard_paste.to_s
			cx = @caret_x_select || @caret_x
			@caret_x_select = nil
			c1, c2 = [cx, @caret_x].sort
			@curline[c1...c2] = cptext
			@caret_x_select = nil
			@caret_x = c1 + cptext.length
			redraw
		when ?x
			if @caret_x_select
				c1, c2 = [@caret_x, @caret_x_select].sort
				clipboard_copy @curline[c1...c2]
				@curline[c1..c2] = ''
				@caret_x_select = nil
				@caret_x = c1
				redraw
			end
		else return false
		end
		true
	end

	def keypress(key)
		case key
		when :left
			if kbd_shift
				@caret_x_select ||= @caret_x
			else
				@caret_x_select = nil
			end
			if @caret_x > 0
				@caret_x -= 1
				update_caret
			end
		when :right
			if kbd_shift
				@caret_x_select ||= @caret_x
			else
				@caret_x_select = nil
			end
			if @caret_x < @curline.length
				@caret_x += 1
				update_caret
			end
		when :home
			if kbd_shift
				@caret_x_select ||= @caret_x
			else
				@caret_x_select = nil
			end
			@caret_x = 0
			update_caret
		when :end
			if kbd_shift
				@caret_x_select ||= @caret_x
			else
				@caret_x_select = nil
			end
			@caret_x = @curline.length
			update_caret
		when :enter
			destroy
			Gui.main_iter
			protect { @action.call(@curline) }
		when :esc
			if @b1down or @b2down
				@b1down = @b2down = false
				redraw
			else
				destroy
			end
		when ?\x20..?\x7e
			cx = @caret_x_select || @caret_x
			@caret_x_select = nil
			c1, c2 = [cx, @caret_x].sort
			@curline[c1...c2] = key.chr
			@caret_x = c1+1
			redraw
		when :delete
			if @caret_x_select
				c1, c2 = [@caret_x, @caret_x_select].sort
				@curline[c1...c2] = ''
				@caret_x_select = nil
				@caret_x = c1
				redraw
			elsif @caret_x < @curline.length
				@curline[@caret_x, 1] = ''
				redraw
			end
		when :backspace
			if @caret_x_select
				c1, c2 = [@caret_x, @caret_x_select].sort
				@curline[c1...c2] = ''
				@caret_x_select = nil
				@caret_x = c1
				redraw
			elsif @caret_x > 0
				@caret_x -= 1
				@curline[@caret_x, 1] = ''
				redraw
			end
		else return false
		end
		true
	end

	def click(x, y)
		Win32Gui.setcapture(@hwnd)
		if y >= @texty and y < @texty+@texth
			@caret_x_select = nil
			@caret_x = x.to_i / @font_width - 1 + @textoff
			@caret_x = [[@caret_x, 0].max, @curline.length].min
			@textdown = @caret_x
			update_caret
		elsif y >= @by and y < @by+@bh
			if x >= @bx1 and x < @bx1+@bw
				@b1down = true
				redraw
			elsif x >= @bx2 and x < @bx2+@bw
				@b2down = true
				redraw
			end
		end
	end

	def mousemove(x, y)
		if @textdown
			x = Expression.make_signed(x, 16)
			x = x.to_i / @font_width - 1 + @textoff
			x = [[x, 0].max, @curline.length].min
			if x != @textdown
				@caret_x_select = @textdown
				@caret_x = x
				redraw
			end
		end
	end

	def mouserelease(x, y)
		Win32Gui.releasecapture
		if @textdown
			x = Expression.make_signed(x, 16)
			x = x.to_i / @font_width - 1 + @textoff
			x = [[x, 0].max, @curline.length].min
			if x != @textdown
				@caret_x_select = @textdown
				@caret_x = x
				redraw
			end
			@textdown = false
		elsif @b1down
			@b1down = false
			keypress(:enter)
		elsif @b2down
			@b2down = false
			keypress(:esc)
		end
	end
	
	def update_caret
		return if @oldcaret_x == @caret_x
		redraw
		@oldcaret_x = @caret_x
	end

	def destroy
		@parent.destroy
	end
end
	def initialize_window(hwnd, prompt, opts={}, &b)
		@@mainwindow_list.delete self
		self.title = opts[:title] ? opts[:title] : 'input'
		self.widget = IBoxWidget.new(hwnd, prompt, opts, &b)
	end
end

class ListWindow < Window
class LBoxWidget < DrawableWidget
	def initialize_widget(hwnd, list, opts={}, &b)
		@list = list.map { |l| l.map { |w| w.to_s } }
		# length of the longest element of the column
		@colwmax = @list.transpose.map { |l| l.map { |w| w.length }.max }
		@titles = @list.shift

		@parent_hwnd = hwnd
		@action = b
		# index of the first row displayed
		@linehead = 0
		# index of the currently selected row
		@linesel = nil
		# ary indicating whether a title label is being clicked
		@btndown = []

		@default_color_association = { :background => :winbg, :label => :black,
			:text => :black, :textbg => :white, :btnc1 => :white, :btnc2 => :grey,
			:textsel => :white, :textselbg => :darkblue }
	end

	def initialize_visible
		@colw = @colwmax.map { |w| [w+1, 40].min * @font_width }
		r1 = Win32Gui.alloc_c_struct('RECT')
		Win32Gui.getwindowrect(@parent_hwnd, r1)
		allw = @colw.inject(0) { |a, i| a+i }
		r2 = Win32Gui.alloc_c_struct('RECT', :left => 0, :top => 0,
			:right => [allw+8, 80*@font_width].min,
			:bottom => [@list.length+3, 30].min * @font_height)
		Win32Gui.adjustwindowrect(r2, Win32Gui::WS_OVERLAPPED, Win32Gui::FALSE)
		x = r1[:left]+(r1[:right]-r1[:left]-r2[:right]+r2[:left])/2
		y = r1[:top]+(r1[:bottom]-r1[:top]-r2[:bottom]+r2[:top])/2
		Win32Gui.movewindow(@hwnd, x, y, r2[:right]-r2[:left], r2[:bottom]-r2[:top], Win32Gui::FALSE)
	end

	def resized(w, h)
		p @colw, @colwmax
		allw = @colw.inject(0) { |a, i| a+i }
		if w > allw
			can = w - allw
			@colw.length.times { |i|
				cur = @colw[i]
				want = (@colwmax[i] + 1) * @font_width
				need = want-cur
				if need > 0
					if can < need
						@colw[i] += can
						can = 0
					else
						@colw[i] = want
						can -= need
					end
				end
			}
			redraw
		end
	end

	def paint
		x = 0
		@btnx = []
		@btny = y = 0
		#fixedfont = Win32Gui.selectobject(@hdc, Win32Gui.getstockobject(Win32Gui::ANSI_VAR_FONT))
		#sz = Win32Gui.alloc_c_struct('POINT')
		#Win32Gui.gettextextentpoint32a(@hdc, 'x', 1, sz)
		#var_font_height = sz[:y]
		@btnheight = @font_height * 4/3
		@titles.zip(@colw, @btndown).each { |t, w, d|
			@btnx << x
			h = @btnheight-1
			c1 = d ? :btnc2 : :btnc1
			c2 = d ? :btnc1 : :btnc2
			draw_line_color(c1, x, y, x, y+h)
			draw_line_color(c1, x, y, x+w-1, y)
			draw_line_color(c2, x+w-1, y+h, x, y+h)
			draw_line_color(c2, x+w-1, y+h, x+w-1, y)

			cw = w/@font_width-1
			xo = [(cw-t.length) * @font_width/2, 0].max	# center titles
			draw_string_color(:label, x+@font_width/2+xo, y+@font_height/6, t[0, cw])
			x += w
		}
		
		y += @btnheight
		tl = (@linesel || -1) - @linehead
		@lineshown = (height-y)/@font_height
		@list[@linehead, @lineshown + 1].to_a.each { |l|
			x = @btnx.first
			ct, cb = :text, :textbg
			ct, cb = :textsel, :textselbg if tl == 0
			tl -= 1
			draw_rectangle_color(cb, x, y, width-2*x, @font_height)
			l.zip(@colw).each { |t, w|
				draw_string_color(ct, x+@font_width/2, y, t[0, w/@font_width-1])
				x += w
			}
			y += @font_height
		}
	end

	def keypress(key)
		case key
		when :up
			if not @linesel
				@linesel = @linehead
			elsif @linesel > 0
				@linesel -= 1
				@linehead = @linesel if @linesel < @linehead
			end
			redraw
		when :down
			if not @linesel
				@linesel = @linehead
			elsif @linesel < @list.length-1
				@linesel += 1
				@linehead = @linesel - (@lineshown-1) if @linehead < @linesel-(@lineshown-1)
			end
			redraw
		when :home
			@linesel = 0
			@linehead = 0
			redraw
		when :end
			@linesel = @list.length-1
			@linehead = @linesel - (@lineshown-1) if @linehead < @linesel-(@lineshown-1)
			redraw
		when :enter
			if @linesel and @list[@linesel]
				protect { @action.call(@list[@linesel]) }
			end
		when :esc
			if not @btndown.compact.empty?
				@btndown = []
				redraw
			else
				destroy
			end
		else return false
		end
		true
	end

	def xtobtn(x)
		if x < @btnx.first
			return 0
		elsif x >= @btnx.last + @colw.last
			return @btnx.length-1
		else
			@btnx.zip(@colw).each_with_index { |(bx, bw), i|
				return i if x >= bx and x < bx+bw
			}
		end
	end

	def click(x, y)
		Win32Gui.setcapture(@hwnd)
		if y >= @btny and y < @btny+@btnheight
			# TODO column resize
			@btndown[xtobtn(x)] = true
			redraw
		elsif y >= @btny+@btnheight
			cy = @linehead + (y - @btny - @btnheight)/@font_height
			if cy < @list.length
				@linesel = cy
				redraw
				Gui.main_iter
				protect { @action.call(@list[@linesel]) }
			end
		end
	end

	def doubleclick(x, y)
		if y >= @btny+@btnheight
			cy = @linehead + (y - @btny - @btnheight)/@font_height
			if cy < @list.length
				destroy
				Gui.main_iter
				protect { @action.call(@list[@linesel]) }
			end
		end
	end

	def mousemove(x, y)
		if @btndown.compact.first
			@btndown = []
			x = Expression.make_signed(x, 16)
			@btndown[xtobtn(x)] = true
			redraw
		end
	end

	def mouserelease(x, y)
		Win32Gui.releasecapture
		if @btndown.compact.first
			x = Expression.make_signed(x, 16)
			@btndown = []
			col = xtobtn(x)
			cursel = @list[@linesel] if @linesel
			nlist = @list.sort_by { |a| [a[col], a] }
			nlist.reverse! if nlist == @list
			@list = nlist
			@linehead = 0
			if cursel
				@linesel = @list.index(cursel)
				@linehead = @linesel - (@lineshown-1) if @linehead < @linesel-(@lineshown-1)
			end
			redraw
		end
	end
	
	def destroy
		@parent.destroy
	end
end
	def initialize_window(hwnd, title, list, opts={}, &b)
		@@mainwindow_list.delete self
		self.title = title
		self.widget = LBoxWidget.new(hwnd, list, opts, &b)
	end
end

def Gui.main
	@idle_procs ||= []
	msg = Win32Gui.alloc_c_struct('MSG')
	loop do
		if Win32Gui.peekmessagea(msg, 0, 0, 0, Win32Gui::PM_NOREMOVE) != 0 or
				Win32Gui.msgwaitformultipleobjects(0, 0, Win32Gui::FALSE, 500,
					Win32Gui::QS_ALLINPUT) != Win32Gui::WAIT_TIMEOUT
			break if Win32Gui.getmessagea(msg, 0, 0, 0) == 0
			Win32Gui.translatemessage(msg)
			Win32Gui.dispatchmessagea(msg)
		end
		while not @idle_procs.empty? and Win32Gui.peekmessagea(msg, 0, 0, 0, Win32Gui::PM_NOREMOVE) == 0
			@idle_procs.delete_if { |ip| not ip.call }
		end
	end
	msg[:wparam]
end

def Gui.main_quit
	Win32Gui.postquitmessage(0)
end

def Gui.main_iter
	msg = Win32Gui.alloc_c_struct('MSG')
	while Win32Gui.peekmessagea(msg, 0, 0, 0, Win32Gui::PM_REMOVE) != 0
		Win32Gui.translatemessage(msg)
		Win32Gui.dispatchmessagea(msg)
	end
end

# add a lambda to be run whenever the messageloop is idle
# the lambda is removed if it returns nil/false
def Gui.idle_add(&b)
	@idle_procs ||= []
	@idle_procs << b
end

end
end

require 'metasm/gui/dasm_main'
require 'metasm/gui/dasm_hex'
require 'metasm/gui/dasm_listing'
require 'metasm/gui/dasm_opcodes'
require 'metasm/gui/dasm_coverage'
require 'metasm/gui/dasm_graph'
require 'metasm/gui/dasm_decomp'
require 'metasm/gui/debug'

