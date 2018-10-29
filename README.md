# README

環境インストール
```
#必要なインストールファイルをダウンロード
#ruby install
#インストール後、立ちあがったcommand promptに1を選択

https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-2.4.4-2/rubyinstaller-devkit-2.4.4-2-x64.exe


#nodejs install
https://nodejs.org/dist/v8.12.0/node-v8.12.0-x64.msi

#CMD検証
ruby -v
node -v

C:\user>ruby -v
ruby 2.4.4p296 (2018-03-28 revision 63013) [x64-mingw32]

C:\user>node -v
v8.11.3

gem install rails
rails new tci_cn_website

cd path\to\tci_cn_website
```

editorでtci_cn_websiteにあるGemfileを編集

```
#追加
gem 'sassc-rails'
gem 'haml-rails'
gem 'jquery-rails'

#bundle install実行
CMD
cd path/to/tci_cn_website
bundle install
#サーバーを起動
rails s

#ブラウザでアクセス、デフォルトポートは3000
localhost:3000
```


```
Railsはデフォルトでassetフォルダーの下にあるjavascriptとstylesheetファイルを全部includeするため、
個別で読み込みしたい場合は以下を修正する

config\initializers\assets.rb各JSとCSSファイルを記入する

#Rails.application.config.assets.precompile += %w( home.js)
↓
Rails.application.config.assets.precompile += %w( home.js home.css news.js news.css)
↓
あるフォルダーのしたにあるファイルをすべて読み込みたい場合
Rails.application.config.assets.precompile += %w( home/* news/*)

app\assets\javascripts\application.jsにデフォルトでincludeするJSを記載
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery ←JQueryを利用する場合追記
//= require jquery_ujs ←JQueryを利用する場合追記
//= require_tree . ←デフォルトでassetフォルダーにあるファイルをすべて読み込み、個別で読み込みたいときには // require_tree .に変更

#個別でjsを読み込み場合は、ページに↓を追記、"home"はjsファイル名(下記はhamlの記法)
= javascript_include_tag "home"

#自動的にAction毎でcssを読み込みたい場合はlayoutファイルに↓追加
<%= stylesheet_link_tag    "#{controller_name}/#{action_name}", media: 'all', 'data-turbolinks-track': 'reload' %>
```
