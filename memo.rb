
require "csv"

puts '1(新規でメモを作成）2(既存のメモを編集）'
input = gets.chomp

if input == "1"
    puts '拡張子を除いたファイル名を入力してください'
    file_name = "#{gets.chomp}.csv"

    puts "メモしたい内容を記入してください\n完了したらCtr+Dを押します"
    contents = readlines(chomp: true)
    CSV.open(file_name,'w') {|csv| csv << contents }

elsif input == "2"
    puts '編集するファイル名を入力してください'
    file_name = "#{gets.chomp}.csv"

    if File.exist?(file_name)
        puts "メモしたい内容を記入してください\n完了したらCtr+Dを押します"
        contents = readlines(chomp: true)
        CSV.open(file_name,'a') {|csv| csv << contents}
    else
        puts "#{file_name}は存在しません。"
    end

else
    puts '1、もしくは2を入力してください。最初からやり直してください'
end
