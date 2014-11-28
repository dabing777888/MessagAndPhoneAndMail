//
//  ViewController.m
//  MessAndPhoneAndMail
//
//  Created by zero on 14-10-10.
//  Copyright (c) 2014年 lelouch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTelBtn];
    [self loadMessageBtn];
    [self loadMailBtn];
	// Do any additional setup after loading the view, typically from a nib.
}
//创建打电话btn
-(void)loadTelBtn{
    UIButton*telBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    telBtn.frame=CGRectMake(40, 80, 80, 40);
    [telBtn setTitle:@"打电话" forState:UIControlStateNormal];
    [telBtn addTarget:self action:@selector(telDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:telBtn];
}

-(void)telDown{
//    //第一种打电话，挂断后会停留在系统电话里
//    NSString*telUrl=[NSString stringWithFormat:@"tel://%@",@"10086"];
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:telUrl]];
   //第二种，挂断后会返回到我们的应用
    NSURL*phoneUrl=[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"10086"]];
    UIWebView*phoneCallWebView=[[UIWebView alloc]initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneUrl]];
    [self.view addSubview:phoneCallWebView];
}



//创建发短信btn
-(void)loadMessageBtn{
    UIButton*messBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    messBtn.frame=CGRectMake(40, 160, 80, 40);
    [messBtn setTitle:@"发短信" forState:UIControlStateNormal];
    [messBtn addTarget:self action:@selector(messageDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messBtn];
}
//发短信按下：
-(void)messageDown{
//    //第一种，发完后会停留在系统短信界面
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://10086"]];
    //第二种，发完后会回到我们的应用
    MFMessageComposeViewController*mess=[[MFMessageComposeViewController alloc]init];
    if ([MFMessageComposeViewController canSendText]) {
        mess.body=@"hello";//短信内容
        mess.recipients=@[@"10086",@"10010"];//接短信对象，是个数组
        mess.messageComposeDelegate=self;
        [self presentViewController:mess animated:YES completion:nil];
    }
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (result==MessageComposeResultCancelled) {//取消
        NSLog(@"Message cancelled");
    }else if (result==MessageComposeResultSent){//成功
        NSLog(@"Message sent");
    
    }else{//失败
        NSLog(@"Message Failed");
    }
}

//发邮件btn
-(void)loadMailBtn{
    UIButton*mailBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    mailBtn.frame=CGRectMake(40, 240, 80, 40);
    [mailBtn setTitle:@"发邮件" forState:UIControlStateNormal];
    [mailBtn addTarget:self action:@selector(mailDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mailBtn];
}

//发邮件按下
-(void)mailDown{
    //第一种，发完后会留在系统邮件界面
//NSString*recipients=@"mailto:first@example.com";//设置接受者
//    NSString*body=@"&body=email body";//邮件内容
//    NSString*mail=[NSString stringWithFormat:@"%@%@",recipients,body];//拼接email字符串
//    mail=[mail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:mail]];
    //第二种，发完后会回到自己的应用
    MFMailComposeViewController*mail=[[MFMailComposeViewController alloc]init];
    mail.mailComposeDelegate=self;
    [mail setSubject:@"email主题"];
    NSArray*recipents=[NSArray arrayWithObjects:@"first@example.com",@"second@example.com", nil];
    [mail setToRecipients:recipents];
    UIImage*addPic=[UIImage imageNamed:@"icon.png"];
    NSData*imageData=UIImagePNGRepresentation(addPic);
    [mail addAttachmentData:imageData mimeType:@"" fileName:@"icon.png"];//添加图片
    NSString*emailBody=@"email 正文";
    [mail setMessageBody:emailBody isHTML:YES];
    [self presentViewController:mail animated:YES completion:nil];
  
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    NSString*mess;
    switch (result) {
        case MFMailComposeResultCancelled:
            mess=@"邮件发送取消";
            break;
            case MFMailComposeResultSaved:
            mess=@"邮件保存成功";
            break;
            case MFMailComposeResultSent:
            mess=@"邮件发送成功";
            break;
            case MFMailComposeResultFailed:
            mess=@"邮件发送失败";
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
