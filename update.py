import pageviewapi
import mwviews
import datetime
from mwviews.api import PageviewsClient
import ystockquote
from pprint import pprint

p = PageviewsClient('shivansh')

today = str(datetime.datetime.now().strftime("%Y%m%d"))
print (today)
#print(p.article_views('en.wikipedia', 'IPhone', granularity='daily', start='20160201', end=today))

pprint(ystockquote.get_historical_prices('AAPL', '2013-01-03', today))

