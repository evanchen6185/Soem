#line 1 "..\\ETHERCAT\\ethercatbase.c"







































 










 
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 985 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 53 "..\\ETHERCAT\\ethercatbase.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"


  



    typedef unsigned int size_t;    
#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"




extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 193 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 209 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 232 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 247 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 270 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 502 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"



 

#line 54 "..\\ETHERCAT\\ethercatbase.c"
#line 1 "..\\ETHERCAT\\osal.h"


















 









#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 30 "..\\ETHERCAT\\osal.h"

 
typedef uint8_t             boolean;


		
typedef int8_t              int8;
typedef int16_t             int16;
typedef int32_t             int32;
typedef uint8_t             uint8;
typedef uint16_t            uint16;
typedef uint32_t            uint32;
typedef int64_t             int64;
typedef uint64_t            uint64;
typedef float               float32;
typedef double              float64;





#line 55 "..\\ETHERCAT\\ethercatbase.c"
#line 1 "..\\ETHERCAT\\ethercattype.h"







































 











 









 



 


#line 70 "..\\ETHERCAT\\ethercattype.h"
	
 

 

 

 

 
 

 

 

 

 


 

 

 

 

 

 

 

 

 

 


 
typedef uint8 ec_bufT[1518];


typedef struct
{
    
   uint16  da0,da1,da2;
    
   uint16  sa0,sa1,sa2;
    
   uint16  etype;
} ec_etherheadert;

 


 
typedef struct
{
    
   uint16  elength;
    
   uint8   command;
    
   uint8   index;
    
   uint16  ADP;
    
   uint16  ADO;
    
   uint16  dlength;
    
   uint16  irpt;
} ec_comt;

 

 

 

 

 


 
typedef enum
{
    
   EC_ERR_OK         = 0,
    
   EC_ERR_ALREADY_INITIALIZED,
    
   EC_ERR_NOT_INITIALIZED,
    
   EC_ERR_TIMEOUT,
    
   EC_ERR_NO_SLAVES,
    
   EC_ERR_NOK
} ec_err;

 
typedef enum
{
    
   EC_STATE_INIT           = 0x01,
    
   EC_STATE_PRE_OP         = 0x02,
    
   EC_STATE_BOOT            = 0x03,
    
   EC_STATE_SAFE_OP        = 0x04,
    
   EC_STATE_OPERATIONAL    = 0x08,
    
   EC_STATE_ACK            = 0x10,
   EC_STATE_ERROR          = 0x10
} ec_state;

 
typedef enum
{
    
   EC_BUF_EMPTY        = 0x00,
    
   EC_BUF_ALLOC        = 0x01,
    
   EC_BUF_TX           = 0x02,
    
   EC_BUF_RCVD         = 0x03,
    
   EC_BUF_COMPLETE     = 0x04
} ec_bufstate;

 
typedef enum
{
   ECT_BOOLEAN         = 0x0001,
   ECT_INTEGER8        = 0x0002,
   ECT_INTEGER16       = 0x0003,
   ECT_INTEGER32       = 0x0004,
   ECT_UNSIGNED8       = 0x0005,
   ECT_UNSIGNED16      = 0x0006,
   ECT_UNSIGNED32      = 0x0007,
   ECT_REAL32          = 0x0008,
   ECT_VISIBLE_STRING  = 0x0009,
   ECT_OCTET_STRING    = 0x000A,
   ECT_UNICODE_STRING  = 0x000B,
   ECT_TIME_OF_DAY     = 0x000C,
   ECT_TIME_DIFFERENCE = 0x000D,
   ECT_DOMAIN          = 0x000F,
   ECT_INTEGER24       = 0x0010,
   ECT_REAL64          = 0x0011,
   ECT_INTEGER64       = 0x0015,
   ECT_UNSIGNED24      = 0x0016,
   ECT_UNSIGNED64      = 0x001B,
   ECT_BIT1            = 0x0030,
   ECT_BIT2            = 0x0031,
   ECT_BIT3            = 0x0032,
   ECT_BIT4            = 0x0033,
   ECT_BIT5            = 0x0034,
   ECT_BIT6            = 0x0035,
   ECT_BIT7            = 0x0036,
   ECT_BIT8            = 0x0037
} ec_datatype;

 
typedef enum 
{
    
   EC_CMD_NOP          = 0x00,
    
   EC_CMD_APRD,
    
   EC_CMD_APWR,
    
   EC_CMD_APRW,
    
   EC_CMD_FPRD,
    
   EC_CMD_FPWR,
    
   EC_CMD_FPRW,
    
   EC_CMD_BRD,
    
   EC_CMD_BWR,
    
   EC_CMD_BRW,
    
   EC_CMD_LRD,
    
   EC_CMD_LWR,
    
   EC_CMD_LRW,
    
   EC_CMD_ARMW,
    
   EC_CMD_FRMW
    
} ec_cmdtype;

 
typedef enum 
{
    
   EC_ECMD_NOP         = 0x0000,
    
   EC_ECMD_READ        = 0x0100,
    
   EC_ECMD_WRITE       = 0x0201,
    
   EC_ECMD_RELOAD      = 0x0300
} ec_ecmdtype;

 

 

 

 


 

 


enum
{
    
   ECT_SII_STRING      = 10,
    
   ECT_SII_GENERAL     = 30,
    
   ECT_SII_FMMU        = 40,
    
   ECT_SII_SM          = 41,
    
   ECT_SII_PDO         = 50
};

 
enum
{
   ECT_SII_MANUF       = 0x0008,
   ECT_SII_ID          = 0x000a,
   ECT_SII_REV         = 0x000c,
   ECT_SII_BOOTRXMBX   = 0x0014,
   ECT_SII_BOOTTXMBX   = 0x0016,
   ECT_SII_MBXSIZE     = 0x0019,
   ECT_SII_TXMBXADR    = 0x001a,
   ECT_SII_RXMBXADR    = 0x0018,
   ECT_SII_MBXPROTO    = 0x001c
};

 
enum
{
    
   ECT_MBXT_ERR        = 0x00,
    
   ECT_MBXT_AOE,
    
   ECT_MBXT_EOE,
    
   ECT_MBXT_COE,
    
   ECT_MBXT_FOE,
    
   ECT_MBXT_SOE,
    
   ECT_MBXT_VOE        = 0x0f
};

 
enum
{
   ECT_COES_EMERGENCY  = 0x01,
   ECT_COES_SDOREQ,
   ECT_COES_SDORES,
   ECT_COES_TXPDO,
   ECT_COES_RXPDO,
   ECT_COES_TXPDO_RR,
   ECT_COES_RXPDO_RR,
   ECT_COES_SDOINFO
};

 
enum
{
   ECT_SDO_DOWN_INIT    = 0x21,
   ECT_SDO_DOWN_EXP     = 0x23,
   ECT_SDO_DOWN_INIT_CA = 0x31,
   ECT_SDO_UP_REQ       = 0x40,
   ECT_SDO_UP_REQ_CA    = 0x50,
   ECT_SDO_SEG_UP_REQ   = 0x60,
   ECT_SDO_ABORT        = 0x80
};

 
enum
{
   ECT_GET_ODLIST_REQ  = 0x01,
   ECT_GET_ODLIST_RES  = 0x02,
   ECT_GET_OD_REQ      = 0x03,
   ECT_GET_OD_RES      = 0x04,
   ECT_GET_OE_REQ      = 0x05,
   ECT_GET_OE_RES      = 0x06,
   ECT_SDOINFO_ERROR   = 0x07
};

 
enum
{
   ECT_FOE_READ        = 0x01,
   ECT_FOE_WRITE,
   ECT_FOE_DATA,
   ECT_FOE_ACK,
   ECT_FOE_ERROR,
   ECT_FOE_BUSY
};

 
enum
{
   ECT_SOE_READREQ     = 0x01,
   ECT_SOE_READRES,
   ECT_SOE_WRITEREQ,
   ECT_SOE_WRITERES,
   ECT_SOE_NOTIFICATION,
   ECT_SOE_EMERGENCY
};

 
enum 
{
   ECT_REG_TYPE        = 0x0000,
   ECT_REG_PORTDES     = 0x0007,
   ECT_REG_ESCSUP      = 0x0008,
   ECT_REG_STADR       = 0x0010,
   ECT_REG_ALIAS       = 0x0012,
   ECT_REG_DLCTL       = 0x0100,
   ECT_REG_DLPORT      = 0x0101,
   ECT_REG_DLALIAS     = 0x0103,
   ECT_REG_DLSTAT      = 0x0110,
   ECT_REG_ALCTL       = 0x0120,
   ECT_REG_ALSTAT      = 0x0130,
   ECT_REG_ALSTATCODE  = 0x0134,
   ECT_REG_PDICTL      = 0x0140,
   ECT_REG_IRQMASK     = 0x0200,
   ECT_REG_RXERR       = 0x0300,
   ECT_REG_FRXERR      = 0x0308,
   ECT_REG_EPUECNT     = 0x030C,
   ECT_REG_PECNT       = 0x030D,
   ECT_REG_PECODE      = 0x030E,
   ECT_REG_LLCNT       = 0x0310,
   ECT_REG_WDCNT       = 0x0442,
   ECT_REG_EEPCFG      = 0x0500,
   ECT_REG_EEPCTL      = 0x0502,
   ECT_REG_EEPSTAT     = 0x0502,
   ECT_REG_EEPADR      = 0x0504,
   ECT_REG_EEPDAT      = 0x0508,
   ECT_REG_FMMU0       = 0x0600,
   ECT_REG_FMMU1       = ECT_REG_FMMU0 + 0x10,
   ECT_REG_FMMU2       = ECT_REG_FMMU1 + 0x10,
   ECT_REG_FMMU3       = ECT_REG_FMMU2 + 0x10,
   ECT_REG_SM0         = 0x0800,
   ECT_REG_SM1         = ECT_REG_SM0 + 0x08,
   ECT_REG_SM2         = ECT_REG_SM1 + 0x08,
   ECT_REG_SM3         = ECT_REG_SM2 + 0x08,
   ECT_REG_SM0STAT     = ECT_REG_SM0 + 0x05,
   ECT_REG_SM1STAT     = ECT_REG_SM1 + 0x05,
   ECT_REG_SM1ACT      = ECT_REG_SM1 + 0x06,
   ECT_REG_SM1CONTR    = ECT_REG_SM1 + 0x07,
   ECT_REG_DCTIME0     = 0x0900,
   ECT_REG_DCTIME1     = 0x0904,
   ECT_REG_DCTIME2     = 0x0908,
   ECT_REG_DCTIME3     = 0x090C,
   ECT_REG_DCSYSTIME   = 0x0910,
   ECT_REG_DCSOF       = 0x0918,
   ECT_REG_DCSYSOFFSET = 0x0920,
   ECT_REG_DCSYSDELAY  = 0x0928,
   ECT_REG_DCSYSDIFF   = 0x092C,
   ECT_REG_DCSPEEDCNT  = 0x0930,
   ECT_REG_DCTIMEFILT  = 0x0934,
   ECT_REG_DCCUC       = 0x0980,
   ECT_REG_DCSYNCACT   = 0x0981,
   ECT_REG_DCSTART0    = 0x0990,
   ECT_REG_DCCYCLE0    = 0x09A0,
   ECT_REG_DCCYCLE1    = 0x09A4
};

 

 

 

 


 


 
typedef enum
{
   EC_ERR_TYPE_SDO_ERROR        = 0,
   EC_ERR_TYPE_EMERGENCY        = 1,
   EC_ERR_TYPE_PACKET_ERROR     = 3,
   EC_ERR_TYPE_SDOINFO_ERROR    = 4,
   EC_ERR_TYPE_FOE_ERROR        = 5,
   EC_ERR_TYPE_FOE_BUF2SMALL    = 6,
   EC_ERR_TYPE_FOE_PACKETNUMBER = 7,
   EC_ERR_TYPE_SOE_ERROR        = 8,
   EC_ERR_TYPE_MBX_ERROR        = 9
} ec_err_type;

 
#pragma anon_unions
typedef struct
{
    
   boolean     Signal;
    
   uint16      Slave;
    
   uint16      Index;
    
   uint8       SubIdx;
    
   ec_err_type Etype;
   union
   {
       
      int32   AbortCode;
       
      struct
      {
         uint16  ErrorCode;
         uint8   ErrorReg;
         uint8   b1;
         uint16  w1;
         uint16  w2;
      };
   };
} ec_errort;

 
 

 

 

 

 

 











#line 559 "..\\ETHERCAT\\ethercattype.h"







#line 573 "..\\ETHERCAT\\ethercattype.h"




#line 586 "..\\ETHERCAT\\ethercattype.h"















#line 56 "..\\ETHERCAT\\ethercatbase.c"
#line 1 "..\\ETHERCAT\\ethercatbase.h"







































 




 
#line 1 "..\\ETHERCAT\\nicdrv.h"







































 




 












 
typedef struct
{
    
   ec_bufT     (*txbuf)[2];
    
   int         (*txbuflength)[2];
    
   ec_bufT     *tempbuf;
    
   ec_bufT     (*rxbuf)[2];
    
   int         (*rxbufstat)[2];
    
   int         (*rxsa)[2];
} ec_stackT;   

 
typedef struct
{
   ec_stackT   stack;
    
   ec_bufT rxbuf[2];
    
   int rxbufstat[2];
    
   int rxsa[2];
    
   ec_bufT tempinbuf;
    
   int tempinbufs;
    
   ec_bufT txbuf[2];
    
   int txbuflength[2];
    
   ec_bufT txbuf2;
    
   int txbuflength2;
    
   int lastidx;
    
   int redstate;
} ecx_portt;

extern const uint16 priMAC[3];
extern const uint16 secMAC[3];
extern volatile uint8_t Switch_Net;
extern volatile  unsigned char DM9000_EthStatus;
extern volatile  unsigned char DM9161_EthStatus;
extern volatile  unsigned char DM9000_Send_Receive;
extern volatile  unsigned char DM9161_Send_Receive;

extern ecx_portt     ecx_port;

void ec_setbufstat(int idx, int bufstat);
int ec_getindex(void);
int ec_outframe(int idx, int sock);
int ec_outframe_red(int idx);
int ec_srconfirm(int idx,int timeout);


void ec_setupheader(void *p);
int ecx_setupnic(ecx_portt *port,int secondary);
void ecx_setbufstat(ecx_portt *port, int idx, int bufstat);
int ecx_getindex(ecx_portt *port);
int ecx_outframe(ecx_portt *port, int idx, int sock);
int ecx_outframe_red(ecx_portt *port, int idx);
int ecx_srconfirm(ecx_portt *port, int idx,int timeout);





#line 47 "..\\ETHERCAT\\ethercatbase.h"









int ecx_setupdatagram(ecx_portt *port, void *frame, uint8 com, uint8 idx, uint16 ADP, uint16 ADO, uint16 length, void *data);
int ecx_adddatagram(ecx_portt *port, void *frame, uint8 com, uint8 idx, boolean more, uint16 ADP, uint16 ADO, uint16 length, void *data);
int ecx_BWR(ecx_portt *port, uint16 ADP,uint16 ADO,uint16 length,void *data,int timeout);
int ecx_BRD(ecx_portt *port, uint16 ADP,uint16 ADO,uint16 length,void *data,int timeout);
int ecx_APRD(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ecx_ARMW(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ecx_FRMW(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
uint16 ecx_APRDw(ecx_portt *port, uint16 ADP, uint16 ADO, int timeout);
int ecx_FPRD(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
uint16 ecx_FPRDw(ecx_portt *port, uint16 ADP, uint16 ADO, int timeout);
int ecx_APWRw(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 data, int timeout);
int ecx_APWR(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ecx_FPWRw(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 data, int timeout);
int ecx_FPWR(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ecx_LRW(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout);
int ecx_LRD(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout);
int ecx_LWR(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout);
int ecx_LRWDC(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, uint16 DCrs, int64 *DCtime, int timeout);


int ec_setupdatagram(void *frame, uint8 com, uint8 idx, uint16 ADP, uint16 ADO, uint16 length, void *data);
int ec_adddatagram(void *frame, uint8 com, uint8 idx, boolean more, uint16 ADP, uint16 ADO, uint16 length, void *data);
int ec_BWR(uint16 ADP,uint16 ADO,uint16 length,void *data,int timeout);
int ec_BRD(uint16 ADP,uint16 ADO,uint16 length,void *data,int timeout);
int ec_APRD(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ec_ARMW(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ec_FRMW(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
uint16 ec_APRDw(uint16 ADP, uint16 ADO, int timeout);
int ec_FPRD(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
uint16 ec_FPRDw(uint16 ADP, uint16 ADO, int timeout);
int ec_APWRw(uint16 ADP, uint16 ADO, uint16 data, int timeout);
int ec_APWR(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ec_FPWRw(uint16 ADP, uint16 ADO, uint16 data, int timeout);
int ec_FPWR(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout);
int ec_LRW(uint32 LogAdr, uint16 length, void *data, int timeout);
int ec_LRD(uint32 LogAdr, uint16 length, void *data, int timeout);
int ec_LWR(uint32 LogAdr, uint16 length, void *data, int timeout);
int ec_LRWDC(uint32 LogAdr, uint16 length, void *data, uint16 DCrs, int64 *DCtime, int timeout);






#line 57 "..\\ETHERCAT\\ethercatbase.c"







 
static void ecx_writedatagramdata(void *datagramdata, ec_cmdtype com, uint16 length, const void * data)
{
   if (length > 0)
   {
      switch (com)
      {
         case EC_CMD_NOP:
             
         case EC_CMD_APRD:
             
         case EC_CMD_FPRD:
             
         case EC_CMD_BRD:
             
         case EC_CMD_LRD:
             
            memset(datagramdata, 0, length);
            break;
         default:
            memcpy(datagramdata, data, length);
            break;
      }
   }
}












 
int ecx_setupdatagram(ecx_portt *port, void *frame, uint8 com, uint8 idx, uint16 ADP, uint16 ADO, uint16 length, void *data)
{
   ec_comt *datagramP;
   uint8 *frameP;

   frameP = (uint8 *)frame;
   
 
   datagramP = (ec_comt*)&frameP[sizeof(ec_etherheadert)];
   datagramP->elength =0x1000 + sizeof(ec_comt) + length;
   datagramP->command = com;
   datagramP->index = idx; 
   datagramP->ADP =ADP;
   datagramP->ADO =ADO;
   datagramP->dlength = length; 
   ecx_writedatagramdata(&frameP[sizeof(ec_etherheadert) + sizeof(ec_comt)], (ec_cmdtype)com, length, data);
    
   frameP[sizeof(ec_etherheadert) + sizeof(ec_comt) + length] = 0x00;
   frameP[sizeof(ec_etherheadert) + sizeof(ec_comt) + length + 1] = 0x00;
   
    
   port->txbuflength[idx] = sizeof(ec_etherheadert) + sizeof(ec_comt) + sizeof(uint16) + length;
   return 0;
}













 
int ecx_adddatagram(ecx_portt *port, void *frame, uint8 com, uint8 idx, boolean more, uint16 ADP, uint16 ADO, uint16 length, void *data)
{
   ec_comt *datagramP;
   uint8 *frameP;
   uint16 prevlength;

   frameP = (uint8 *)frame;
    
   prevlength = port->txbuflength[idx]; 
   datagramP = (ec_comt*)&frameP[sizeof(ec_etherheadert)];
    
   datagramP->elength = ((datagramP->elength) + sizeof(ec_comt) + length);
    
   datagramP->dlength = ((datagramP->dlength) | (1 << 15));
    
   datagramP = (ec_comt*)&frameP[prevlength - sizeof(uint16)];
   datagramP->command = com;
   datagramP->index = idx; 
   datagramP->ADP = (ADP);
   datagramP->ADO = (ADO);
   if (more)
   {
       
      datagramP->dlength = (length | (1 << 15)); 
   }
   else
   {
       
      datagramP->dlength = (length); 
   }
   ecx_writedatagramdata(&frameP[prevlength + sizeof(ec_comt) - sizeof(uint16)], (ec_cmdtype)com, length, data);
    
   frameP[prevlength + sizeof(ec_comt) - sizeof(uint16) + length] = 0x00;
   frameP[prevlength + sizeof(ec_comt) - sizeof(uint16) + length + 1] = 0x00;
    
   port->txbuflength[idx] = prevlength + sizeof(ec_comt) - sizeof(uint16) + sizeof(uint16) + length;

   
 
   return prevlength + sizeof(ec_comt) - sizeof(uint16) - sizeof(ec_etherheadert);  
}










  
int ecx_BWR (ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

    
   idx = ecx_getindex (port);
    
   ecx_setupdatagram (port, &(port->txbuf[idx]), EC_CMD_BWR, idx, ADP, ADO, length, data);
    
   wkc = ecx_srconfirm (port, idx, timeout);
    
   ecx_setbufstat (port, idx, EC_BUF_EMPTY);

   return wkc;
}   










  
int ecx_BRD(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

    
   idx = ecx_getindex(port);
    
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_BRD, idx, ADP, ADO, length, data);
    
   wkc = ecx_srconfirm (port, idx, timeout);
   if (wkc > 0)
   {
       
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }   
    
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}   










  
int ecx_APRD(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   int wkc;
   uint8 idx;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_APRD, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if (wkc > 0)
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}











  
int ecx_ARMW(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   int wkc;
   uint8 idx;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_ARMW, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if (wkc > 0)
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}











  
int ecx_FRMW(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   int wkc;
   uint8 idx;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_FRMW, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if (wkc > 0)
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}








  
uint16 ecx_APRDw(ecx_portt *port, uint16 ADP, uint16 ADO, int timeout)
{
   uint16 w;

   w = 0;
   ecx_APRD(port, ADP, ADO, sizeof(w), &w, timeout);

   return w;
}










  
int ecx_FPRD(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   int wkc;
   uint8 idx;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_FPRD, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if (wkc > 0)
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}








  
uint16 ecx_FPRDw(ecx_portt *port, uint16 ADP, uint16 ADO, int timeout)
{
   uint16 w;

   w = 0;
   ecx_FPRD(port, ADP, ADO, sizeof(w), &w, timeout);
   return w;
}










  
int ecx_APWR(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_APWR, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);
   
   return wkc;
}









  
int ecx_APWRw(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 data, int timeout)
{
   return ecx_APWR(port, ADP, ADO, sizeof(data), &data, timeout);
}










  
int ecx_FPWR(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   int wkc;
   uint8 idx;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_FPWR, idx, ADP, ADO, length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}









  
int ecx_FPWRw(ecx_portt *port, uint16 ADP, uint16 ADO, uint16 data, int timeout)
{
   return ecx_FPWR(port, ADP, ADO, sizeof(data), &data, timeout);
}









  
int ecx_LRW(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_LRW, idx, ((LogAdr) & 0xffff), ((LogAdr) >> 16), length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if ((wkc > 0) && (port->rxbuf[idx][sizeof(uint16)] == EC_CMD_LRW))
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}









  
int ecx_LRD(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_LRD, idx, ((LogAdr) & 0xffff), ((LogAdr) >> 16), length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   if ((wkc > 0) && (port->rxbuf[idx][sizeof(uint16)]==EC_CMD_LRD))
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}









  
int ecx_LWR(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, int timeout)
{
   uint8 idx;
   int wkc;

   idx = ecx_getindex(port);
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_LWR, idx, ((LogAdr) & 0xffff), ((LogAdr) >> 16), length, data);
   wkc = ecx_srconfirm(port, idx, timeout);
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}












  
int ecx_LRWDC(ecx_portt *port, uint32 LogAdr, uint16 length, void *data, uint16 DCrs, int64 *DCtime, int timeout)
{
   uint16 DCtO;
   uint8 idx;
   int wkc;
   uint64 DCtE;

   idx = ecx_getindex(port);
    
   ecx_setupdatagram(port, &(port->txbuf[idx]), EC_CMD_LRW, idx, ((LogAdr) & 0xffff), ((LogAdr) >> 16), length, data);
    
   DCtE = (*DCtime);
   DCtO = ecx_adddatagram(port, &(port->txbuf[idx]), EC_CMD_FRMW, idx, 0, DCrs, ECT_REG_DCSYSTIME, sizeof(DCtime), &DCtE);
   wkc = ecx_srconfirm(port, idx, timeout);
   if ((wkc > 0) && (port->rxbuf[idx][sizeof(uint16)] == EC_CMD_LRW))
   {
      memcpy(data, &(port->rxbuf[idx][sizeof(ec_comt)]), length);
      memcpy(&wkc, &(port->rxbuf[idx][sizeof(ec_comt) + length]), sizeof(uint16));
      memcpy(&DCtE, &(port->rxbuf[idx][DCtO]), sizeof(*DCtime));
      *DCtime = (DCtE);
   }
   ecx_setbufstat(port, idx, EC_BUF_EMPTY);

   return wkc;
}


int ec_setupdatagram(void *frame, uint8 com, uint8 idx, uint16 ADP, uint16 ADO, uint16 length, void *data)
{
   return ecx_setupdatagram (&ecx_port, frame, com, idx, ADP, ADO, length, data);
}

int ec_adddatagram (void *frame, uint8 com, uint8 idx, boolean more, uint16 ADP, uint16 ADO, uint16 length, void *data)
{
   return ecx_adddatagram (&ecx_port, frame, com, idx, more, ADP, ADO, length, data);
}

int ec_BWR(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_BWR (&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_BRD(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_BRD(&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_APRD(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_APRD(&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_ARMW(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_ARMW(&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_FRMW(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_FRMW(&ecx_port, ADP, ADO, length, data, timeout);
}

uint16 ec_APRDw(uint16 ADP, uint16 ADO, int timeout)
{
   uint16 w;

   w = 0;
   ec_APRD(ADP, ADO, sizeof(w), &w, timeout);

   return w;
}

int ec_FPRD(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_FPRD(&ecx_port, ADP, ADO, length, data, timeout);
}

uint16 ec_FPRDw(uint16 ADP, uint16 ADO, int timeout)
{
   uint16 w;

   w = 0;
   ec_FPRD(ADP, ADO, sizeof(w), &w, timeout);
   return w;
}

int ec_APWR(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_APWR(&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_APWRw(uint16 ADP, uint16 ADO, uint16 data, int timeout)
{
   return ec_APWR(ADP, ADO, sizeof(data), &data, timeout);
}

int ec_FPWR(uint16 ADP, uint16 ADO, uint16 length, void *data, int timeout)
{
   return ecx_FPWR(&ecx_port, ADP, ADO, length, data, timeout);
}

int ec_FPWRw(uint16 ADP, uint16 ADO, uint16 data, int timeout)
{
   return ec_FPWR(ADP, ADO, sizeof(data), &data, timeout);
}

int ec_LRW(uint32 LogAdr, uint16 length, void *data, int timeout)
{
   return ecx_LRW(&ecx_port, LogAdr, length, data, timeout);
}

int ec_LRD(uint32 LogAdr, uint16 length, void *data, int timeout)
{
   return ecx_LRD(&ecx_port, LogAdr, length, data, timeout);
}

int ec_LWR(uint32 LogAdr, uint16 length, void *data, int timeout)
{
   return ecx_LWR(&ecx_port, LogAdr, length, data, timeout);
}

int ec_LRWDC(uint32 LogAdr, uint16 length, void *data, uint16 DCrs, int64 *DCtime, int timeout)
{
   return ecx_LRWDC(&ecx_port, LogAdr, length, data, DCrs, DCtime, timeout);
}
