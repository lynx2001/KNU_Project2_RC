# SAD / ICD


# System Architecture Document


**시스템 아키텍처 설계서**


## Physical Architecture


**[4.0]**


[Interface_Control_Document.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6736ff59-6c24-4b04-b554-f9dbc0e1ca7b/Interface_Control_Document.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=9db33b3d174c911416a0080e41e38d110354ec4dfd83c98dfbea9a3eb4761ff2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[3.0]**


[Interface_Control_Document.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ad8b3093-1957-4c32-8623-bdc57577dd6e/Interface_Control_Document.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=9fe602a56f869c1be0fac579eddc8be3b6e114f574e703ab470e3ea42b992490&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[2.0]**


[Untitled.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/47cb5423-098f-482e-971e-1d79d5b34f98/Untitled.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=478639b7a9950b573409f861f20de0b26cad31207981ace2a1f2b6fe0f87f1c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[1.0]**


[Untitled_2.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/80e8dcc9-7db0-4de3-8743-c160f15b96ba/Untitled_2.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=ee4fef1bfadf488c5867e8b5d50e91fe06d8d7c7440ee7154344032db13e5566&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### Hardware Architecture


[System_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/5c88e28f-bad0-451e-bfae-e1ff612833cd/System_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=6bff45c23422c8af869d22c130521e5f602778ec0c9e55555197c78c6b8b8c2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[System_Implementation.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7facaab4-a303-4fae-9ac6-6f607ca752d4/System_Implementation.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=136f05eed3024634d0f00718c08bd3a09e9ed1384d2551b6dc354dc9a0b03b03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Arduion_Mega_2560.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/13a64686-d858-483b-9a60-a334ae254269/Arduion_Mega_2560.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=911bc0e8a571641856bcb89d326b40590fe6a01d0778e7ce9fd094d68b2fc691&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Raspberry_Pi_4.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/5cb27376-116a-4fa1-ba2b-41848a930985/Raspberry_Pi_4.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=4bd3c0665bc1edcf16968cd798aa2f756fa775304489da9fad22c82151709b6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[System_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f1a1362f-7276-4e41-a72e-ff605ecb7913/System_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=d5710771739a518dfc01732915da36707a1906a21ace70acc22e5ac2fb7de502&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### Software Architecture


[Software_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c18a4684-829a-4ba9-b090-65e001023c6a/Software_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ST5C4AH%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIB9gM2uNpc7M%2FVWaJ7d0xRHSpIOilwi9I3hD3VKmkodtAiEA%2BjSGyyqJSQb32BukTFRCMLIzzR2Tfz7VpmlycP%2BmJWQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEqRrHR3SWFIVA5niSrcA%2BmoSf5QcO4u6FtDEb6UIEMgFlyOewIK3XkGlkPm0zNe91DWV7iCgD5aMu27ObqqD4iet76L13vHEIPWc4EVTJ1dmASsp1Wy6bFTC8UKLgo%2FcA%2FMf8HLSOaqnHDmO2sStYhfXYAOmw4G8BGKC1V6%2Fw7m5tULHUTlfXywXrtuh2FosWskI3WZ4wxSaJKQu50xxWV%2FS6DyPw8fax6DSr6QJJYUEVSgw86ia15niIKEZ4H202sXRo48ldT2AZU33yyTKvjvL4Rj2cSeX5bxQFmKbvV19aRNVEXCZGuu80G5%2BgGHjKlb%2B1Nz7SqyhrE5cptdrLCMXSQ09vLYzk1EUtd4kzHimWB5R7ZJxLplqoKbwYUW2A7l70H1VoatDEBFRFMU1UspCq7AhIVyP2JF4b3g5PvkoLE2YckSHwKox9edx7v5l%2BUYBnu60jM2dio54ewC5juvfiEuDf5iw0mTh6A57WkactZpODSYSDSZ8axtgiSk8Bj2Zrhr424cyX7kWls2%2BRUurN6XQXF1y1VMwCPav9Wo%2BaaPrcuLjHkiZD2pEqF8gE50OUzO89r3s50ON9OmxsA9yQjBfkcqsN0Xy9TAd%2F3nZCMh2aHLhtSJjLMfh9wgHxrhvBTumburUfTCMMKY3NEGOqUBQ9Amx%2FQeUBiGA6UgRJcSD%2B%2BaMzD9xoIsPw8L09FcBB4F5nyzN8tjuWnlriIZiAaTgT%2FOH1xt8MO4352BT%2BJomW3wGpfv2xi%2FvqjZMAno1FWycyQLjIhV%2Bjn1g9bhWc7uLee46hkMJJNJekwKifN2jo8SvvHVTs3jUJ6dqTG7jFkMAlPS9ydFxpA0SsykLSq5lw6%2BClrYUfqDiqqtvnK8%2FdqjvtcN&X-Amz-Signature=823950a72df6a639299f5bc2a6be5a1ad8bcee087c3306ee3ccef4bbb5ea001d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[1.0]**

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

**[4.0]**

- **[Layer 1] 구동 (Actuators)**
	- **구동부:** JGB37-520 DC 모터 (후륜 구동), LD-1501MG 서보모터 (전륜 조향)
	- 11.1V Li-Po 배터리 → 20A 블레이드 퓨즈 → 30A 스위치 → STM32
	- (분기 1: 고전류) STM32 → 모터 드라이버 (11.1V 직결)
	- (분기 2: 정전압) STM32 → 5V 강하 → Raspberry Pi 4 & Arduino Mega 2560
	- (분기3) STM32 -> 8V 강하 -> 조향 서보모터
- **[Layer 2] 두뇌 / 척수 / 말단 (Computing & Control)**
	- **상위 제어기 (Raspberry Pi 4):** Ubuntu 22.04 기반 ROS 2 통신망 구축, 고부하 연산(비전, 라이다 처리) 및 자율주행 판단
	- **중위 제어기 (STM32):** 모터 PWM 신호 생성 / PID(초정밀 속도 제어) / 오도메트리 측정 (IMU 센서)
	- **하위 제어기 (Arduino Mega 2560):** 실시간성이 중요한 I/O 제어 (초음파 펄스 처리, 조향 서보모터, 하드웨어 인터럽트(AEB))
- **[Layer 3] 인지 (Sensors)**
	- **센서부:** RPLiDAR A1 (360도 스캔), Pi Camera V2 (차선 영상), HC-SR04 (근접 거리 측정)

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
| 11.1V 메인 전원    | STM32           | **Power**         | XT60 (수 → 암)          | 최대 30A의 시스템 메인 전력                  |
| Raspberry Pi 4 | Pi Camera V2    | **Data (Video)**  | 15-pin CSI-2          | 실시간 카메라 영상 스트리밍                    |
| RPLiDAR A1     | Raspberry Pi 4  | **Data (Serial)** | USB 3.0 포트            | 115200 bps 시리얼 데이터 (Point Cloud)   |
| Raspberry Pi 4 | Arduino Mega    | **Data (Serial)** | USB 2.0 (Type A to B) | 제어 명령 및 초음파 센서 패킷 교환               |
| STM32          | JGB37-520 (모터)  | **Signal (PWM)**  | Digital PWM (M1, M2)  | 0~255 스케일의 전진/후진 속도 제어 신호          |
| STM32          | LD-1501MG (서보)  | **Signal (PWM)**  | Digital PWM (J2)      | 0~180도 스케일의 조향 제어 신호               |
| Arduino Mega   | HC-SR04         | **Signal (GPIO)** | Digital I/O (핀 22~29) | 10us HIGH 펄스 (Trig) 및 응답 시간 (Echo) |


|          |                       | 전압 (입력/출력)                    | 전류                | 비고                                                   |
| -------- | --------------------- | ----------------------------- | ----------------- | ---------------------------------------------------- |
| Battery  | 11.1V 5000mAh 3S LiPo | 11.1V (완충 시 12.6V)            |                   | XT60 커넥터를 통해 STM32로 공급                               |
| 제어 및 연산부 | Raspberry Pi 4        | 5V DC                         | 최소 3.0A (3.5A 권장) | STM32: 배터리 전압을 5V로 강하하여 공급                           |
|          | Arduino Mega 2560     | 7~12V (VIN 단자)
5V (USB/5V 단자) |                   | STM32 → RPi → Arduino                                |
|          | STM32                 | 12V (→ DC 모터)                 |                   |                                                      |
| Actuator | 구동 모터 [JGB37-520]     | 12V DC                        |                   | STM32의 4채널 엔코더 모터 드라이버를 통해 배터리 전압 11.1V를 직접 공급 받아 구동 |
|          | 조향 서보 모터 [LD-1501MG]  | 6.0V ~ 7.4V                   |                   | STM32를 통해 배터리 전압을 6.5~7V로 강압하여 단독 공급                 |
| Sensor   | 2D LiDAR [RPLiDAR A1] | 5V                            | 600mA(구동 시)       |                                                      |
|          | HC-SR04               | 5V                            |                   | 아두이노 5V 라인 공유                                        |
|          | Camera Module v2      | 3.3V                          |                   | 라즈베리파이 CSI 포트로부터 3.3V 전원 공급 받음                       |


| **전압 레벨**       | **해당 부품**                   | **공급 장치**                  |
| --------------- | --------------------------- | -------------------------- |
| **11.1V (Raw)** | 모터 드라이버 (구동용)               | 배터리 직결 (XT60)              |
| **6.0~7.4V**    | 조향 서보 모터 (LD-1501MG)        | STM32의 SERVO 핀 (J2)        |
| **5.0V**        | 라즈베리파이, 아두이노, LiDAR, 초음파 센서 | STM32의 5V OUT (C type USB) |

- 공통 그라운드 (GND)
	- 배터리, 컨버터, 라즈베리파이, 아두이노, 모터 드라이버의 모든 GND는 하나로 묶어야 신호 노이즈 발생 X
- 전류 용량
	- STM32 5V OUT pin :: 라즈베리파이(3A)와 LiDAR(0.6A), 아두이노 및 센서류를 모두 감당하기 충분
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

