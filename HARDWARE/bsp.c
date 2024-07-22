/*
*********************************************************************************************************
*
*	ģ������ : BSPģ��(For STM32F4XX)
*	�ļ����� : bsp.c
*	��    �� : V1.1
*	˵    �� : ����Ӳ���ײ�������������ļ���ÿ��c�ļ����� #include "bsp.h" ���������е���������ģ�顣
*			   bsp = Borad surport packet �弶֧�ְ�
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
		����ST�̼���������ļ��Ѿ�ִ����CPUϵͳʱ�ӵĳ�ʼ�������Բ����ٴ��ظ�����ϵͳʱ�ӡ�
		�����ļ�������CPU��ʱ��Ƶ�ʡ��ڲ�Flash�����ٶȺͿ�ѡ���ⲿSRAM FSMC��ʼ����

		ϵͳʱ��ȱʡ����Ϊ168MHz�������Ҫ���ģ������޸� system_stm32f4xx.c �ļ�
	*/

	/* ��Բ�ͬ��Ӧ�ó��������Ҫ�ĵײ�����ģ���ʼ������ */

	bsp_InitLed(); 		/* ��ʼLEDָʾ�ƶ˿� */
}


/*
*********************************************************************************************************
*	�� �� ��: bsp_InitLed
*	����˵��: ����LEDָʾ����ص�GPIO,  �ú����� bsp_Init() ���á�
*	��    ��:  ��
*	�� �� ֵ: ��
*********************************************************************************************************
*/
void bsp_InitLed(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;

	/* ��GPIOʱ�� */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);

	bsp_LedOff(1);
	bsp_LedOff(2);

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;		/* ��Ϊ����� */
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;		/* ��Ϊ����ģʽ */
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;	/* ���������費ʹ�� */
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;	/* IO������ٶ� */

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
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;		/* ��Ϊ����� */	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_15;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB, &GPIO_InitStructure);

	// PF6,7,8,9 for slot number
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;		/* ��Ϊ����� */	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOF, &GPIO_InitStructure);	
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;		// ��Ϊ����� 
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;		// ��Ϊ����ģʽ 
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	// ��������ʹ�� 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;	// IO������ٶ� 

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
  GPIO_SetBits(GPIOC, GPIO_Pin_0);

}

/*
*********************************************************************************************************
*	�� �� ��: bsp_LedOn
*	����˵��: ����ָ����LEDָʾ�ơ�
*	��    ��:  _no : ָʾ����ţ���Χ 1 - 2
*	�� �� ֵ: ��
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
*	�� �� ��: bsp_LedOff
*	����˵��: Ϩ��ָ����LEDָʾ�ơ�
*	��    ��:  _no : ָʾ����ţ���Χ 1 - 2
*	�� �� ֵ: ��
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
*	�� �� ��: bsp_LedToggle
*	����˵��: ��תָ����LEDָʾ�ơ�
*	��    ��:  _no : ָʾ����ţ���Χ 1 - 2
*	�� �� ֵ: ��������
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
*	�� �� ��: bsp_IsLedOn
*	����˵��: �ж�LEDָʾ���Ƿ��Ѿ�������
*	��    ��:  _no : ָʾ����ţ���Χ 1 - 2
*	�� �� ֵ: 1��ʾ�Ѿ�������0��ʾδ����
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
