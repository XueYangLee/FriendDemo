//
//  PchMacro.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/20.
//  Copyright © 2017年 singularity. All rights reserved.
//




#ifndef PchMacro_h
#define PchMacro_h


#pragma mark -------------- 常用尺寸宏
/** 屏幕尺寸 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/** 获取当前屏幕的高度 applicationFrame就是app显示的区域，不包含状态栏 */
#define APP_SCREEN_WIDTH  ([UIScreen mainScreen].applicationFrame.size.width)
#define APP_SCREEN_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

/** Window使用  以APPWINDOW为主*/
#define  APP_WINDOW  [[UIApplication sharedApplication] delegate].window
#define  KEY_WINDOW  [UIApplication sharedApplication].keyWindow

/** 判断是否是iPhone X */
#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
/** 导航栏高度 */
#define NAVI_HEIGHT 44
/** 状态栏高度 */
#define STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
/** 导航栏+状态栏总高 */
#define STATUS_NAVI_HEIGHT  (NAVI_HEIGHT+STATUS_HEIGHT)
/** 页面除过导航栏高度 */
#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-(STATUS_HEIGHT+44))
//#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame))
/** iPhone X等异形屏下HOME按键高度 */
#define IPHONEX_BOTTOM ([[UIApplication sharedApplication] statusBarFrame].size.height > 20?34:0)
/** iphoneX等异形屏下tabbar高度 */
#define TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height > 20?83:49)
/** 系统tabbar高度 */
#define SYSTEM_TABBAR_HEIGHT self.tabBarController.tabBar.bounds.size.height



#pragma mark -------------- 字符串类型转换
/** 输出类型转换 */
#define FORMATEString(Method)    ([[NSString stringWithFormat:@"%@",Method] isKindOfClass:[NSNull class]] || [[NSString stringWithFormat:@"%@",Method] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@",Method] isEqualToString:@"(null)"]) ? @"" : [NSString stringWithFormat:@"%@",Method]
#define FORMATEPRICE(Method)   [NSString stringWithFormat:@"%.2f",Method]
#define FORMATEInt(Method)   [NSString stringWithFormat:@"%ld",Method]
#define FORMATEFloat(Method)   [NSString stringWithFormat:@"%.2f",Method]

/** 判断空对象 */
#define isNull(x)             (!x || [x isKindOfClass:[NSNull class]])
#define isEmptyString(x)      (isNull(x) || [x isEqual:@""] || [x isEqual:@"(null)"] || [x isEqual:@"<null>"])


#pragma mark -------------- 字体相关
/** 自定义颜色 */
#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UIColorWithHex(a)               [UIColor colorWithHexString:a]


/** 字体设置 */
#define FontRegular(font) [UIFont fontWithName:@"PingFangSC-Regular" size:font]//常规字体
#define FontSemibold(font) [UIFont fontWithName:@"PingFangSC-Semibold" size:font]//中粗体
#define FontMedium(font) [UIFont fontWithName:@"PingFangSC-Medium" size:font]//中黑体
#define FontLight(font) [UIFont fontWithName:@"PingFangSC-Light" size:font]//细体


/** 随机色 */
#define RandomColor UIColorWithRGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)

/** 字体常用颜色 */
#define FONT_COLOR333  [UIColor colorWithHexString:@"333333"]
#define FONT_COLOR666  [UIColor colorWithHexString:@"666666"]
#define FONT_COLOR999  [UIColor colorWithHexString:@"999999"]
#define FONT_COLORDDD  [UIColor colorWithHexString:@"dddddd"]

#define FONT_COLOR272829   [UIColor colorWithHexString:@"272829"]
#define FONT_COLOR575757   [UIColor colorWithHexString:@"575757"]
#define FONT_COLORababab   [UIColor colorWithHexString:@"ababab"]
#define FONT_COLORf2441c   [UIColor colorWithHexString:@"F2441C"]

#define FONT_COLOR_BGF7    [UIColor colorWithHexString:@"F7F7F7"]

/** 字体大小（常规/粗体） */
#define BOLDFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define FONT(FONTSIZE)     [UIFont systemFontOfSize:FONTSIZE]



#pragma mark -------------- view尺寸宏
/** View 坐标(x,y)和宽高(width,height) */
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

/** 以屏幕为比例的数值   比例基准由UI使用的机型宽度为准 */
#define screen_ratio      [[UIScreen mainScreen] bounds].size.width/375.0
#define radio(NUM)  NUM*screen_ratio


#pragma mark -------------- 图片路径、加载
/** PNG JPG 图片路径 */
#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
/** 路径 */
#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/** PNG JPG 加载图片 */
#define PNGkImg(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGkImg(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define kImg(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]



#pragma mark -------------- 获取设备
//是否Retina屏
#define IS_RETINA ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) :NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONEPLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)



#pragma mark -------------- 版本信息
/** 获取Xcode的版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** iOS系统版本  NSString类型*/
#define IOS_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
/** 当前系统语言 */
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
/** app名字 */
#define APP_NAME [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"]
/** 设备类型  返回 iPhone或当前其他设备 */
#define DEVICE_TYPE [UIDevice currentDevice].model
/** 电池电量  float */
#define ELECTRIC_POWER  [[UIDevicecurrentDevice]batteryLevel]


#pragma mark -------------- 功能宏
/** NSUSerDefault */
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
/** NSNotificationCenter */
#define NOTIFY_CENTER [NSNotificationCenter defaultCenter]
/** weak self */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/** class与string的转变 */
#define stringFromClass(CLASS_NAME) NSStringFromClass([CLASS_NAME class])
#define classFromString(STRING_NAME) NSClassFromString(STRING_NAME)

/** View 圆角及边框 */
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/** 防止按钮重复点击  kPreventRepeatClickTime(0.5); */
#define kPreventRepeatClickTime(_seconds_) \
static BOOL shouldPrevent; \
if (shouldPrevent) return; \
shouldPrevent = YES; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_seconds_) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
shouldPrevent = NO; \
}); \


/** DLog打印 */
//#ifdef DEBUG
//#   define DLog(fmt, ...) NSLog((@"(函数 %s) [行数 %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//#   define DLog(...)
//#endif

#ifdef DEBUG //打印Jason unicode转中文
#define DLog( s, ... ) printf("class: <%p %s:(第%d行) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] );
#else
#define DLog( s, ... )
#endif


//判断设备室真机还是模拟器
#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif



#endif /* PchMacro_h */
