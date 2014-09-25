//
//  NewsTableViewCell.m
//  房贷计算机
//
//  Created by apple on 14-8-9.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "Configuration.h"
@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _lable1=[[UILabel alloc]initWithFrame:CGRectMake(5, 2, 150,20)];
        [self.contentView addSubview:_lable1];
        
        _lable2=[[UILabel alloc]initWithFrame:CGRectMake(155, 2, 100,20)];
        _lable2.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_lable2];
        
        _lable3=[[UILabel alloc]initWithFrame:CGRectMake(5, 22, 240,40)];
        _lable3.numberOfLines=2;
        _lable3.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_lable3];

        _imageView1=[[UIImageView alloc]init];
        _imageView1.frame=CGRectMake(250, 3, 65, 62);
        [self.contentView addSubview:_imageView1];
        self.textLabel.backgroundColor=[UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    
}

@end
