from re import A
import requests
from bs4 import BeautifulSoup

url = 'https://comic.naver.com/webtoon/list.nhn?titleId=675554'
res = requests.get(url)
res.raise_for_status()



soup = BeautifulSoup(res.text, 'lxml')
#cartoons = soup.find_all('td',attrs={'class':'title'})
# title = cartoons[1].a.get_text()
# link = cartoons[0].a['href']
# print(title)
# print('https://comic.naver.com'+link)

# 만화제목 + 링크가져오기
# #for cartoon in cartoons :
#     title = cartoon.a.get_text()
#     link = 'https://comic.naver.com'+ cartoon.a['href']
#     print(title, link)

#평점구하기
total_rates = 0
cartoons = soup.find_all('div',attrs={'class':'rating_type'})
for cartoon in cartoons :
    rate = cartoon.find('strong').get_text() #처음 나오는 'strong'의 값 출력
    print(rate)
    total_rates += float(rate)
print(f'전체 점수 : {total_rates:.2f}')
print(f'평균 점수 : {total_rates/len(cartoons):.2f}')