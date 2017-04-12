//
//  ViewController.m
//  GCDSynchrolock
//
//  Created by wei1 on 2017/4/12.
//  Copyright © 2017年 qge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) dispatch_queue_t queue;

@end

int i=0;

int count = 0;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.queue = dispatch_queue_create("GCDSynchrolock",DISPATCH_QUEUE_CONCURRENT );
    
 //   self.queue = dispatch_get_global_queue(0, 0);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"---------start--------");
    [self async_brrier];
    [self sync_barrier];
}

-(void)async_brrier{
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self barrierQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self barrierQueue];
    [self asyncQueue];
    [self asyncQueue];
}
-(void)sync_barrier{
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self barrierQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self asyncQueue];
    [self barrierQueue];
    [self asyncQueue];
    [self asyncQueue];
}
-(void)syncQueue{
    count++;
    int c = count;
    dispatch_sync(self.queue, ^{
        NSLog(@"syncQueue i=%d time=%d currentThread=%@",i,c,[NSThread currentThread]);
        
    });
}

-(void)asyncQueue{
    count++;
    int c = count;
    dispatch_async(self.queue, ^{
        NSLog(@"asyncQueue i=%d time=%d currentThread=%@",i,c,[NSThread currentThread]);
    });
}

-(void)barrierQueue{
    count++;
    int c = count;
    dispatch_barrier_async(self.queue, ^{
        i = arc4random()%100;
        NSLog(@"barrierQueue i=%d time=%d currentThread=%@",i,c,[NSThread currentThread]);
    });
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
