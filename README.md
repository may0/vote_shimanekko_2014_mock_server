# [ゆるキャラグランプリ2014](http://www.yurugp.jp/)
の投票受付をするモックサーバーです

####しまねっこ投票アプリ側の設定
1. *configs.sample* を  
*configs* にリネームし、  
email@example.com:password:ユーザエージェント
の書式でアカウント情報を書き込みます。
複数行書き込むことができます

3. しまねっこ投票アプリのvote.rb内の32,33,34行目を下のように変更します。
 変更前
  32行目 start_page = account[:agent].get('http://www.yurugp.jp/vote/detail.php?id=00000021')
  33行目 vote_page = account[:agent].submit(start_page.forms[0])
  34行目 vote_form = vote_page.forms[0]

 変更後
  32行目 start_page = account[:agent].get('http://localhost:4567/vote')
  33行目 # vote_page = account[:agent].submit(start_page.forms[0])
  34行目 vote_form = start_page.forms[0]



####モックサーバー側の設定
1.  *configs.sample* を
*configs* にリネームし、
しまねっこ投票アプリの*configs*に書いたのと同様の
emailとpassword(アカウント情報)を
email@example.com:password
の書式で書き込みます。

2. ターミナルを立ち上げ、このファイルのあるディレクトリの一つ下のsinatraディレクトリまで移動します

3. ターミナルで「bundle exec ruby main.rb」を実行します。


両方の設定が終わったらしまねっこ投票アプリ(vote.app)を起動します

しまねっこ投票アプリのlog/に実行結果サマリが出力されます。
投票が終わった後にcontrol + cでモックサーバーを切ります。
モックサーバーを切るとsinatraディレクトリ内のlog/に投票したアカウントが出力されます。

####課題
切らないとlog/がでないし、この考え方であっているのかわからないのですが、
このあとこのlogを使ってすでに投票したアカウントの場合は投票済みですというresultをかえせるように出来たらいいなと思ってます。