// Ethercat_Master.cpp : �������̨Ӧ�ó������ڵ㡣
//
#include <stdio.h>
#include <string.h>
#include "sys.h"
#include "usart.h"
#include "DM9162.h"
#include "sram.h"
#include "rtc.h"
#include "bsp_timer.h"
#include "sram.h"
#include "ethercattype.h"
#include "nicdrv.h"
#include "ethercatbase.h"
#include "ethercatmain.h"
#include "ethercatdc.h"
#include "ethercatconfig.h"

#include "ethercatcoe.h"
#include "stm32f4xx.h"
#include "DM9000.h"



#define SYNC0TIME 250
/*
DM9161 ������  DM9000������
0    ������ ���� ������ ����   ��������
1    ������ ���� ������ ����		�����������߸���������û��
2    ������ ���� ������ ����   ����������������������û��
3    ������ ���� ������ ����   ������ ���� ����������  �м�ģ�����������
ff   ������ ������ ����
*/

char IOmap[512];
uint32_t vid=0;
uint16 cur_status;
int32 cur_pos = 0;
uint8 cur_mode;
uint8 all_slave_op = 0;
__IO uint32_t pdoTimeFlag = 0;
PDO_Output *outputs1;
PDO_Input *inputs1;

uint8_t socket_mode;
uint8_t DM9000_Status;
uint8_t DM9162_Status;
unsigned char restart_waittime=0;

static void TIM3_Config(uint16_t period,uint16_t prescaler);

int sahdasdj;
uint8  sadkakd[128];
uint16 times_cnt=0;
uint16 time_cnt=1;

RCC_ClocksTypeDef ClockInfo;
/** Read PDO assign structure */
/****************************************************
������
*****************************************************/
uint32_t timeoftest;
int main(void)
{	
		uint32_t i,j;
	  uint16_t slc,cnt;
	  uint8 u8val;
	  uint16 u16val;
	
		bsp_Init(); /*IO�ڳ�ʼ�� */
	  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);/*����ϵͳ�ж����ȼ�����2 */
		SystemCoreClockUpdate(); /*ϵͳʱ�Ӹ��� */
	  uart_init(115200);   	/*���Դ��ڲ���������*/
	  RCC_GetClocksFreq(&ClockInfo);/*��ȡϵͳʱ��ֵ*/
    TIM2_Int_Init(0x7fffffff-1,84-1);	/*us��ʱ����ʱ��ʱ��84M����Ƶϵ��84�� ���ϼ�������ʱ��ʱ��*/ 
	  TIM3_Config(999,899);/*DCͬ��ʱ�Ӷ�ʱ������ʱʱ��ΪSYNC0TIME����λus*/
		printf("\r\nWelcome to the ECAT World \n\r");
	re_check_net:     /*���¼�����ڱ�ʶ	*/		
	  vid = dm9k_ReadID();/*��ȡdm9000 ID=0x0A469000 �������ڴ�ֵ�����ڵĲ�������*/	
		DM9000_Init(); /* DM9000���ڳ�ʼ��	 */
		DM9162_Init(); /* DM9162���ڳ�ʼ��  */

    socket_mode=0;
		do
			{
//˫����������ģʽ
			if((ETH_ReadPHYRegister(DM9162_PHY_ADDRESS, PHY_BSR) & 0x0004)&&(dm9k_ReadReg(DM9000_REG_NSR) & DM9000_PHY))
				{
				 socket_mode=2;
				}
//��������ģʽ
			else if((ETH_ReadPHYRegister(DM9162_PHY_ADDRESS, PHY_BSR) & 0x0004)&&(!(dm9k_ReadReg(DM9000_REG_NSR) & DM9000_PHY)))
			 {
				 socket_mode=1;
			 }
//������� δ��⵽���� �������˸
			else
			 {
				 socket_mode=0;
			 }				
				printf("Please plug in the Ethernet cable first \n\r");
				Delay_ms(100);
			  bsp_LedToggle(2);    /* �������		*/
			}while(socket_mode==0); /* ��⵽������������ */
			
		 if(restart_waittime==1)
		  {
				restart_waittime=0;
        goto re_check_net;
		  }	
		
			bsp_LedOff(2);  /* ���LED����� */
			
		  MAC_Init(); /*  DM9162����������ʼ�� */
		  ec_init();  /*  ���õ�������or˫���������� */
			
      printf("\r\nSocket Mode: %d\n\r", socket_mode);	
			Delay_ms(1000);
      bsp_LedOn(1);   /*  Run �Ƶ���	 */
			
	  if(ec_config_init(FALSE)>0)		/*  ���Ҵ�վ����ʼ����վ��	 */
	    {
	      printf("%d slaves found and configured.\r\n",ec_slavecount);         
				if((ec_slavecount >= 1))
				{
					for(slc = 1; slc <= ec_slavecount; slc++)
						{
							printf("Found %s at position %d\n", ec_slave[slc].name, slc);
						}
				}			 
	       ec_config_map(&IOmap);	/* �����վPDO,��IOmap�������� */					
			   ec_configdc();
			   ec_dcsync0(1, TRUE, SYNC0TIME, 250000); // SYNC0 on slave 1
				 printf("Slaves mapped, state to SAFE_OP.\n");
	        /* �ȴ����д�վ״̬�л��� SAFE_OP */
         ec_statecheck(0, EC_STATE_SAFE_OP,  EC_TIMEOUTSTATE);

				 printf("Slave 0 State=0x%04x\r\n",ec_slave[0].state);
			   printf("Slave 1 State=0x%04x\r\n",ec_slave[1].state);
				 do
				   {
							ec_statecheck(0, EC_STATE_SAFE_OP, 50000);
			   		 ec_statecheck(1, EC_STATE_SAFE_OP, 50000);
				    }
				    while ((ec_slave[0].state != EC_STATE_SAFE_OP) || (ec_slave[1].state != EC_STATE_SAFE_OP));
						printf("Slave 0 State=0x%04x\r\n",ec_slave[0].state);
						printf("Slave 1 State=0x%04x\r\n",ec_slave[1].state);
					/* ��ӡ�������Ϣ */
          for( cnt = 1 ; cnt <= ec_slavecount ; cnt++)
            {
               printf("\nSlave:%d\n Name:%s\n Output size: %dbits\n Input size: %dbits\n State: %d\n Delay: %d[ns]\n Has DC: %d\n",
                       cnt, ec_slave[cnt].name, ec_slave[cnt].Obits, ec_slave[cnt].Ibits,
                       ec_slave[cnt].state, ec_slave[cnt].pdelay, ec_slave[cnt].hasdc);
               printf(" Configured address: %x\n", ec_slave[cnt].configadr);
               printf(" Outputs address: %x\n", ec_slave[cnt].outputs);
               printf(" Inputs address: %x\n", ec_slave[cnt].inputs);

               for(j = 0 ; j < ec_slave[cnt].FMMUunused ; j++)
               {
                  printf(" FMMU%1d Ls:%x Ll:%4d Lsb:%d Leb:%d Ps:%x Psb:%d Ty:%x Act:%x\n", j,
                          (int)ec_slave[cnt].FMMU[j].LogStart, ec_slave[cnt].FMMU[j].LogLength, ec_slave[cnt].FMMU[j].LogStartbit,
                          ec_slave[cnt].FMMU[j].LogEndbit, ec_slave[cnt].FMMU[j].PhysStart, ec_slave[cnt].FMMU[j].PhysStartBit,
                          ec_slave[cnt].FMMU[j].FMMUtype, ec_slave[cnt].FMMU[j].FMMUactive);
               }
               printf(" FMMUfunc 0:%d 1:%d 2:%d 3:%d\n",
                        ec_slave[cnt].FMMU0func, ec_slave[cnt].FMMU2func, ec_slave[cnt].FMMU2func, ec_slave[cnt].FMMU3func);

            }
						printf("Request operational state for all slaves\n");
            ec_slave[0].state = EC_STATE_OPERATIONAL;
            /* send one valid process data to make outputs in slaves happy*/
            ec_send_processdata();
            ec_receive_processdata(EC_TIMEOUTRET);
            /* �������д�վ���е�OP ״̬ */
            ec_writestate(0);

            /* �ȴ����д�վ�л��� OP ״̬ */
            ec_statecheck(0, EC_STATE_OPERATIONAL,  EC_TIMEOUTSTATE);								
					  do
				    {
				   		ec_send_processdata();
				   		ec_receive_processdata(EC_TIMEOUTRET);
							ec_statecheck(0, EC_STATE_OPERATIONAL, 50000);
				   		ec_statecheck(1, EC_STATE_OPERATIONAL, 50000);
				    }
				    while ((ec_slave[0].state != EC_STATE_OPERATIONAL)|| (ec_slave[1].state != EC_STATE_OPERATIONAL));
						printf("Slave 0 State=0x%04x\r\n",ec_slave[0].state);
						printf("Slave 1 State=0x%04x\r\n",ec_slave[1].state);
						
						/* ������д�վ״̬ΪOP ��Դ�վ�� �������������ӳ��*/
            if (ec_slave[0].state == EC_STATE_OPERATIONAL)
            {	
               printf("Operational state reached for all slaves.\n");
							 all_slave_op = 1;												
							 outputs1 = (PDO_Output *)ec_slave[1].outputs;
               inputs1  = (PDO_Input *)ec_slave[1].inputs;
            }
            else /* ��֮ ��ӡ��վ״̬*/
            {
               printf("Not all slaves reached operational state.\n");
               ec_readstate();
               for(i = 1; i<=ec_slavecount ; i++)
               {
                  if(ec_slave[i].state != EC_STATE_OPERATIONAL)
                  {
                     printf("Slave %d State=0x%04x StatusCode=0x%04x\n",
                             i, ec_slave[i].state, ec_slave[i].ALstatuscode);
                  }
               }
            }
	     }
		 else
			{
				printf("No slaves found!\r\n");
			}			
	while(1)
	{
		//PDO��ͨѶ��TIM3�жϺ�����
   if(pdoTimeFlag == 1)	/* PDOͨѶ��ʱ��־λ */
	  {
			DM9162_Status=ETH_ReadPHYRegister(DM9162_PHY_ADDRESS, PHY_BSR) & 0x0004;/* ������link״̬��־ */
			DM9000_Status=(dm9k_ReadReg(DM9000_REG_NSR) & DM9000_PHY);/* �����link״̬��־ */
			if(( !DM9162_Status) && (!DM9000_Status))/* �����ں�����ڶ�����ʱ��ת��re_check_net �ȴ������������� */
			{
			 printf("Ethernets are all error,NOW must reset! goto  lable re_check_net\n");
			 restart_waittime=1;
			 goto	re_check_net;
			}				 
			pdoTimeFlag=0;
//		  ecat_loop();
	  }
	}
}
/**
  * @brief  ͨ�ö�ʱ��3�жϳ�ʼ��
  * @param  period : �Զ���װֵ��
  * @param  prescaler : ʱ��Ԥ��Ƶ��            
  * @retval ��                             
  * @note   ��ʱ�����ʱ����㷽��:Tout=((period+1)*(prescaler+1))/Ft us.
  *          Ft=��ʱ������Ƶ��,ΪSystemCoreClock/2=90,��λ:Mhz
  */
static void TIM3_Config(uint16_t period,uint16_t prescaler)
{
	TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3,ENABLE);  ///ʹ��TIM3ʱ��
	
	TIM_TimeBaseInitStructure.TIM_Prescaler=84 - 1;//��ʱ����Ƶ
	TIM_TimeBaseInitStructure.TIM_CounterMode=TIM_CounterMode_Up; //���ϼ���ģʽ
	TIM_TimeBaseInitStructure.TIM_Period=SYNC0TIME - 1 ;//�Զ���װ��ֵ
	TIM_TimeBaseInitStructure.TIM_ClockDivision=TIM_CKD_DIV1; 
	TIM_TimeBaseInitStructure.TIM_RepetitionCounter = 0;
	
	TIM_TimeBaseInit(TIM3,&TIM_TimeBaseInitStructure);
	
	//NVIC_InitTypeDef NVIC_InitStructure;
 	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);
	
	NVIC_InitStructure.NVIC_IRQChannel=TIM3_IRQn; //��ʱ��3�ж�
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority=0x0; //��ռ���ȼ�1
	NVIC_InitStructure.NVIC_IRQChannelSubPriority=0x03; //�����ȼ�3
	NVIC_InitStructure.NVIC_IRQChannelCmd=ENABLE;
	
	NVIC_Init(&NVIC_InitStructure);
	
	TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
	TIM_ITConfig(TIM3,TIM_IT_Update,ENABLE); //������ʱ��3�����ж�
	TIM_Cmd(TIM3,ENABLE); //ʹ�ܶ�ʱ��3
	
	
}

/**
  * @brief  ��ʱ��3�жϷ�����
  * @param  ��
  * @retval ��
  */
void TIM3_IRQHandler(void)
{
	
	
	if(TIM_GetITStatus(TIM3,TIM_IT_Update)==SET) //����ж�
	{
//			pdoTimeFlag = 1;
		if(all_slave_op==1)  /* ���д�վ�Ѿ�����OP״̬ ���Խ���PDO�Ĳ��� */
		{
			pdoTimeFlag = 1;   /* PDOͨѶ��ʱ��־λ */
			//�������߼�
			times_cnt++;
			if(times_cnt>100)
			{
			times_cnt=0;
			if(time_cnt<128)
				 time_cnt=time_cnt*2;
			else 
				 time_cnt=1;
			 }

		   ecat_loop(); /* �����Ʋ������߼���ֵ��RxPDO */
		 } 
		else
		{
		  ec_send_processdata();	
		}

	}
	TIM_ClearITPendingBit(TIM3,TIM_IT_Update);  //����жϱ�־λ
}