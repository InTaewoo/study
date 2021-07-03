import requests
from bs4 import BeautifulSoup

url = 'https://comic.naver.com/webtoon/weekday.nhn'
res = requests.get(url)
res.raise_for_status()

soup = BeautifulSoup(res.text, 'lxml')
#print(soup.title)
#print(soup.title.get_text())
#print(soup.a) #soup 객체에서 처음 발견되는 a element cnffur
#rint(soup.a.attrs) # a element의 속성 정보를 출력
#print(soup.a['href']) # a element 의 href 속성값 출력

#print(soup.find('a',attrs={'class' : 'Nbtn_upload'})) #class= 'Nbrn_upload'인 a element 를 찾아줘

#print(soup.find('li', attrs={'class' : 'rank01'})) 랭크1인 웹툰 가져오기
rank1 = soup.find('li', attrs={'class' : 'rank01'})
#print(rank1.a.get_text()) #text만 뽑기
# rank2 = rank1.next_sibling.next_sibling # 2등 . 1등에서 다음 꺼(자식)
# rank3 = rank2.next_sibling.next_sibling
# print(rank3.a.get_text())

#rank2 = rank1.find_next_sibling('li') # 이 방법이 더 수월
#print(rank2.a.get_text())
#rank3 = rank2.find_next_sibling('li')
#print(rank3.a.get_text())


ranks = rank1.find_next_siblings('li') # 전체값을 찾을때
for rank in ranks:
    print(rank.a.get_text())
