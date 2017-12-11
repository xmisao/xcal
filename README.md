# xcal

xcalは休日の色付き表示に対応したcal, ncalライクなカレンダーコマンドです。
カレンダーはカラフルに土曜日が青色、日曜日と休日が赤色で表示されます。

休日の情報は表示のたびにiCal(icsファイル)をダウンロードして取得します。
デフォルトではGoogleが提供するiCalを利用し日本の休日を表示します。
また任意のicsファイルを指定して休日を表示することもできます。

![xcal demo](https://raw.githubusercontent.com/xmisao/demos/master/xcal/xcal_demo.png)

## インストール

```
# gem install xcal
```

## 使い方

デフォルトで前後1ヶ月の3ヶ月分のカレンダーを表示します。(実際は色付きです)

```
$ xcal
   November 2017         December 2017          January 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                  1  2      1  2  3  4  5  6
 5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
26 27 28 29 30        24 25 26 27 28 29 30  28 29 30 31         
                      31                                        
```

`-l`オプションで休日の詳細を表示することができます。(iCalの`summary`を表示します)

```
$ xcal -l
   November 2017         December 2017          January 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                  1  2      1  2  3  4  5  6
 5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
26 27 28 29 30        24 25 26 27 28 29 30  28 29 30 31         
                      31                                        
2017-11-03 (Fr) 文化の日
2017-11-23 (Th) 勤労感謝の日
2017-12-23 (Sa) 天皇誕生日
2018-01-01 (Mo) 元日
2018-01-08 (Mo) 成人の日
```

`-9`オプションで前後4ヶ月の9ヶ月分のカレンダーを表示します。

```
$ xcal -9
     August 2017        September 2017          October 2017    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   8  9 10 11 12 13 14
13 14 15 16 17 18 19  10 11 12 13 14 15 16  15 16 17 18 19 20 21
20 21 22 23 24 25 26  17 18 19 20 21 22 23  22 23 24 25 26 27 28
27 28 29 30 31        24 25 26 27 28 29 30  29 30 31            
                                                                
   November 2017         December 2017          January 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                  1  2      1  2  3  4  5  6
 5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
26 27 28 29 30        24 25 26 27 28 29 30  28 29 30 31         
                      31                                        
   February 2018            March 2018            April 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
             1  2  3               1  2  3   1  2  3  4  5  6  7
 4  5  6  7  8  9 10   4  5  6  7  8  9 10   8  9 10 11 12 13 14
11 12 13 14 15 16 17  11 12 13 14 15 16 17  15 16 17 18 19 20 21
18 19 20 21 22 23 24  18 19 20 21 22 23 24  22 23 24 25 26 27 28
25 26 27 28           25 26 27 28 29 30 31  29 30               
```

環境変数`XCAL_ICS_URL`にicsファイルのURLを指定すると日本以外の休日を表示することもできます。
以下はアメリカ合衆国の休日のicsファイルを読み込ませてアメリカ合衆国のカレンダーを表示する例です。

```
$ export XCAL_ICS_URL=https://calendar.google.com/calendar/ical/ja.usa%23holiday%40group.v.calendar.google.com/public/basic.ics
$ xcal -9 -l
     August 2017        September 2017          October 2017    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   8  9 10 11 12 13 14
13 14 15 16 17 18 19  10 11 12 13 14 15 16  15 16 17 18 19 20 21
20 21 22 23 24 25 26  17 18 19 20 21 22 23  22 23 24 25 26 27 28
27 28 29 30 31        24 25 26 27 28 29 30  29 30 31            
                                                                
   November 2017         December 2017          January 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                  1  2      1  2  3  4  5  6
 5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
26 27 28 29 30        24 25 26 27 28 29 30  28 29 30 31         
                      31                                        
   February 2018            March 2018            April 2018    
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
             1  2  3               1  2  3   1  2  3  4  5  6  7
 4  5  6  7  8  9 10   4  5  6  7  8  9 10   8  9 10 11 12 13 14
11 12 13 14 15 16 17  11 12 13 14 15 16 17  15 16 17 18 19 20 21
18 19 20 21 22 23 24  18 19 20 21 22 23 24  22 23 24 25 26 27 28
25 26 27 28           25 26 27 28 29 30 31  29 30               
                                                                
2017-09-04 (Mo) Labor Day
2017-10-09 (Mo) Columbus Day (regional holiday)
2017-10-31 (Tu) Halloween
2017-11-05 (Su) Daylight Saving Time ends
2017-11-10 (Fr) Veterans Day observed
2017-11-11 (Sa) Veterans Day
2017-11-23 (Th) Thanksgiving Day
2017-12-24 (Su) Christmas Eve
2017-12-25 (Mo) Christmas Day
2017-12-31 (Su) New Year's Eve
2018-01-01 (Mo) New Year's Day
2018-01-15 (Mo) Martin Luther King Jr. Day
2018-02-14 (We) Valentine's Day
2018-02-19 (Mo) Presidents' Day
2018-03-11 (Su) Daylight Saving Time starts
2018-04-01 (Su) Easter Sunday
2018-04-13 (Fr) Thomas Jefferson's Birthday
```

## License

This software is distributed under the MIT license.
