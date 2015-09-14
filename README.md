# GGBoxingAndUnBoxing
拆箱和装箱


typedef struct {

    int year;
    
    int month;
    
    int day;
    
} Date;


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
    
