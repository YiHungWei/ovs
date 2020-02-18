/* SPDX-License-Identifier: BSD-3-Clause
 * Copyright(c) 2010-2014 Intel Corporation
 */

#include <config.h>
#include "qos.h"

#include <errno.h>

#include "openvswitch/util.h"
#include "openvswitch/vlog.h"
#include "timeval.h"

#define MIN_BYTES_PER_PERIOD    100
#define USEC_HZ 1000000

static void
rte_meter_get_tb_params(uint64_t hz, uint64_t rate, uint64_t *tb_period,
                        uint64_t *tb_bytes_per_period)
{
    double bytes_per_period;

    if (rate == 0) {
        *tb_bytes_per_period = 0;
        *tb_period = 1;
        return;
    }

    bytes_per_period = ((double) rate / (double) hz);

    if (bytes_per_period >= MIN_BYTES_PER_PERIOD) {
        *tb_period = 1;
        *tb_bytes_per_period = DIV_ROUND_UP(rate, hz);
    } else {
        *tb_period = MIN_BYTES_PER_PERIOD / bytes_per_period;
        *tb_bytes_per_period = MIN_BYTES_PER_PERIOD;
    }
}

int
rte_meter_srtcm_profile_config(struct rte_meter_srtcm_profile *p,
                               struct rte_meter_srtcm_params *params)
{
    uint64_t hz = USEC_HZ;

    /* Check input parameters */
    if ((p == NULL) ||
        (params == NULL) ||
        (params->cir == 0) ||
        ((params->cbs == 0) && (params->ebs == 0)))
        return -EINVAL;

    /* Initialize srTCM run-time structure */
    p->cbs = params->cbs;
    p->ebs = params->ebs;
    rte_meter_get_tb_params(hz, params->cir, &p->cir_period,
        &p->cir_bytes_per_period);

    return 0;
}

int
rte_meter_srtcm_config(struct rte_meter_srtcm *m,
                       struct rte_meter_srtcm_profile *p)
{
    /* Check input parameters */
    if ((m == NULL) || (p == NULL)) {
        return -EINVAL;
    }

    /* Initialize srTCM run-time structure */
    m->time = time_usec();
    m->tc = p->cbs;
    m->te = p->ebs;

    return 0;
}

int
rte_meter_trtcm_profile_config(struct rte_meter_trtcm_profile *p,
                               struct rte_meter_trtcm_params *params)
{
    uint64_t hz = USEC_HZ;

    /* Check input parameters */
    if ((p == NULL) ||
        (params == NULL) ||
        (params->cir == 0) ||
        (params->pir == 0) ||
        (params->pir < params->cir) ||
        (params->cbs == 0) ||
        (params->pbs == 0))
        return -EINVAL;

    /* Initialize trTCM run-time structure */
    p->cbs = params->cbs;
    p->pbs = params->pbs;
    rte_meter_get_tb_params(hz, params->cir, &p->cir_period,
        &p->cir_bytes_per_period);
    rte_meter_get_tb_params(hz, params->pir, &p->pir_period,
        &p->pir_bytes_per_period);

    return 0;
}

int
rte_meter_trtcm_config(struct rte_meter_trtcm *m,
                       struct rte_meter_trtcm_profile *p)
{
    /* Check input parameters */
    if ((m == NULL) || (p == NULL)) {
        return -EINVAL;
    }

    /* Initialize trTCM run-time structure */
    m->time_tc = m->time_tp = time_usec();
    m->tc = p->cbs;
    m->tp = p->pbs;

    return 0;
}

int
rte_meter_trtcm_rfc4115_profile_config(
    struct rte_meter_trtcm_rfc4115_profile *p,
    struct rte_meter_trtcm_rfc4115_params *params)
{
    uint64_t hz = USEC_HZ;

    /* Check input parameters */
    if ((p == NULL) ||
        (params == NULL) ||
        (params->cir != 0 && params->cbs == 0) ||
        (params->eir != 0 && params->ebs == 0))
        return -EINVAL;

    /* Initialize trTCM run-time structure */
    p->cbs = params->cbs;
    p->ebs = params->ebs;
    rte_meter_get_tb_params(hz, params->cir, &p->cir_period,
        &p->cir_bytes_per_period);
    rte_meter_get_tb_params(hz, params->eir, &p->eir_period,
        &p->eir_bytes_per_period);

    return 0;
}

int
rte_meter_trtcm_rfc4115_config(
    struct rte_meter_trtcm_rfc4115 *m,
    struct rte_meter_trtcm_rfc4115_profile *p)
{
    /* Check input parameters */
    if ((m == NULL) || (p == NULL)) {
        return -EINVAL;
    }

    /* Initialize trTCM run-time structure */
    m->time_tc = m->time_te = time_usec();
    m->tc = p->cbs;
    m->te = p->ebs;

    return 0;
}
