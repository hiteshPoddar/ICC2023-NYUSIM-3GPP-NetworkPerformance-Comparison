# ICC2023-NYUSIM-3GPP-NetworkPerformance-Comparison
Title: Full-Stack End-To-End mmWave Simulations Using 3GPP and NYUSIM Channel Model in ns-3
Link to paper: https://arxiv.org/abs/2302.12385

This repository contains the results from ns-3 simulation used in the above mentioned paper and the code files to process the results. In case of any doubts please contact hiteshp@nyu.edu

The simulation setup used is as follows: We aim to study the impact of SINR on the end-to-end throughput, latency, and packet drop observed by a wireless modem operating at 28 GHz with a bandwidth of 100 MHz in Urban Microcell (UMi), Urban Macrocell (UMa), Rural Macrocell (RMa), and Indoor Hotspot (InH) scenarios in LOS and NLOS channel conditions using 3GPP Statisitical Channel Model (SCM) and NYUSIM chanel model. Video is transmitted from a remote server using User Datagram Protocol (UDP) at 50 Mbps (4K/8K video, low-end AR/VR applications) over an NR network (ns-3 mmWave module). Simulations performed in this work consider one next-generation base station (gNB) and one user equipment (UE). The UE is fixed at 100 m from the gNB. The gNB transmits at a power of 30 dBm. The simulations are run by fixing the link to a deterministic LOS/NLOS state. We run 50 realizations for each combination of channel model (NYUSIM/3GPP SCM) and channel condition (fixed LOS/NLOS) in each scenario. In each realization (duration of 9 seconds), HARQ is enabled, and blockage is disabled for both 3GPP SCM and NYUSIM

The file used in ns-3 for simulation is:

************************************************** Output Files *********************************************
There are 16 folders each containing 50 simulation runs. The names of the folders are:
1.  3GPPInHLos : 50 simulation runs for InH scenario using 3GPP SCM and channel condition fixed to LOS.
2.  3GPPInHNlos: 50 simulation runs for InH scenario using 3GPP SCM and channel condition fixed to NLOS.
3.  3GPPRmaLos : 50 simulation runs for RMa scenario using 3GPP SCM and channel condition fixed to LOS.
4.  3GPPRmaNlos: 50 simulation runs for RMa scenario using 3GPP SCM and channel condition fixed to NLOS.
5.  3GPPUmaLos : 50 simulation runs for UMa scenario using 3GPP SCM and channel condition fixed to LOS.
6.  3GPPUmaNlos: 50 simulation runs for UMa scenario using 3GPP SCM and channel condition fixed to NLOS.
7.  3GPPUmiLos : 50 simulation runs for UMi scenario using 3GPP SCM and channel condition fixed to LOS.
8.  3GPPUmiNlos: 50 simulation runs for UMi scenario using 3GPP SCM and channel condition fixed to NLOS.
9.  nyuInHLos  : 50 simulation runs for InH scenario using NYUSIM and channel condition fixed to LOS.
10. nyuInHNlos : 50 simulation runs for InH scenario using NYUSIM and channel condition fixed to NLOS.
11. nyuRmaLos  : 50 simulation runs for RMa scenario using NYUSIM and channel condition fixed to LOS.
12. nyuRmaNlos : 50 simulation runs for RMa scenario using NYUSIM and channel condition fixed to NLOS.
13. nyuUmaLos  : 50 simulation runs for UMa scenario using NYUSIM and channel condition fixed to LOS.
14. nyuUmaNlos : 50 simulation runs for UMa scenario using NYUSIM and channel condition fixed to NLOS.
15. nyuUmiLos  : 50 simulation runs for UMi scenario using NYUSIM and channel condition fixed to LOS.
16. nyuUmiNlos : 50 simulation runs for UMi scenario using NYUSIM and channel condition fixed to NLOS.
--------------------------------------------------------------------------------------------------------------
1 (a). pathlossNYUSIM142GHz.xlsx: has path loss values computed using CI path loss model with 1 m reference 
distance for UMi, UMa, RMa and InH scenarios. 
1 (b). pathlossPlots142GHzNYUSIM.m: plots the path loss values present in the pathlossNYUSIM142GHz.xlsx file.
--------------------------------------------------------------------------------------------------------------
2 (a). pathlossNYUSIM28GHz.xlsx: has path loss values computed using CI path loss model with 1 m reference 
distance for UMi, UMa, RMa, InH and InF scenarios.
2 (b).pathLossPlots28GHzNYUSIM.m: plots the path loss values present in thepathlossNYUSIM28GHz.xlsx file.
--------------------------------------------------------------------------------------------------------------




