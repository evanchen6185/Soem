#include "stm32f4xx.h"  // Adjust the header file as per your STM32 series

// Function prototypes
void uart_init(uint32_t bound);
void USART1_IRQHandler(void);

// FIFO buffer structures (assuming you have these defined somewhere)
extern FIFO_TypeDef *FifoIn1;
extern FIFO_TypeDef *FifoOut1;

int main(void)
{
    // Initialize USART1
    uart_init(9600); // Set the baud rate as needed

    // Main loop
    while (1)
    {
        // Your main application code
    }
}

void uart_init(uint32_t bound)
{
    // GPIO port settings
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;
    
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE); // Enable GPIOA clock
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE); // Enable USART1 clock

    // USART1 corresponding pin remapping
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_USART1); // GPIOA9 remapped to USART1
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_USART1); // GPIOA10 remapped to USART1
    
    // USART1 port configuration
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10; // GPIOA9 and GPIOA10
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF; // Alternate function
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; // Speed 50MHz
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP; // Push-pull
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP; // Pull-up
    GPIO_Init(GPIOA, &GPIO_InitStructure); // Initialize PA9, PA10

    // USART1 initialization settings
    USART_InitStructure.USART_BaudRate = bound; // Baud rate setting
    USART_InitStructure.USART_WordLength = USART_WordLength_8b; // 8-bit data format
    USART_InitStructure.USART_StopBits = USART_StopBits_1; // One stop bit
    USART_InitStructure.USART_Parity = USART_Parity_No; // No parity
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; // No hardware flow control
    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx; // Receive and transmit mode
    USART_Init(USART1, &USART_InitStructure); // Initialize USART1
    
    USART_Cmd(USART1, ENABLE); // Enable USART1 

#if EN_USART1_RX
    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE); // Enable RXNE interrupt

    // USART1 NVIC configuration
    NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn; // USART1 interrupt channel
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3; // Preemption priority 3
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3; // Subpriority 3
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; // Enable IRQ channel
    NVIC_Init(&NVIC_InitStructure); // Initialize NVIC with specified parameters
#endif
}

void USART1_IRQHandler(void)
{
    uint32_t isr = USART1->SR;
    
    if (isr & USART_SR_RXNE) // Received character?
    {
        uint16_t Data = USART1->DR;
        Fifo_Insert(FifoIn1, 1, (void *)&Data);
    }

    if (isr & (USART_SR_ORE | USART_SR_NE | USART_SR_FE)) // Pending Errors
    {
        if (isr & USART_SR_ORE)
            USART1->SR = ~USART_SR_ORE;
        
        if (isr & USART_SR_NE)
            USART1->SR = ~USART_SR_NE;
        
        if (isr & USART_SR_FE)
            USART1->SR = ~USART_SR_FE;
    }

    if (isr & USART_SR_TXE) // Transmit empty
    {
        uint32_t Used = Fifo_Used(FifoOut1);

        if (Used)
        {
            uint16_t Data = 0;

            if (Fifo_Extract(FifoOut1, 1, (void *)&Data))
                USART1->DR = Data;

            if (Used > 1)
                USART1->CR1 |= USART_CR1_TXEIE;
            else
                USART1->CR1 &= ~USART_CR1_TXEIE; // Disable as empty
        }
        else
            USART1->CR1 &= ~USART_CR1_TXEIE; // Disable as empty
    }
}
