namespace :migrate_lint do
  desc 'テーブルとかカラム名typo検知用'
  task check: :environment do
    # テーブル取得
    tables = ActiveRecord::Base.connection.tables
    columns = []
    # カラム名取得
    tables.map {|table| Object.const_get(table.classify) rescue nil }.compact.each do |klass|
      klass.column_names.each { |column| columns << column }
    end

    strange_wards_in_tablenames = []
    lemmatizer = Lemmatizer::Lemmatizer.new
    tables.each do |table|
       table.split("_").each do |word|
         strange_wards_in_tablenames <<  word unless lemmatizer.my_lemma(word)
       end
    end

    strange_words_in_columns = []
    columns.each do |column|
      column.split("_").each do |word|
        strange_words_in_columns << word unless lemmatizer.my_lemma(word)
      end
    end

    puts "These word using in table name is strange."
    strange_wards_in_tablenames.uniq.each do |word|
      puts word
    end

    puts "These word using in column name"
    strange_words_in_columns.uniq.each do |word|
      puts word
    end
  end
end
