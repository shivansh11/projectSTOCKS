import datetime
from mwviews.api import PageviewsClient

pageViews = PageviewsClient('shivansh')
#For prediction
yesterday = str((datetime.datetime.now() - datetime.timedelta(1)).strftime("%Y%m%d"))
print(yesterday)

#IPhone
pv = pageViews.article_views('en.wikipedia', 'IPhone', granularity='daily', start=yesterday, end=yesterday)
t = list(pv.items())
print(str(t[0][1]['IPhone']))
text_file = open("IPhone1.txt", "w")
text_file.write(str(t[0][1]['IPhone']))
text_file.close()

#IPad
pv = pageViews.article_views('en.wikipedia', 'IPad', granularity='daily', start=yesterday, end=yesterday)
t = list(pv.items())
print(str(t[0][1]['IPad']))
text_file = open("IPad1.txt", "w")
text_file.write(str(t[0][1]['IPad']))
text_file.close()

#MacBook
pv = pageViews.article_views('en.wikipedia', 'MacBook', granularity='daily', start=yesterday, end=yesterday)
t = list(pv.items())
print(str(t[0][1]['MacBook']))
text_file = open("MacBook1.txt", "w")
text_file.write(str(t[0][1]['MacBook']))
text_file.close()

#Samsung
pv = pageViews.article_views('en.wikipedia', 'Samsung', granularity='daily', start=yesterday, end=yesterday)
t = list(pv.items())
print(str(t[0][1]['Samsung']))
text_file = open("Samsung1.txt", "w")
text_file.write(str(t[0][1]['Samsung']))
text_file.close()