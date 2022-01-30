#include <pic.h>
#include <htc.h>
#define _XTAL_FREQ 20e6
__CONFIG(0X3F3A);

#define RS RD2
#define EN RD3
#define ON 1
#define OFF 0

void value();
int v,a,b,c,d,temp1,temp2;

void Lcd_Command(const unsigned char cmd)
{
	PORTD = (cmd & 0XF0);
	RS = OFF;
	EN = ON;
	__delay_ms(5);
	EN = OFF;

	PORTD = ((cmd<<4) & 0xF0);
	RS = OFF;
	EN = ON;
	__delay_ms(5);
	EN = OFF;
}

void Lcd_Data(const unsigned char Data)
{
	PORTD = (Data & 0XF0);
	RS = ON;
	EN = ON;
	__delay_ms(5);
	EN = OFF;

	PORTD = ((Data<<4) & 0xF0);
	RS = ON;
	EN = ON;
	__delay_ms(5);
	EN = OFF;
}

void Lcd_String(const unsigned char *Str)
{
	while(*Str != 0)
	{
		Lcd_Data(*Str++);
	}	
}

void Lcd_Intialization()
{
	Lcd_Command(0x02);
	Lcd_Command(0x28);
	Lcd_Command(0x0c);
}

void divider(int x)
{
	int Temp,Dig1,Dig2,Dig3,Dig4;
	
	Temp = x;				//Temp = 6789
	Dig1 = Temp%10;			//Dig1 = 9
	Temp = Temp/10;			//Temp = 678
	Dig2 = Temp%10;			//Dig2 = 8
	Temp = Temp/10;			//Temp = 67
	Dig3 = Temp%10;			//Dig3 = 7
	Dig4 = Temp/10;			//Dig4 = 6

	Lcd_Data(Dig4+48);
	Lcd_Data(Dig3+48);
	Lcd_Data(Dig2+48);
	Lcd_Data(Dig1+48);
}

void ADC(int Channel)
{
	while((ADCON0=0X05|(Channel<<3))==1);
//		ADCON0=(2<<3);
	v=(ADRESH<<8)+ADRESL;
}

void main()
{
	TRISA=0X03;
	PORTA=0X00;
	TRISD=0X00;
	PORTD=0X00;

	ADCON0=0X01;
	ADCON1=0Xce;

	Lcd_Intialization();
	__delay_ms(100);

	Lcd_Command(0x80);
	Lcd_String("LYCASOFT");
	__delay_ms(1000);
	Lcd_Command(0x80);
	Lcd_String("P1 VALUE:");
	Lcd_Command(0xc0);
	Lcd_String("P2 VALUE:");

	while(1)
	{
		ADC(0);
		Lcd_Command(0x8A);
		divider(v);

		ADC(1);
		Lcd_Command(0xCA);
		divider(v);
	}
}