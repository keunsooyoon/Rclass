#######################################################
# 대학교 위치 표시
#######################################################


#  CSV파일 읽어오기 Uni.csv













data = read.csv("uni.csv")

# 앞에서 6개 행 확인하기 











head(data)

# data 의 변수명을 각각 "uni", "address", "X", "Y", "Xk","Yk" 로 변경하세요













colnames(data) = c("uni", "address", "X", "Y", "Xk","Yk" )

# 뷰어창에서 데이터 확인











View(data)

# 데이터의 속성확인















str(data)

# 데이터의 결측지 확인










is.na(data)

# 결측지 빈도 확인









table(is.na(data))

# select 함수를 사용하기 위한 패키지를 설치하고 1,3,4 열만 data2라는 이름으로 만드세요.












library(dplyr)
data2 = data %>% 
  select(uni, X, Y)

# select 함수를 사용하여 data에서 Xk와 Yk 열을 제외 하고 data3 을 새로 만드세요











data3 = data %>% 
  select(-Xk, -Yk)

# data3을 address 오름차순 정렬









data3 %>% 
  arrange(address)

#data3을 uni를 기준을 내림차순 정렬










data3 %>%  
  arrange(desc(uni))

# data2에 mutate함수를 사용하여 Xk, Yk 열의 값을 합하여 XYk라는 열을 만들어 data4를 생성하세요









data4 = data2 %>% 
  mutate(XYK = Xk + Yk)

# data4의 XYK열의 값이 850000이상이면 pass 아니면 fail로 새로운 test 열을 만들어 data5 로 생성하세요. 










data5 = data4 %>% 
  mutate(test = ifelse(XYK >= 850000, "pass", "fail"))

# 간단히 그림으로 대략 확인 할때 사용하는 함수를 사용하여 그림을 그려보세요.








 

qplot(data5$test)

# data5의 결측치를 확인하세요.













is.na(data5)

# 결측치의 빈도를 출력하세요
















table(is.na(data5))

# 결측치를 모두 한번에 제거하여 data6를 생성하세요













data6 = na.omit(data5)

# data6의 결측지를 빈도로 확인하세요













table(is.na(data6))

# data6에서 test열의 값이 fail 인 행들만 추출하세요










data6 %>% 
  filter(test == "fail")

# data6에서 test가 fail이 아니고 Xk값이 310000미만이고 Yk값이 500000이상인 행들만 추출하세요









data6 %>% 
  filter(test != "fail" & Xk < 310000 & Yk >= 500000)

# data6에서 Xk와 Yk열만 추출하세요








data6 %>% 
  select(Xk, Yk)

# data2의 결측치를 모두 한번에 제거하여 unidata를 생성하세요













unidata = na.omit(data2)

# ggplot2와 ggmap 로드하기 (이미 설치된 컴퓨터)











library(ggplot2)
library(ggmap)


#  기본 지도 그리기 seoul 지도  , 줌은 11 , 타입은 roadmap












ggmap(get_map("seoul", zoom = 11, maptype = "roadmap"))

# unidata를 사용하여 지도 위에 학교 위치 그리기  크기는 3













ggmap(get_map("seoul", zoom = 11, maptype = "roadmap")) +
  geom_point(data = unidata,
             aes(x = X, y = Y), 
             size = 3)

# unidata를 사용하여 지도 위에 학교 위치 그리기  크기는 3 , 맵타입을 watercolor 변경
# 학교 이름 넣기 












ggmap(get_map("seoul", zoom = 11, maptype = "watercolor")) +
  geom_point(data = unidata,
             aes(x = X, y = Y), 
             size = 3) +
  geom_text(data = unidata,
            aes(x = X, y = Y + 0.005, label = uni),
            size = 2.8)

# 범주 표시하기















ggmap(get_map("seoul", zoom = 11, maptype = "watercolor")) +
  geom_point(data = unidata,
             aes(x = X, y = Y, color = factor(uni)),
             size = 3) +
  geom_text(data = unidata,
            aes(x = X, y = Y + 0.005, label = uni),
            size = 2.8)

# 범주제목 "대학교명"으로 변경하기











ggmap(get_map("seoul", zoom = 11, maptype = "watercolor")) +
  geom_point(data = unidata,
             aes(x = X, y = Y, color = factor(uni)),
             size = 3) +
  geom_text(data = unidata,
            aes(x = X, y = Y + 0.005, label = uni),
            size = 2.8) +
  scale_color_discrete(name = "대학교명")




