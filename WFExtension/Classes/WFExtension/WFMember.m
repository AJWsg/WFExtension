//
//  WFMember.m
//  WFExtension
//
//  Created by 开发者 on 15/3/24.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "WFMember.h"

@implementation WFMember

- (instancetype)initWithIvar:(Ivar)var{
    if(self = [super init])
    {
        // 获取属性全名称
        _fullName = [NSString stringWithUTF8String:ivar_getName(var)];
        // 获取属性名称
        _name = [_fullName hasPrefix:@"_"] ? [_fullName substringFromIndex:1] : _fullName;
        // 当前格式为：@"类型名称"
        _type = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
        // 更改格式，去除 @ 及 " 符号;
        _type = [_type substringWithRange:NSMakeRange(2, _type.length - 3)];
        // 记录原始的var
        _srcIvar = var;
    }
    return self;
}

+ (instancetype)memberWithIvar:(Ivar)var{
    return [[self alloc] initWithIvar:var];
}
@end
