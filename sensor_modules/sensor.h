#ifndef SENSOR_H_INCLUDED
#define SENSOR_H_INCLUDED



#ifdef __cplusplus
extern "C" {
#endif

#include "stdint.h"

typedef void (*serial_write)(const uint8_t* data, int size);    // write to serial

typedef struct sensor_t* sensor_ins;                            // sensor type structure

// Declaration of functions
sensor_ins create_new_sensor(serial_write, uint8_t*);           
void send_request(sensor_ins);
void parse_data(sensor_ins);

int get_pm1_0(void);
int get_pm2_5(void);
int get_pm10(void);
int get_co2(void);
int get_voc(void);
float get_temperature(void);
int get_humidity(void);
float get_ch2o(void);
float get_co(void);
float get_o3(void);
float get_no2(void);

#ifdef __cplusplus
}
#endif

#endif
