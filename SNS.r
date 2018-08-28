 
sessionInfo()



####################      Twitter      ###########################

# 1. Twitter 회원 가입  www.twitter.com
# 2. 개발자 회원 인증   apps.twitter.com
# 3. 개발 앱 등록 ( 키 4개 받기 )


# Consumer API keys
# ftrMLRoVfJyVHTyf8QGfvgONM (API key)
# NYmToEDywkjTQHGjt7QRJHLbMibtohzuRi4YH99DL9IV9CE39q (API secret key)

# Access token & access token secret
# 1033992224910893056-VqDAc7oF84iM5CK3VkvQ1UqSuLNizs (Access token)
# fgVD5n0zSk2LmpKYLLNeuR5euKKKCTnJywS9vKl5ATQSz (Access token secret)



install.packages("RCurl")
install.packages("base64enc")
install.packages("twitteR")
install.packages("ROAuth")

library(RCurl)
library(base64enc)
library(twitteR)
library(ROAuth)

options(httr_oauth_cache = T)


reqURL = "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/accsess_token"
authURL = "https://api.twitter.com/oauth/authorize"


consumerKey = "Wrvk55GZAR1lfbT2GpAqDeYQh"
consumerSecret = "JGrbkBczMWcgkzeIN6AEx2UqpuXqDwpaITRGqX75DcbZ4ZAjen"
accesstoken = "1033992224910893056-3TVwvrkxMc0sJzRyPen10M3hPEa95u"
accesstokensecret = "sjtvlX8n0qDKyJm1s4tZOdF5HSEH45VeB555xopWtidHX"



options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
download.file(url="https://curl.haxx.se/ca/cacert.pem", destfile = "carcert.pem")
setup_twitter_oauth(consumerKey, consumerSecret, accesstoken, accesstokensecret)


string = enc2utf8("축구")

tweets = searchTwitter(string, n = 300, lang="ko", retryOnRateLimit = 10000)
tweets
text_extracted = sapply(tweets, function(t) t$getText())
text_extracted




# 트위터 크롤링 추가 문법

#인증이 잘 되었는지 확인

getCurRateLimitInfo()

## 트위터에서 키워드로 특정 트윗들을 검색하여 가져오기

#retryOnRateLimit - 부하가 걸리면 몇번 정도 재시도할지 체크



string = enc2utf8("너의 결혼식")

tweets = searchTwitter(searchString = string, n = 10, lang="ko", retryOnRateLimit = 10000 )

tweets



# 불필요한 기호 등 삭제

text_extracted = sapply(tweets, function(t) t$getText())

text_extracted




## 불필요한 글자 삭제

tweets_df = twListToDF(tweets)

tweets_df$text




## 겹치는 것은 없애고싶다면?

text_extracted = unique(text_extracted)




## 한글로 여러개의 키워드가 들어간 것을 찾고싶다면??

string = enc2utf8("한국+베트남")  # 한글 검색

tweets = searchTwitter(searchString = string, n = 100)




# 영어로 된 데이터 분석

tweets = searchTwitter(searchString = 'korea+love', n = 100)

tweets




#보기좋게

tweets = unlist(tweets) 

str(tweets)


# 특정 글자 삭제 

tweets = gsub("사랑","",tweets)


# 
tweets = table(tweets)


















####################      Facebook      ###########################

# 1. Facebook 회원 가입  www.facebook.com
# 2. 개발자 회원 인증   developers.facebook.com/tools/explorer
# 3. 개발 앱 등록



# User Token	
# EAAZA3Anxs6hoBAIZApSm7nYBXWrKZAJ4F6ysqtXZAmfKZBjHxDy00dr9NMjbWvOHmwWTvjsRUGt9zskD6QitaXZApJZC5uoCbuPVOY57ZC2wlHW2AQusC6JNXm3i4oDkNhkNM9MRtm2XF789a4nv18ExWkJQKoKO24hZA4fmGpe7B5lRZAY42T9FbNG1JIFQ6lVufZBpB8iNinSoAZDZD

# App Token	
# 1819702421416474|8jr5mYJQyK5PGuhxKAtwLAlO2ZQ






########################################################




install.packages("Rfacebook")
library(Rfacebook)

fb_oauth<-fbOAuth(app_id="1819702421416474", app_secret="79ede651b532d6d584e54cb16580375e",extended_permissions = TRUE)


token = "EAAZA3Anxs6hoBAEOW8mxvb51CjQULypIojTtw6L2ZB2KQVwDtAEvFUDWhzqSuZCKgXwj3QPwYIoJZBRo1FZB6yu3rh2542HZCQBwnyfAYK50mY9PVgQ4waEtDqMgCa3SzeMAUPQuTWIV8k0I9B0w6PdHx0RiYIyI9ZBQBSatTvjLl59eZAmntTN4IdwgCkn9UHvrVlzYrbCBNlGRCCtOqlWZAPi2Fh460NIXMSx5zpzzvRAZDZD"




facebook.me = getUsers("me", token, private_info = TRUE)
facebook.likes = likes <- getLikes("me",token=token)

facebook.data
facebook.likes

var1 <- getPage(page = "Insightnews.page", token=token, n = 100,since='2018/01/01',until='2018/05/15')
head(var1,1)

post<- getPost(var1$id[1], token=token, n.comments=1000, likes=FALSE)
head(post,1)




