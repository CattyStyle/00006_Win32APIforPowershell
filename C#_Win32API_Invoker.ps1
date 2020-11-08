$Win32 = &{

# ========= C#言語によるWin32Api関数定義(ここから) =========
$cscode = @"

[DllImport("user32.dll")]
public static extern int MessageBox(
    IntPtr hWnd,        // オーナーウィンドウのハンドル
    string lpText,      // メッセージボックス内のテキスト
    string lpCaption,   // メッセージボックスのタイトル
    UInt32 uType        // メッセージボックスのスタイル
);

[DllImport("user32.dll")]
public static extern IntPtr FindWindow(
    string lpClassName,  // クラス名
    string lpWindowName  // ウィンドウ名
);

[DllImport("user32.dll")]
public static extern bool SetWindowPos(
    IntPtr hWnd,            // ウィンドウのハンドル
    IntPtr hWndInsertAfter, // 配置順序のハンドル
    int    X,               // 横方向の位置
    int    Y,               // 縦方向の位置
    int    cx,              // 幅
    int    cy,              // 高さ
    UInt32 uFlags           // ウィンドウ位置のオプション
);


"@
# ========= C#言語によるWin32Api関数定義(ここまで) =========
    return (add-type -memberDefinition $cscode -name "Win32ApiFunctions" -passthru)
}


# メッセージボックス表示
$Win32::MessageBox(0, "Hello, World!", "Test", 0)
