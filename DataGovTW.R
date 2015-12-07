# 政府資料開放平臺資料集
# Contributer: Rafe. C. H. Liu (snexuz@gmail.com)
# Website: http://www.idealyzt.com/
# Last update: 2015/12/07

# 示範資料：
# 政府資料開放平臺資料集瀏覽及下載次數統計
# http://data.gov.tw/node/8693

# (1) .csv
url <- 'http://data.gov.tw/iisi/logaccess/2877?dataUrl=http://file.data.gov.tw/event/dataset.csv&ndctype=CSV&ndcnid=8693'
y <- read.csv(url, sep = ",", stringsAsFactors = F, header = T)
head(y)

# (2) XML 
library(XML)
url <- 'http://data.gov.tw/iisi/logaccess/2879?dataUrl=http://file.data.gov.tw/event/dataset.xml&ndctype=XML&ndcnid=8693'
x <- xmlParse(url) # 以 xmlParse 解析 XML 檔案
xmlfiles <- xmlRoot(x) # 將 root 設定到 content 層級（一個偷吃步的做法）
y <- xmlToDataFrame(xmlfiles) # 轉換成 dataframe

# (3) json files
library(jsonlite)
url <- 'http://data.gov.tw/iisi/logaccess/2878?dataUrl=http://file.data.gov.tw/event/dataset.json&ndctype=JSON&ndcnid=8693'
y <- fromJSON(url, flatten = TRUE)
y <- as.data.frame(y$Records)

# 將整理完成的檔案存成 CSV
write.csv(file = 'open.csv', y, fileEncoding = 'big5')
