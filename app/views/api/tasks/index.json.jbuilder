# json.set! 属性をまとめられる
json.set! :tasks do
  # json.array! 全てのインスタンスが、配列に格納されたJSON形式の文字列のデータで返却する
  json.array! @tasks do |task|
    # json.extract! 第一引数に指定したインスタンス変数のデータをJSON形式の文字列で返却
    json.extract! task, :id, :name, :is_done, :created_at, :updated_at
  end
end
