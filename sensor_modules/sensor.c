#include "sensor.h"
#include "stdlib.h"
#include "stdio.h"
#include "string.h"

// sensor type structure
struct sensor_t
{
    serial_write serial_write_cb;  // serial write
    uint8_t* buf;                  // buffer
};

#pragma pack(push, 1)           // struct members are aligned (byte packing) 
struct protocol_format_t        // according to the datasheet
{
    uint8_t start_bit;
    uint8_t command;
    uint16_t pm1_0;
    uint16_t pm2_5;
    uint16_t pm10;
    uint16_t co2;
    uint8_t  voc;
    uint16_t temperature;
    uint16_t humidity;
    uint16_t ch2o;
    uint16_t co;
    uint16_t o3;
    uint16_t no2;
    uint16_t reserved;
    uint16_t checksum;
};

#pragma pack(pop)

static struct protocol_format_t protocol_format_value_holder;                     // to hold gaz data 

// to create a sensor module instance
sensor_ins create_new_sensor(serial_write serial_write_cb, uint8_t* linking_buf) 
{   
    if (serial_write_cb == (void*)0  || linking_buf == (void*)0)                  // in case where callback and buffer are not given
    {

    }

    sensor_ins ret = (sensor_ins)malloc(sizeof(struct sensor_t));                 // create new instance of sensor module

    if (!ret)  // if NULL is returned (instance not created)                                                         
    {
 
    }

    ret -> buf = linking_buf;                     // set sensor buffer 
    ret -> serial_write_cb = serial_write_cb;     // set sensor callback function

    return ret;                                   

}

// to send a command 
void send_request(sensor_ins self_arg)
{   
    if (self_arg == (void*)0)
    {
 
    }    

    static const uint8_t buf[9] = {0xFF, 0x01, 0x86, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79};    // commands according to the datasheet

    self_arg -> serial_write_cb(buf, sizeof(buf));                                           
}

// check the checksum state according to the datasheet
static int checksum_check(sensor_ins self_arg)
{
    if (self_arg == (void*)0)
    {
        //Self NULL olamaz.
    }

    uint8_t checksum = self_arg -> buf[25];
    uint8_t sum = 0x00;

    for (int i = 1; i < 25; ++i)
    {
        sum += self_arg -> buf[i];
    }

    sum = ~sum;

    sum = sum + 1;

    return (checksum == sum);
}

// parsing the sensor module data
void parse_data(sensor_ins self_arg)
{
    if (self_arg == (void*)0)
    {
        // self_arg must be diff from 0
    }

    if (checksum_check(self_arg))               // if checksum is true (data successfully read)
    {    
        struct protocol_format_t* protocol_casting = (struct protocol_format_t*) self_arg -> buf;                 // casting sensor buffer into protocol format
        protocol_format_value_holder.pm1_0 = (protocol_casting -> pm1_0 >> 8) | (protocol_casting -> pm1_0 << 8); // get gaz data according to there address  
        protocol_format_value_holder.pm2_5 = (protocol_casting -> pm2_5 >> 8) | (protocol_casting -> pm2_5 << 8);
        protocol_format_value_holder.pm10 = (protocol_casting -> pm10 >> 8) | (protocol_casting -> pm10 << 8);
        protocol_format_value_holder.co2 = (protocol_casting -> co2 >> 8) | (protocol_casting -> co2 << 8);
        protocol_format_value_holder.voc = (protocol_casting -> voc);
        protocol_format_value_holder.temperature = ((protocol_casting -> temperature >> 8) | (protocol_casting -> temperature << 8)) - 500;  // (-500) // datasheet 
        protocol_format_value_holder.humidity = (protocol_casting -> humidity >> 8) | (protocol_casting -> humidity << 8);
        protocol_format_value_holder.ch2o = (protocol_casting -> ch2o >> 8) | (protocol_casting -> ch2o << 8);
        protocol_format_value_holder.co = (protocol_casting -> co >> 8) | (protocol_casting -> co << 8);
        protocol_format_value_holder.o3 = (protocol_casting -> o3 >> 8) | (protocol_casting -> o3 << 8);
        protocol_format_value_holder.no2 = (protocol_casting -> no2 >> 8) | (protocol_casting -> no2 << 8);
               
    }  
}

//  get gazea, temperature and humidity data
int get_pm1_0(void)
{
    return protocol_format_value_holder.pm1_0;
}

int get_pm2_5(void)
{
    return protocol_format_value_holder.pm2_5;
}

int get_pm10(void)
{
    return protocol_format_value_holder.pm10;
}

int get_co2(void)
{
    return protocol_format_value_holder.co2;
}

int get_voc(void)
{
    return 0;
}

float get_temperature(void)
{
    return (protocol_format_value_holder.temperature * 0.1);
}

int get_humidity(void)
{
    return protocol_format_value_holder.humidity;
}

float get_ch2o(void)
{
    return (protocol_format_value_holder.ch2o * 0.0001);
}

float get_co(void)
{
    return (protocol_format_value_holder.co * 0.01);
}

float get_o3(void)
{
    return (protocol_format_value_holder.o3 * 0.01);
}

float get_no2(void)
{
    return (protocol_format_value_holder.no2 * 0.01);
}
