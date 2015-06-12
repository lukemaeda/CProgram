//
//  ViewController.m
//  CProgram
//
//  Created by kunren10 on 2014/03/19.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

// マクロ定義
#define M01 123
#define M02 876
#define M03 "デカルチャー"
#define VIEW_BLUE(vw) vw.backgroundColor = [UIColor blueColor]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"%s",__func__);
}

// [変数]ボタンを押した時
- (IBAction)proc01:(id)sender {
    
    // 自動変数
    auto int i01 = 0;
//  int i01 = 0;
    i01++;
    printf("自動変数：%d\n",i01);
    
    // 静的変数（static:数値が破棄されずに残る 加算される）
    static int i02 = 0;
    i02++;
    printf("静的変数：%d\n", i02);
}

// [定数]ボタンを押した時
- (IBAction)proc02:(id)sender {
    
    // 定数（プリミティブ型）大文字 決めごと
    const int VAL01 = 0; // 定数は数値を変えれない
//  VAL01 = 10; // エラーになります。
    printf("%d\n", VAL01);
    
    // 定数（クラス型）大文字
    NSString *const VAL02 = @"abc";
//  const NSString *VAL02 = @"abc";
//  VAL02 = @"xyz"; // エラーになります。
    NSLog(@"%@\n", VAL02);
}

// [型定義]ボタンを押した時
- (IBAction)proc03:(id)sender {
    
    typedef int FunyaFunya; // 自分の型を作れる
    
    FunyaFunya v01 = 10;
    printf("%d", v01);
    
}

// [列挙体]ボタンを押した時
- (IBAction)proc04:(id)sender {
    // 列挙体：列挙定数
    
    // パターン１ ナンバーリング
    enum {
        V01,
        V02,
        V03 = 10,
        V04,
        V05
    };
    
    printf("%d, %d, %d %d, %d\n", V01, V02, V03, V04, V05); // int型 0,1,2,3,4,5
    
    // パターン２
    enum tag02 {
        V10,
        v11,
        v12
    };
    typedef enum tag02 type02;
    
    type02 val02 = V10;
    printf("%d\n", val02);
    
    // パターン３
    typedef enum {
        V20,
        V21,
        V22
    } type03;
    
    type03 val03 = V20;
    printf("%d\n", val03);
}

// [構造体]ボタンを押した時
- (IBAction)proc05:(id)sender {
    
    // パターン１
    struct tag01 {
        char *name; // 名前
        int age; // 年齢
        double height; // 身長
    };
    typedef struct tag01 type01;
    
    type01 val01 = {"あいおえお", 20, 180.0}; // 名前　年齢　身長
    printf("%s, %d %g\n",val01.name, val01.age, val01.height);
    
    // パターン２
    typedef struct {
        char *name; // 名前
        int age; // 年齢
        double height; // 身長
    } type02;
    
    type02 val02;
    val02 .name = "かきくけこ";
    val02.age = 99;
    val02.height = 200;
    
    printf("%s, %d %g\n",val02.name, val02.age, val02.height);
    
}

// [算術演算子（補足）]ボタンを押した時
- (IBAction)proc06:(id)sender {
    
    int res01 = 10;
    
    res01 += 10;
//  res01 = res01 + 10;
    
    printf("%d\n", res01);
    
}

// [インクリメント / デクリメント]ボタンを押した時
- (IBAction)proc07:(id)sender {
    
    // パターン１（単体使用）
    static int val01 = 0;
    static int val02 = 0;
    
    val01++;
    ++val02;
    
    printf("1. %d, %d\n",val01, val02);
    
    // パターン２（後置）
    static int val03 = 0;
    int res03 = val03++;
    printf("2. %d\n",res03); // 0 1 2
    
    // パターン３（前置）
    static int val04 = 0;
    int res04 = ++val04;
    printf("3. %d\n",res04); // 1 2 3
    
}

// [マクロ]ボタンを押した時
- (IBAction)proc08:(id)sender {

    printf("1. %d\n", M01 + M02);
    printf("2. %s\n", M03);
    
    VIEW_BLUE(self.view);
    
    // pchファイルに定義
    VIEW_RED(self.view);
}

@end

/*
 pchファイルに定義
 インポート
 文字を置き換えている
 全てのところで使う場合に使用
 #define VIEW_RED(vw) vw.backgroundColor = [UIColor redColor]
*/
