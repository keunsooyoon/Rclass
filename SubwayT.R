##########################################################################
# 1 . 지하철 2, 3호선 구글맵에 표시하기 
##########################################################################

# 순서
# 1. 지하철 위치 표시된 데이터 가져오기 (subway.csv)
# 2. dplyr패키지를 사용하여 데이터 전처리 
# 3. get_map, ggmap, ggplot2를 사용하여 map에 표현하기 



# 지하철 위치 표시된 데이터 가져오기 (subway.csv)
# 패키지 설치 

# 1. ggmpa, ggplot2, dplyr 패키지들을 설치하세요. (이미 설치한 경우는 패스)







install.packages("ggplot2")
install.packages("dplyr")

# 패키지 로드
# 2. ggmpa, ggplot2, dplyr 패키지들을 설치하세요. 














library(ggplot2)
library(dplyr)

# 데이터 로드 
# 3. "subway.csv" 파일을 subway라는 이름으로 로드하세요. (헤더 있음)











subway = read.csv("subway.csv", header=TRUE)

# 4. subway의 복사본 data를 생성하세요.













data = subway

# 5. data 데이터의 앞부분 10개만 출력













head(data,10)

# 6. 데이터의 뒷부분 6개 출력










tail(data)

# 7. 뷰어창에서 데이터 확인











View(data)

# 8. 데이터 차원 출력












dim(data)

# 9. 데이터의 속성 확인 










str(data)

# 10. 데이터의 요약통계량 출력













summary(data)

# 11. data의 결측지를 확인해보세요.















is.na(data)

# 12. data의 결측지 빈도를 확인해보세요.











table(is.na(data))

# dplyr패키지를 사용하여 데이터 전처리 
# 필요한 열만 가져오기


# 13. 2,3,8,9 열만 가져오세요








data2 = data[,c(2,3,8,9)]

# 14. data2의 결측지를 확인해보세요.











is.na(data2)

# 15. data의 결측지 빈도를 확인해보세요.











table(is.na(data2))

# 16. data2 의 변수명을 각각 "station", "line", "X", "Y" 로 변경하세요













colnames(data2) = c("station", "line", "X", "Y")

# 17. data2 데이터의 앞부분 10개만 출력













head(data2,10)

# 18. 데이터의 뒷부분 6개 출력










tail(data2)

# 19. 뷰어창에서 데이터 확인











View(data2)

# 20. 데이터 차원 출력












dim(data2)

# 21. 데이터의 속성 확인 










str(data2)

# 22. 데이터의 요약통계량 출력









summary(data2)

# 23. data의 결측지를 확인해보세요.











is.na(data2)

# 24. data의 결측지 빈도를 확인해보세요.











table(is.na(data2))


# 25. data2에서 2호선만 추출하여 출력만하세요.











data2 %>%  filter(line == 2)

# 26. data2에서 2호선과 3호선만 추출하여 출력만하세요.












data2 %>%  filter(line == 2 | line == 3)

# 27. data2에서 3호선이 아닌 것만 추출하여 출력만하세요.














data2 %>%  filter(line != 3)

# 28. line 에서 1,3,5호선만 %in% 기호를 사용하여 추출하세요













data2 %>% filter(line %in% c(1,3,5))

# 2호선만 추출하기

# 29. line 에서 2 호선만 추출해서 line2로 만드세요.










line2 = data2 %>% filter(line == "2")

# 30. line2의 결측지를 확인해보세요.











is.na(line2)

# 31. data의 결측지 빈도를 확인해보세요.











table(is.na(line2))

# 32. line2의 X 의 평균을 구해보세요










mean(line2$X)

# 33. line2의 Y 의 최대값을 구해보세요










max(line2$Y)

# 34. line2 데이터의 앞부분 10개만 출력













head(line2,10)

# 35. 데이터의 뒷부분 6개 출력










tail(line2)

# 36. 뷰어창에서 데이터 확인











View(line2)

# 37. 데이터 차원 출력












dim(line2)

# 38. 데이터의 속성 확인 










str(line2)

# 39. 데이터의 요약통계량 출력









summary(line2)

# 40. ggmap 패키지를 설치하고 로드













install.packages("ggmap")
library(ggmap)

# 41. 지도 표시하기










ggmap(get_map(c(mean(line2$Y), mean(line2$X)), zoom = 11, maptype = "roadmap"))

# 42. 지도에 2호선 역위치 표시하기













ggmap(get_map(c(mean(line2$Y), mean(line2$X)), zoom = 11, maptype = "roadmap")) +
  geom_point(data = line2, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7)

# 1호선만 추출하기

# 43. line 에서 1호선만 추출하세요














line3 = data2 %>%  filter(line == "3")

# 44. line3의 결측지를 확인해보세요.











is.na(line3)

# 45. data의 결측지 빈도를 확인해보세요.











table(is.na(line3))

# 46. line3 데이터의 앞부분 10개만 출력













head(line3,10)

# 47. 데이터의 뒷부분 6개 출력










tail(line3)

# 48. 뷰어창에서 데이터 확인











View(line3)

# 49. 데이터 차원 출력












dim(line3)

# 50. 데이터의 속성 확인 










str(line3)

# 51. 데이터의 요약통계량 출력









summary(line3)

# 52. 지도 표시하기











ggmap(get_map(c(mean(line3$Y), mean(line3$X)), zoom = 11, maptype = "roadmap"))

# 53. 지도에 3호선 역위치 표시하기












ggmap(get_map(c(mean(line3$Y), mean(line3$X)), zoom = 11, maptype = "roadmap")) +
  geom_point(data = line3, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7)

# 54. 지도에 2. 3 호선 함께 표시하기 












ggmap(get_map(c(mean(line2$Y), mean(line2$X)), zoom = 11, maptype = "roadmap")) +
  geom_point(data = line2, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7,
             col = "green") +
  
  geom_point(data = line3, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7,
             col = "red") 

# 55. 지도에 2. 3 호선 함께 표시하고 역명 추가하기












ggmap(get_map(c(mean(line2$Y), mean(line2$X)), zoom = 11, maptype = "roadmap")) +
  geom_point(data = line2, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7,
             col = "green") +
  
  geom_point(data = line3, aes(x = Y, y = X),
             size = 2.5,
             alpha = 0.7,
             col = "red") +
  
  geom_text(data = line2,
            aes(x = Y, y = X + 0.005, label = station ),
            size = 2.8) + 
  
  geom_text(data = line3,
            aes(x = Y, y = X + 0.005, label = station ),
            size = 2.8)











