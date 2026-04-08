# SAD / ICD


# System Architecture Document


**시스템 아키텍처 설계서**


### Physical Architecture


**[3.0]**


[Interface_Control_Document.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ad8b3093-1957-4c32-8623-bdc57577dd6e/Interface_Control_Document.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=812db4686c02751debe26fc31cdbb460a060823b528a1a2902e6a6768e38b679&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Untitled.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/47cb5423-098f-482e-971e-1d79d5b34f98/Untitled.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=73f42ddcf19d7dc994fb837eeab3975944edda12d97aeea616ebb8ed19901dd4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Untitled_2.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/80e8dcc9-7db0-4de3-8743-c160f15b96ba/Untitled_2.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=bc248e352ade98740739f8dd5fa8584b7acddfed771f2d80df4b5afdbbbfa8f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Arduion_Mega_2560.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/13a64686-d858-483b-9a60-a334ae254269/Arduion_Mega_2560.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=a0f5af7820e760dc46dd824f0cc128bd39967a77ec0f261446ed38900f14fc75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Raspberry_Pi_4.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/5cb27376-116a-4fa1-ba2b-41848a930985/Raspberry_Pi_4.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=d1c66ad6d44ab5079f5e717ab2352cd7554f071887e29824e0464091721816e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[System_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f1a1362f-7276-4e41-a72e-ff605ecb7913/System_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MONJ7AI%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T213917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJHMEUCIQD8jHdF42adqW7%2B9Hz%2FhptlCXMeJIcAg2WzDauln6pCagIgZ1jfEL0nxbrjENaCuQt56V%2FhE%2B2E9LA8%2FUNY4Aa3pbgq%2FwMIBRAAGgw2Mzc0MjMxODM4MDUiDFMpEj%2BHmMdmd8M50ircA%2FAtEyEEccFV9GZ9XJsOAPfV5eUft4hs6bEtV3%2FE3zdBgN1yrF17bogldIO61vF%2B2M3cgRo6MqXDV6%2BvutNlrTfMZMGf6OGmt%2FYdfU5AWkzJ3%2FaGoOOmZPcpA7OYeud6NN3%2F7HS7L%2FZSv%2BvBbzJshICSvcMkdyYeox5tUlqnDq3sWjit1zlE3OWBnNZB4KSA6WEoDoY%2FYibAvZfsfsAsqs7fqEyEB8DMZs29%2Bluq3q5I2ObhYgnaKVqcLrVXGedxngFZvAyti2DZlKe%2Fdm4Bu4pqnRdGUHk6NjURwBLok7eqCh8uGgSGjrHOFwr%2BDxzg7paCCya%2BB1jTScIq3L475aqzU%2Fca8upQGEBVUxmKkcg47s489fyJ3Iu3v4lh%2B8DN4Ns1tjgjWdt8kDh2ABeiO6YiSyKsdZ2mEsfOx20NWYWaS%2BnG96OfgCPve6osZL1wD0RSO%2B8JeX5uYTtMAO4SAYnsO%2FT1cCfZc9kuyxhrS%2B5maptbsuYK6oxVfGX%2BtcWUZLDn3RswtVX%2BT8w2ki%2BlndKofh6s4falT2MrFRDDi94Se8JKTlnN3OVXjBYkn3IaNzLoolV280XfVmGYG7oG6jusz5Kg3%2Fu5JCXyenF8RV7OowB7SiUrEHvqmdexMKjo2s4GOqUBPaKfGPN4cm%2FAxWabfRiIwgY9a%2FDdYHSQ61opy1azYWASXl7oW9upTxHn3S8WY86%2FTi4odtG9Y08462r8LoeXOsTjcm0vwZgyAoKBdwJBbzi%2FOLyJ87U7sJ4VNhAra3hlWqrq7HnM8hw9HJik5MfeDJKs8BUWhlM0inJ201nNyMzWNbtyPalN8rRM%2BcFic6aFO8g02MKds1MO6lMhgj7z7myGxNBi&X-Amz-Signature=9326d2082a79de53dcacfa7d460a869f5424b0b4460e23b00d157dc38c829051&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


하드웨어 컴포넌트 간의 물리적인 연결과 전원, 데이터의 흐름을 정의

- **[Layer 1] 전원 분배망 (Power Network):**
	- 11.1V Li-Po 배터리 → 20A 블레이드 퓨즈 → 30A 스위치 → XT60 Y-케이블 분기
	- (분기 1: 고전류) → 모터 드라이버 (11.1V 직결)
	- (분기 2: 정전압) → 6A UBEC (5V 강하) → Raspberry Pi 4 & Arduino Mega 2560
	- (분기3) -> XL4015(6.5V 강하) -> 조향 서보모터
- **[Layer 2] 두뇌 / 척수 / 말단 (Computing & Control):**
	- **상위 제어기 (Raspberry Pi 4):** Ubuntu 22.04 기반 ROS 2 통신망 구축, 고부하 연산(비전, 라이다 처리) 및 자율주행 판단
	- **중위 제어기 (STM32):** 모터 PWM 신호 생성 / PID(초정밀 속도 제어) / 오도메트리 측정 (IMU 센서)
	- **하위 제어기 (Arduino Mega 2560):** 실시간성이 중요한 I/O 제어 (초음파 펄스 처리, 조향 서보모터, 하드웨어 인터럽트(AEB))
- **[Layer 3] 인지 및 구동 (Sensors & Actuators):**
	- **센서부:** RPLiDAR A1 (360도 스캔), Pi Camera V2 (차선 영상), HC-SR04 (근접 거리 측정)
	- **구동부:** JGB37-520 DC 모터 (후륜 구동), LD-1501MG 서보모터 (전륜 조향)

### STM32


**STM32F407VET6** 기반의 로봇 컨트롤 보드


1. 핵심 프로세서 및 모션 센서

- **STM32F407VET6 Master:** 보드의 두뇌입니다. ARM Cortex-M4 코어를 탑재하여 높은 연산 속도를 자랑하며, 로봇의 복잡한 알고리즘(역기구학, PID 제어 등)을 처리합니다.
- **MPU6050 IMU:** 6축 가속도계와 자이로스코프가 통합된 센서입니다. 로봇의 기울기, 회전, 균형을 측정하는 데 필수적입니다.

2. 전원부 (Power)

- **5V5A external power supply:** 외부 전원 입력부입니다. 고전류(5A)를 지원하여 모터나 서보에 안정적인 전력을 공급합니다.
- **Power Interface (파란색 터미널):** 배터리나 외부 전원 어댑터를 연결하는 주 전원 입력 단자입니다.
- **Power switch:** 보드 전체의 전원을 켜고 끄는 물리 스위치입니다.
- **On-board power indicator:** 전원이 정상적으로 공급되고 있는지 보여주는 LED입니다.

3. 모터 및 서보 인터페이스

- **Four-way coded motor Interface (PH2.0 * 6):** 엔코더가 달린 모터 4개를 제어하는 포트입니다. 엔코더 신호를 받아 정밀한 속도와 위치 제어가 가능합니다.
- **5V power supply PWM steering gear interface X4:** 일반적인 서보 모터(Steering gear) 4개를 연결하는 PWM 포트입니다.
- **Bus steering gear interface x2:** 직렬 버스 서보(Serial Bus Servo)를 위한 인터페이스입니다. 여러 개의 서보를 직렬로 연결해 제어할 때 사용합니다.
- **Motor control switch:** 모터 드라이버 부분의 전원을 별도로 차단하거나 설정할 때 사용합니다.

4. 통신 및 디버깅 인터페이스

- **USB serial port 1 / burn download:** 펌웨어 업로드(Burning) 및 PC와의 시리얼 통신을 위한 주 포트입니다.
- **USB serial port 2:** 추가적인 시리얼 통신 장치를 연결할 수 있는 포트입니다.
- **I2C Extended Interface:** OLED, 각종 센서 등 I2C 통신 방식의 주변 장치를 확장할 수 있습니다. * **Bluetooth module interface:** HC-05/06 같은 블루투스 모듈을 꽂아 스마트폰 앱 등으로 무선 조종을 할 수 있게 합니다.
- **SBUS remote control receiver interface:** 드론 조종기 같은 RC 수신기를 연결하기 위한 고속 직렬 통신 포트입니다.
- **GPIO extension and SWD debugging:** STM32의 남는 핀을 사용하거나, ST-Link 같은 디버거를 연결해 실시간 코드 디버깅을 할 때 사용합니다.

5. 사용자 입출력 및 기타

- **0.96 inch LCD display interface:** 작은 OLED 디스플레이를 바로 꽂아 로봇의 상태(배터리, 센서값 등)를 확인할 수 있습니다.
- **USB HOST interface:** USB 핸들(게임패드) 수신기 등을 연결하여 로봇을 직접 조작할 수 있습니다.
- **User button x2 / User indicator:** 프로그래밍 가능한 버튼과 LED입니다. 특정 모드 진입이나 상태 표시용으로 설정 가능합니다.
- **Buzzer:** 경고음이나 알림음을 내는 장치입니다.
- **Reset button:** 시스템을 강제로 재시작하는 버튼입니다.

### Logical/SW Architecture


ROS 2(Humble) 환경에서 노드(Node)들이 어떻게 역할을 분담하는지 정의


| **아키텍처 계층 (Layer)**       | **주요 컴포넌트 (Node / Module)** | **역할 및 책임**                                                |
| ------------------------- | --------------------------- | ---------------------------------------------------------- |
| **인지 계층 (Perception)**    | `lidar_node`, `camera_node` | 외부 환경 데이터를 수집하여 규격화된 메시지 타입으로 변환 후 ROS 통신망에 배포.            |
| **판단 및 계획 계층 (Planning)** | `autonomous_driving_node`   | 센서 융합 데이터를 분석하여 차선 유지 및 장애물 회피 알고리즘 수행. 최종 목표 속도/조향각 계산.   |
| **제어 추상화 계층 (Control)**   | `serial_bridge_node`        | 라즈베리파이의 판단 결과(`/cmd_vel`)를 아두이노가 이해할 수 있는 직렬 데이터로 변환하여 송신. |
| **하드웨어 제어 계층 (Firmware)** | Arduino C++ Firmware        | 수신된 명령을 물리적 신호(PWM)로 변환하여 JGB37-520과 LD-1501MG를 직접 구동.     |


# Interface Control Document


**시스템 인터페이스 정의서**


서브 시스템 간에 주고받는 물리적 신호와 소프트웨어 메시지 규격을 명확히 약속하는 문서


### Hardware Interfaces


물리적 포트, 통신 프로토콜, 전기적 신호 규격


| **Source**     | **Destination** | **인터페이스 유형**      | **핀/포트 규격**           | **전달 내용**                          |
| -------------- | --------------- | ----------------- | --------------------- | ---------------------------------- |
| 11.1V 메인 전원    | Y-케이블           | **Power**         | XT60 (수 → 암)          | 최대 30A의 시스템 메인 전력                  |
| Raspberry Pi 4 | Pi Camera V2    | **Data (Video)**  | 15-pin CSI-2          | 실시간 카메라 영상 스트리밍                    |
| RPLiDAR A1     | Raspberry Pi 4  | **Data (Serial)** | USB 3.0 포트            | 115200 bps 시리얼 데이터 (Point Cloud)   |
| Raspberry Pi 4 | Arduino Mega    | **Data (Serial)** | USB 2.0 (Type A to B) | 제어 명령 및 초음파 센서 패킷 교환               |
| STM32          | JGB37-520 (모터)  | **Signal (PWM)**  | Digital PWM (핀 2, 3)  | 0~255 스케일의 전진/후진 속도 제어 신호          |
| Arduino Mega   | LD-1501MG (서보)  | **Signal (PWM)**  | Digital PWM (핀 9)     | 0~180도 스케일의 조향 제어 신호               |
| Arduino Mega   | HC-SR04         | **Signal (GPIO)** | Digital I/O (핀 22~29) | 10us HIGH 펄스 (Trig) 및 응답 시간 (Echo) |
| Arduino Mega   | STM32           | **Signal (GPIO)** | Digital (10)          |                                    |


|          |                       | 전압 (입력/출력)                     | 전류                | 비고                                            |
| -------- | --------------------- | ------------------------------ | ----------------- | --------------------------------------------- |
| Battery  | 11.1V 5000mAh 3S LiPo | 11.1V (완충 시 12.6V)             |                   | XT60 커넥터를 통해 모터 드라이버 및 전압 컨버터로 분배             |
| 제어 및 연산부 | Raspberry Pi 4        | 5V DC                          | 최소 3.0A (3.5A 권장) | UBEC (5V 5A) 컨버터를 사용 - 배터리 전압을 5V로 강하하여 공급    |
|          | Arduino Mega 2560     | 7~12V (VIN 단자)
5V (USB/5V 단자)  |                   | UBEC (5V 5A) 컨버터를 사용 - 배터리 전압을 5V로 강하하여 공급    |
|          | STM32                 | 12V (→ DC 모터)
3.3V (← Arduino) |                   |                                               |
| Actuator | 구동 모터 [JGB37-520]     | 12V DC                         |                   | 4채널 엔코더 모터 드라이버를 통해 배터리 전압 11.1V를 직접 공급 받아 구동 |
|          | 조향 서보 모터 [LD-1501MG]  | 6.0V ~ 7.4V                    |                   | XL4015 벅 컨버터를 통해 배터리 전압을 6.5~7V로 강압하여 단독 공급   |
| Sensor   | 2D LiDAR [RPLiDAR A1] | 5V                             | 600mA(구동 시)       |                                               |
|          | HC-SR04               | 5V                             |                   | 아두이노 5V 라인 공유                                 |
|          | Camera Module v2      | 3.3V                           |                   | 라즈베리파이 CSI 포트로부터 3.3V 전원 공급 받음                |


| **전압 레벨**       | **해당 부품**                   | **공급 장치**            |
| --------------- | --------------------------- | -------------------- |
| **11.1V (Raw)** | 모터 드라이버 (구동용), 컨버터 입력       | 배터리 직결 (XT60 Y 케이블)  |
| **6.0~7.4V**    | 조향 서보 모터 (LD-1501MG)        | XL4015 Step-Down 컨버터 |
| **5.0V**        | 라즈베리파이, 아두이노, LiDAR, 초음파 센서 | UBEC (5V 5A) 컨버터     |
| **3.3V**        | STM32                       | Arduino Digital PIN  |

- 공통 그라운드 (GND)
	- 배터리, 컨버터, 라즈베리파이, 아두이노, 모터 드라이버의 모든 GND는 하나로 묶어야 신호 노이즈 발생 X
- 전류 용량
	- UBEC 5A 용량은 라즈베리파이(3A)와 LiDAR(0.6A), 아두이노 및 센서류를 모두 감당하기 충분
	- 단, 배선 시 전압 강하가 일어나지 않도록 두꺼운 와이어 사용
- 안전 장치
	- 20A 토글 스위치와 퓨즈를 배터리에 직렬로 연결 → 과전류 발생 시 시스템 보호

### Software Message Interface (ROS 2 Topics)


ROS 2 네트워크 상에서 노드들이 주고받는 데이터 패킷 규격


| **토픽 이름 (Topic)**      | **발행자 (Publisher)**  | **구독자 (Subscriber)** | **메시지 타입 (Message Type)**  | **설명 (Description)**                 |
| ---------------------- | -------------------- | -------------------- | -------------------------- | ------------------------------------ |
| **`/cmd_vel`**         | `autonomous_node`    | `serial_bridge_node` | `geometry_msgs/Twist`      | 계산된 차량의 선속도(x축)와 각속도(z축 조향각) 명령      |
| **`/scan`**            | `lidar_node`         | `autonomous_node`    | `sensor_msgs/LaserScan`    | 360도 2D 라이다 거리 및 각도 배열 데이터           |
| **`/image_raw`**       | `camera_node`        | `autonomous_node`    | `sensor_msgs/Image`        | 원본 프레임 이미지 배열 (OpenCV 처리용)           |
| **`/ultrasonic_data`** | `serial_bridge_node` | `autonomous_node`    | `std_msgs/Int32MultiArray` | 4방향(전/후/좌/우) 초음파 센서의 거리 값 (cm 단위 배열) |


---


---


---


---


---


---


### [SAD V5.0] 시스템 아키텍처 상세 기술


### 1. 계층별 역할 정의 (Functional Layers)

- **대뇌 계층 (Raspberry Pi 4): 전략적 판단**
	- **입력:** LiDAR(공간 스캔), Camera(차선 및 객체 인식).
	- **처리:** ROS 2 기반 SLAM/Navigation. 전체적인 주행 경로를 계산합니다.
	- **출력:** STM32로 `cmd_vel`(목표 속도, 조향각) 패킷을 USB Serial로 전송합니다.
- **실행 계층 (STM32F407 통합 보드): 정밀 구동**
	- **입력:** RPi로부터의 주행 명령, 자체 IMU(기울기/방향), 구동 모터 엔코더.
	- **처리:** 168MHz 고속 연산을 통한 PID 속도 제어 및 조향 PWM 생성.
	- **출력:** 2개의 JGB37 구동 모터 및 1개의 LD-1501MG 조향 서보 제어.
- **안전 계층 (Arduino Mega): 반사 신경 (Reflex)**
	- **입력:** 12채널 HC-SR04 초음파 센서 (360도 전방위 감시).
	- **처리:** 각 센서의 거리를 비동기로 측정하여 실시간 장애물 유무 판별.
	- **출력 1 (Safety):** 장애물 10cm 이내 감지 시 **STM32의 하드웨어 인터럽트 핀(PA5 등)으로 즉시 HIGH 신호 송신.**
	- **출력 2 (Data):** RPi로 장애물 거리 데이터를 전송하여 지도에 반영(Costmap update).

### 2. 데이터 통신 및 신호 흐름 (Signal Topology)

1. **USB Serial (High-Level):** RPi ↔ STM32 (주행 명령 및 오도메트리 데이터 교환).
2. **USB Serial (Monitoring):** Arduino ➔ RPi (초음파 거리 데이터 전송).
3. **E-Stop Discrete Line (Emergency):** **Arduino ➔ STM32 (강제 정지 신호).** * 이 선은 아두이노(5V)에서 STM32(3.3V)로 가므로 **[1kΩ+2kΩ] 전압 분배 저항**이 필수입니다.
	- STM32는 이 핀에 신호가 들어오는 순간 소프트웨어의 모든 주행 루프를 중단하고 모터를 정지시킵니다.

### 3. 전원 아키텍처 (Power Distribution)

- **메인 소스:** 11.1V 3S Li-Po 배터리.
- **STM32 구역:** 11.1V 직결 (모터 및 내부 로직용).
- **RPi & Arduino 구역:** `5V 6A UBEC`를 통해 5V로 강하 후 두 보드에 병렬 공급.
- **서보모터 구역:** STM32 보드 내장의 5V 서보 전용 포트 활용 + XL4015 전원 공급

---

