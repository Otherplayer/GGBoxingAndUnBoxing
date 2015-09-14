//
//  ViewController.m
//  GGBoxingAndUnBoxing
//
//  Created by __无邪_ on 15/9/14.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"


typedef struct {
    int year;
    int month;
    int day;
} Date;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //包装类NSNumber，可以包装基本类型但是无法包装结构体类型
    NSNumber *number1=[NSNumber numberWithChar:'a'];//'a'是一个C语言的char类型我们无法放倒NSArray中，但是我们可以通过NSNumber包装
    NSArray *array1=[NSArray arrayWithObject:number1];
    NSLog(@"%@",array1);
    /*结果：
     (
     97
     )
     */
    
    NSNumber *number2= [array1 lastObject];
    NSLog(@"%@",number2);//返回的不是基本类型,结果：97
    
    
    char char1=[number2 charValue];//number转化为char
    NSLog(@"%c",char1); //结果：a
    
    
    
    
    
//    CGPoint point1=CGPointMake(10, 20);
//    NSValue *value1=[NSValue valueWithPoint:point1];//对于系统自带类型一般都有直接的方法进行包装
//    NSArray *array1=[NSArray arrayWithObject:value1];//放倒数组中
//    NSLog(@"%@",array1);
//    /*结果：
//     (
//     "NSPoint: {10, 20}"
//     )
//     */
//    
//    NSValue *value2=[array1 lastObject];
//    CGPoint point2=[value2 pointValue];//同样对于系统自带的结构体有对应的取值方法（例如本例pointValue）
//    NSLog(@"x=%f,y=%f",point2.x,point2.y);//结果：x=10.000000,y=20.000000


    
    
    //如果我们自己定义的结构体包装
    Date date={2014,2,28};
    char *type=@encode(Date);
    NSValue *value3=[NSValue value:&date withObjCType:type];//第一参数传递结构体地址，第二个参数传递类型字符串
    NSArray *array2=[NSArray arrayWithObject:value3];
    NSLog(@"%@",array2);
    /*结果：
     (
     "<de070000 02000000 1c000000>"
     )
     */
    
    Date date2;
    [value3 getValue:&date2];//取出对应的结构体，注意没有返回值
    //[value3 objCType]//取出包装内容的类型
    NSLog(@"%i,%i,%i",date2.year,date2.month,date2.day); //结果：2014,2,28
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
