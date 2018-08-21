#######################################################
# 대학교 위치 표시
#######################################################


#  CSV파일 읽어오기 Uuniversity.csv













data = read.csv("university.csv")

# 앞에서 6개 행 확인하기 











head(data)

# data 의 변수명을 각각 "uni", "X", "Y" 로 변경하세요













colnames(data) = c("uni", "X", "Y")

# ggplot2와 ggmap 로드하기 (이미 설치된 컴퓨터)











library(ggplot2)
library(ggmap)

# map 변수에 seoul 지도 넣기 , 줌은 11 , 타입은 watercolor















map = get_map("seoul", zoom = 11, maptype = "watercolor")

# 지도 그리기 












ggmap(map)

# 지도 위에 학교별 이름 색 바꾸어 map2로 새변수 생성후 그리기












map2 = ggmap(map) + 
  geom_point(data = data,
             aes(x = Y, y = X, color = factor(uni)), size = 3)

map2

# 점들에 학교명 넣기










map2 + geom_text(data = data,
                 aes(x = Y+0.01, y = X+0.01, label = uni),
                 size = 3) 

# 점들에 학교명 넣고 범주제목 "대학교명"으로 변경하기











map2 + geom_text(data = data,
                 aes(x = Y+0.01, y = X+0.01, label = uni),
                 size = 3) +
  scale_color_discrete(name = "대학교명")




