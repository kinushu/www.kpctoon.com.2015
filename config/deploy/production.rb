
role :web, ENV['PROD_WWW_SERVER'], user: ENV['PROD_WWW_USER']

# コマンド実行時にsudoをつけるか
set :use_sudo, false

# デプロイ先ディレクトリ
set :deploy_to, ENV['PROD_WWW_FOLDER']
