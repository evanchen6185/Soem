/*
*********************************************************************************************************
*
*	模块名称 : 定时器模块
*	文件名称 : bsp_timer.c
*	版    本 : V1.0
*	说    明 : 配置systick定时器作为系统滴答定时器。缺省定时周期为100us。
*
*
*
*********************************************************************************************************
*/

#include "bsp_timer.h"
extern __IO uint32_t g_iRunTime;
/*
*********************************************************************************************************
*	函 数 名: bsp_InitTimer
*	功能说明: 配置systick中断，并初始化软件定时器变量
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void bsp_InitTimer(void)
{
	/*
		配置systic中断周期为1ms，并启动systick中断。

    	SystemCoreClock 是固件中定义的系统内核时钟，对于STM32F4XX,一般为 168MHz

    	SysTick_Config() 函数的形参表示内核时钟多少个周期后触发一次Systick定时中断.
	    	-- SystemCoreClock / 1000  表示定时频率为 1000Hz， 也就是定时周期为  1ms
	    	-- SystemCoreClock / 500   表示定时频率为 500Hz，  也就是定时周期为  2ms
	    	-- SystemCoreClock / 2000  表示定时频率为 2000Hz， 也就是定时周期为  500us

    	对于常规的应用，我们一般取定时周期1ms。对于低速CPU或者低功耗应用，可以设置定时周期为 10ms
    */
	SysTick_Config(SystemCoreClock /1000000);
}
uint32_t bsp_GetTickCount(void)
{
	g_iRunTime=TIM_GetCounter(TIM2);
   return g_iRunTime;
}


void TIM2_Int_Init(u32 arr,u16 psc)
{
	TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);  ///使能TIM2时钟
	
  TIM_TimeBaseInitStructure.TIM_Period = arr; 	//自动重装载值
	TIM_TimeBaseInitStructure.TIM_Prescaler=psc;  //定时器分频
	TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //向上计数模式
	TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1; 
	
	TIM_TimeBaseInit(TIM2,&TIM_TimeBaseInitStructure);//初始化TIM2
	TIM_Cmd(TIM2,ENABLE); //使能定时器2
}
/******************************************************************************
***************************************************************************************
** 函数名称: Delay_us 
** 功能描述: 主频在168MHz时的，粗略延时函数
** 参    数: 延时微秒
** 返 回 值: None       
****************************************************************************************/
void Delay_us(uint32_t time)
{    
   uint32_t i=0; 
   while(time--)
   {
      i=45;   
      while(i--);    
   }
}
 /***************************************************************************************
** 函数名称: Delay_ms
** 功能描述: 主频在168MHz时的，粗略延时函数，经示波器检测，相对较准确。
** 参    数: time
** 返 回 值: None       
****************************************************************************************/
void Delay_ms(uint32_t time)
{
   uint32_t i=0;
   while(time--)
   {
      i=48353; 
      while(i--);    
   }
}
void delay(__IO uint32_t nCount)
{
    for (; nCount != 0; nCount--);
}