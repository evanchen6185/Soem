/*
 * Simple Open EtherCAT Master Library 
 *
 * File    : ethercatcoe.h
 * Version : 1.3.1
 * Date    : 11-03-2015
 * Copyright (C) 2005-2015 Speciaal Machinefabriek Ketels v.o.f.
 * Copyright (C) 2005-2015 Arthur Ketels
 * Copyright (C) 2008-2009 TU/e Technische Universiteit Eindhoven
 * Copyright (C) 2014-2015 rt-labs AB , Sweden
 *
 * SOEM is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License version 2 as published by the Free
 * Software Foundation.
 *
 * SOEM is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * for more details.
 *
 * As a special exception, if other files instantiate templates or use macros
 * or inline functions from this file, or you compile this file and link it
 * with other works to produce a work based on this file, this file does not
 * by itself cause the resulting work to be covered by the GNU General Public
 * License. However the source code for this file must still be made available
 * in accordance with section (3) of the GNU General Public License.
 *
 * This exception does not invalidate any other reasons why a work based on
 * this file might be covered by the GNU General Public License.
 *
 * The EtherCAT Technology, the trade name and logo “EtherCAT” are the intellectual
 * property of, and protected by Beckhoff Automation GmbH. You can use SOEM for
 * the sole purpose of creating, using and/or selling or otherwise distributing
 * an EtherCAT network master provided that an EtherCAT Master License is obtained
 * from Beckhoff Automation GmbH.
 *
 * In case you did not receive a copy of the EtherCAT Master License along with
 * SOEM write to Beckhoff Automation GmbH, Eiserstraße 5, D-33415 Verl, Germany
 * (www.beckhoff.com).
 */

/** \file 
 * \brief
 * Headerfile for ethercatcoe.c 
 */

#ifndef _ethercatcoe_
#define _ethercatcoe_

#ifdef __cplusplus
extern "C"
{
#endif

#ifdef EC_VER1
int ec_SDOread(uint16 slave, uint16 index, uint8 subindex,
                      boolean CA, int *psize, void *p, int timeout);
int ec_SDOwrite(uint16 Slave, uint16 Index, uint8 SubIndex,
    boolean CA, int psize, void *p, int Timeout);
int ec_RxPDO(uint16 Slave, uint16 RxPDOnumber , int psize, void *p);
int ec_TxPDO(uint16 slave, uint16 TxPDOnumber , int *psize, void *p, int timeout);
#endif
int ecx_readPDOmap(ecx_contextt *context, uint16 Slave, int *Osize, int *Isize);
int ecx_readPDOmapCA(ecx_contextt *context, uint16 Slave, int *Osize, int *Isize);
void ecx_SDOerror(ecx_contextt *context, uint16 Slave, uint16 Index, uint8 SubIdx, int32 AbortCode);
int ecx_SDOread(ecx_contextt *context, uint16 slave, uint16 index, uint8 subindex,
                      boolean CA, int *psize, void *p, int timeout);
int ecx_SDOwrite(ecx_contextt *context, uint16 Slave, uint16 Index, uint8 SubIndex,
    boolean CA, int psize, void *p, int Timeout);
int ecx_RxPDO(ecx_contextt *context, uint16 Slave, uint16 RxPDOnumber , int psize, void *p);
int ecx_TxPDO(ecx_contextt *context, uint16 slave, uint16 TxPDOnumber , int *psize, void *p, int timeout);
#ifdef __cplusplus
}
#endif

#endif
