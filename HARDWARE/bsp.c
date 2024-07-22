/*
*********************************************************************************************************
*
*	模块名称 : BSP模块(For STM32F4XX)
*	文件名称 : bsp.c
*	版    本 : V1.1
*	说    明 : 这是硬件底层驱动程序的主文件。每个c文件可以 #include "bsp.h" 来包含所有的外设驱动模块。
*			   bsp = Borad surport packet 板级支持包
*
*********************************************************************************************************
*/

#include "bsp.h"
#define GPIO_PORT_LED1  GPIOG
#define GPIO_PIN_LED1	GPIO_Pin_6

#define GPIO_PORT_LED2  GPIOG
#define GPIO_PIN_LED2	GPIO_Pin_7


uint8_t ST_A1(void) {if ((GPIOE->IDR & GPIO_Pin_5) == GPIO_Pin_5) return 1; else return 0;}
uint8_t ST_A2(void) {if ((GPIOE->IDR & GPIO_Pin_6) == GPIO_Pin_6) return 1; else return 0;}

uint8_t Get_Syn_cmd(void) {if ((GPIOA->IDR & GPIO_Pin_11) == GPIO_Pin_11) return 1; else return 0;}

void Set_Syn_answer(uint8_t an)
{
	if (an == 0)
	{
		GPIOA->BSRRH = GPIO_Pin_8; 
	}
	else 
	{
		GPIOA->BSRRL = GPIO_Pin_8; 
	}	
}
void bsp_Init(void)
{
	/*
		由于ST固件库的启动文件已经执行了CPU系统时钟的初始化，所以不必再次重复配置系统时钟。
		启动文件配置了CPU主时钟频率、内部Flash访问速度和可选的外部SRAM FSMC初始化。

		系统时钟缺省配置为168MHz，如果需要更改，可以修改 system_stm32f4xx.c 文件
	*/

	/* 针对不同的应用程序，添加需要的底层驱动模块初始化函数 */

	bsp_InitLed(); 		/* 初始LED指示灯端口 */
}


/*
*********************************************************************************************************
*	函 数 名: bsp_InitLed
*	功能说明: 配置LED指示灯相关的GPIO,  该函数被 bsp_Init() 调用。
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void bsp_InitLed(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;

	/* 打开GPIO时钟 */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);

	bsp_LedOff(1);
	bsp_LedOff(2);

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;		/* 设为输出口 */
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;		/* 设为推挽模式 */
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;	/* 上下拉电阻不使能 */
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;	/* IO口最大速度 */

	GPIO_InitStructure.GPIO_Pin = GPIO_PIN_LED1;
	GPIO_Init(GPIO_PORT_LED1, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_PIN_LED2;
	GPIO_Init(GPIO_PORT_LED2, &GPIO_InitStructure);
	
  // PG8 for reset internal logic of FPGA
	GPIO_SetBits(GPIOG, GPIO_Pin_8);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
	GPIO_Init(GPIOG, &GPIO_InitStructure);
	
	// PE6 for FPGA PROGRAM
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
	GPIO_SetBits(GPIOE, GPIO_Pin_6);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
	GPIO_Init(GPIOE, &GPIO_InitStructure);	
	
	// PE2,3 use for input as RESET_SYS0/1, PE4,5 use for input as ST-A1/A2
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;	
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;	

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5;
	GPIO_Init(GPIOE, &GPIO_InitStructure);

	// PB15,PB11 for FPGA INIT, DONE
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;		/* 设为输入口 */	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_15;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB, &GPIO_InitStructure);

	// PF6,7,8,9 for slot number
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;		/* 设为输入口 */	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOF, &GPIO_InitStructure);	
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;		// 设为输出口 
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;		// 设为推挽模式 
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	// 上拉电阻使能 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;	// IO口最大速度 

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
  GPIO_SetBits(GPIOC, GPIO_Pin_0);

}

/*
*********************************************************************************************************
*	函 数 名: bsp_LedOn
*	功能说明: 点亮指定的LED指示灯。
*	形    参:  _no : 指示灯序号，范围 1 - 2
*	返 回 值: 无
*********************************************************************************************************
*/
void bsp_LedOff(uint8_t _no)
{
	_no--;

	if (_no == 0)
	{
		GPIO_PORT_LED1->BSRRH = GPIO_PIN_LED1;
	}
	else if (_no == 1)
	{
		GPIO_PORT_LED2->BSRRH = GPIO_PIN_LED2;
	}
}

/*
*********************************************************************************************************
*	函 数 名: bsp_LedOff
*	功能说明: 熄灭指定的LED指示灯。
*	形    参:  _no : 指示灯序号，范围 1 - 2
*	返 回 值: 无
*********************************************************************************************************
*/
void bsp_LedOn(uint8_t _no)
{
	_no--;

	if (_no == 0)
	{
		GPIO_PORT_LED1->BSRRL = GPIO_PIN_LED1;
	}
	else if (_no == 1)
	{
		GPIO_PORT_LED2->BSRRL = GPIO_PIN_LED2;
	}
}

/*
*********************************************************************************************************
*	函 数 名: bsp_LedToggle
*	功能说明: 翻转指定的LED指示灯。
*	形    参:  _no : 指示灯序号，范围 1 - 2
*	返 回 值: 按键代码
*********************************************************************************************************
*/
void bsp_LedToggle(uint8_t _no)
{
	if (_no == 1)
	{
		GPIO_PORT_LED1->ODR ^= GPIO_PIN_LED1;
	}
	else if (_no == 2)
	{
		GPIO_PORT_LED2->ODR ^= GPIO_PIN_LED2;
	}
}

/*
*********************************************************************************************************
*	函 数 名: bsp_IsLedOn
*	功能说明: 判断LED指示灯是否已经点亮。
*	形    参:  _no : 指示灯序号，范围 1 - 2
*	返 回 值: 1表示已经点亮，0表示未点亮
*********************************************************************************************************
*/
uint8_t bsp_IsLedOn(uint8_t _no)
{
	if (_no == 1)
	{
		if ((GPIO_PORT_LED1->ODR & GPIO_PIN_LED1) == 1)
		{
			return 1;
		}
		return 0;
	}
	else if (_no == 2)
	{
		if ((GPIO_PORT_LED2->ODR & GPIO_PIN_LED2) == 1)
		{
			return 1;
		}
		return 0;
	}

	return 0;
}

void bsp_HWDT_service(void)
{
  GPIOC->ODR ^= GPIO_Pin_0;
}
