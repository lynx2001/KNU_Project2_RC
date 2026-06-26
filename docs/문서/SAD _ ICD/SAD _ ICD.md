# SAD / ICD


# System Architecture Document


**시스템 아키텍처 설계서**


## Physical Architecture


**[4.0]**


[Interface_Control_Document.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6736ff59-6c24-4b04-b554-f9dbc0e1ca7b/Interface_Control_Document.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=8175287ca3a6bf9014b428f7f400b6c397c946a7dd7f4ac5d8db25f4085e35ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[3.0]**


[Interface_Control_Document.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ad8b3093-1957-4c32-8623-bdc57577dd6e/Interface_Control_Document.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=2704cecfb2d0ee9d10580e5f160977a1c8f3a0f0560e3dabd0326170d298ac16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[2.0]**


[Untitled.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/47cb5423-098f-482e-971e-1d79d5b34f98/Untitled.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=9aae22c3174249a71ac41182af64a8fe34ea96d56fe2184d7dbfe318edaf6b8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


**[1.0]**


[Untitled_2.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/80e8dcc9-7db0-4de3-8743-c160f15b96ba/Untitled_2.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=775f8e786ce5f010df0dfb8ee0cc4a6a377ad9230ba592e69b07e12c56a69db5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### Hardware Architecture


[System_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/5c88e28f-bad0-451e-bfae-e1ff612833cd/System_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=baeee35b58ff285baf580f77cefab0b1d088a044fe871fa93eb10bb296aa0e8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[System_Implementation.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7facaab4-a303-4fae-9ac6-6f607ca752d4/System_Implementation.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=c13de4ad257c9644e8332e88cf0d4ebf76b0d1a5ba0992dbc1f21e3799158791&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Arduion_Mega_2560.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/13a64686-d858-483b-9a60-a334ae254269/Arduion_Mega_2560.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=87edb087181e4bab6018abbc728a5ffc85ed826c9b3f2148f46dfeb353824423&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[Raspberry_Pi_4.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/5cb27376-116a-4fa1-ba2b-41848a930985/Raspberry_Pi_4.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=4d12f61283504fbb0fb5e6734dfef73444699f918d26c1a39fd69e4542cb098e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


[System_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f1a1362f-7276-4e41-a72e-ff605ecb7913/System_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=f32226d6a294df8d5f049cfdbb2efe62fb749139d6d63041cfdcc029ec4bc87f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### Software Architecture


[Software_Architecture.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c18a4684-829a-4ba9-b090-65e001023c6a/Software_Architecture.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IVUQMRC%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDqVTBejt6iUAMJD7VBeRaZ0ax6aLwSyLOcbdq%2Fe0qXXQIgJW1N22qbRN%2Fjv812zRKswTWhqApZC85tTDM0drdFnR4q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDCj1SR9HS%2BxJqR5q1SrcA8jaaY0%2F1B2yi1udfjlGBWr6XldSFPgfPTwn1CmqcZaoC6iRfJUPJ6n%2FuRqGVioZuQEILV9bqWuUqQoUF9d%2FLRc4z0nYFPexlu4JyCwvvzUjY%2FOpo1KaQJgemNz9tRDbieB2rWTj0IWmXvGaZrrBdjQdkEcLwDxWweCLyEROw7kt903C4haJLbhLMODFDTLlUKfrry701kcQevE7iX5zzY69ZY7rea0cU6Oup39TX8YtekHMLXZdDGXqHlrZcbPJ0SSEITH77cIBmWctbo%2BBx%2FuUBkc9s3xFVj3s5RW1R6%2F8vNu%2FgNkLkypPGhzgXDXu0r1Zb6rU7X75TCAoU6U9EVFaGSmoXfOz9brDr6aUS8bpZaSxW%2BArbkZAWgc5rJ%2F%2BV%2FafGZ%2F0da38h3dsdRqFUCcakmkNAGkD2ZJZ0yUrV4rOc%2F%2BcjY3ISmcuqlyh424DNh%2FdbkWwEtM9BvRf6NhY%2BUAfNuy7bfDbcL0ESpGjQaYZzzfDt3fHLnNPRuwDPJZs%2B2TT8lFgy0utOtpQNMVN4J3cQqL2ObELbmCVv8MYgPw0HBLL8gdyFRP%2FAfg5ZMKzzyTgxLtoPPOHR7FazKv9dKL0RZv8Rzq706Dr6N3Dkq6hBM6FNaJPUM9WAHEMMPbN%2B9EGOqUBDv8%2F2UrLQ0SHSfvGcXmKx%2Bxm3gRmSZ57WG5leYcIrCaSkQna4V8ugkeMw34kkaljLaEf7yD902z78XDVNA3NPIebgLI594fpVUtEXD6FDDvULueqOOeHy%2FZ7%2BFs8H8Dj%2BWmgyQeyZlbpl38yzdCYxQGGagSDXA3TPkK5kG3NVRNK0z76KTAjdEFTpfCysZUgTnd7dl1KfE3Et82%2F9ui6a5lumxLG&X-Amz-Signature=5a64f753e40b505420da42bea5c1f82105c6f1a63c8567fe4138c1029de5f3fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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

