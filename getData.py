import csv
import pageviewapi
import mwviews
import json
import datetime
from mwviews.api import PageviewsClient
import pandas
import pandas_datareader as web
import ystockquote
from pprint import pprint

yesterday = str((datetime.datetime.now() - datetime.timedelta(2)).strftime("%Y%m%d"))


print('Yesterday was', yesterday)
pageViews = PageviewsClient('shivansh')

#FOR Iphone
pv = pageViews.article_views('en.wikipedia', 'IPhone', granularity='daily', start='20150701', end=yesterday)
print(pv)
print('Data points for IPhone: ', pv.__len__())

rawIphone = list(pv.items())

t = sorted(rawIphone)

out = open('Iphone.csv', 'w')

for i in t:
    d = datetime.datetime.strptime(str(i[0]), '%Y-%m-%d %H:%M:%S')
    row = d.strftime('%Y/%m/%d') + ',' + str(i[1]['IPhone']) + '\n'
    out.write(row);
out.close()

#For IPad
pv = pageViews.article_views('en.wikipedia', 'IPad', granularity='daily', start='20150701', end=yesterday)
print(pv)
print('Data points for IPad: ', pv.__len__())

rawIpad = list(pv.items())

t = sorted(rawIpad)

out = open('Ipad.csv', 'w')

for i in t:
    d = datetime.datetime.strptime(str(i[0]), '%Y-%m-%d %H:%M:%S')
    row = d.strftime('%Y/%m/%d') + ',' + str(i[1]['IPad']) + '\n'
    out.write(row);
out.close()

#For MacBook
pv = pageViews.article_views('en.wikipedia', 'MacBook', granularity='daily', start='20150701', end=yesterday)
print(pv)
print('Data points for MacBook: ', pv.__len__())

rawMacBook = list(pv.items())

t = sorted(rawMacBook)

out = open('MacBook.csv', 'w')

for i in t:
    d = datetime.datetime.strptime(str(i[0]), '%Y-%m-%d %H:%M:%S')
    row = d.strftime('%Y/%m/%d') + ',' + str(i[1]['MacBook']) + '\n'
    out.write(row);
out.close()

#For Samsung
pv = pageViews.article_views('en.wikipedia', 'Samsung', granularity='daily', start='20150701', end=yesterday)
print(pv)
print('Data points for Samsung: ', pv.__len__())

rawSamsung = list(pv.items())

t = sorted(rawSamsung)

out = open('Samsung.csv', 'w')

for i in t:
    d = datetime.datetime.strptime(str(i[0]), '%Y-%m-%d %H:%M:%S')
    row = d.strftime('%Y/%m/%d') + ',' + str(i[1]['Samsung']) + '\n'
    out.write(row);
out.close()

#For prediction
yesterday = str((datetime.datetime.now() - datetime.timedelta(1)).strftime("%Y%m%d"))
print(yesterday)

#IPhone
pv = pageViews.article_views('en.wikipedia', 'IPhone', granularity='daily', start='20170417', end='20170417')
t = list(pv.items())
print(str(t[0][1]['IPhone']))
text_file = open("IPhone1.txt", "w")
text_file.write(str(t[0][1]['IPhone']))
text_file.close()

#IPad
pv = pageViews.article_views('en.wikipedia', 'IPad', granularity='daily', start='20170417', end='20170417')
t = list(pv.items())
print(str(t[0][1]['IPad']))
text_file = open("IPad1.txt", "w")
text_file.write(str(t[0][1]['IPad']))
text_file.close()

#MacBook
pv = pageViews.article_views('en.wikipedia', 'MacBook', granularity='daily', start='20170417', end='20170417')
t = list(pv.items())
print(str(t[0][1]['MacBook']))
text_file = open("MacBook1.txt", "w")
text_file.write(str(t[0][1]['MacBook']))
text_file.close()

#Samsung
pv = pageViews.article_views('en.wikipedia', 'Samsung', granularity='daily', start='20170417', end='20170417')
t = list(pv.items())
print(str(t[0][1]['Samsung']))
text_file = open("Samsung1.txt", "w")
text_file.write(str(t[0][1]['Samsung']))
text_file.close()