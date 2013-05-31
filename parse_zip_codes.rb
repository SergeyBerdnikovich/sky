#!/usr/bin/env ruby
# encoding: UTF-8
require 'fileutils'
require 'yaml'
require 'mysql2'

$env = 'production'
config = YAML.load_file('config/database.yml')

  sqlconf = {
        :host => "localhost",
        :database => config[$env]['database'],
        :reconnect => true,  # make sure you have correct credentials
        :username => config[$env]['username'],
        :password => config[$env]['password'],
        :size => 30,
        :reconnect => true,
        :connections => 50
      }



$sql = Mysql2::Client.new(sqlconf)

text = File.read('free-zipcode-database.csv') 

results = text.scan(/(?:^.*?,")(.*?)(?:",".*?",")(.*?)(?:",")(.*?)(?:",".*?",)(.*?)(?:,)(.*?)(?:,)/)
first = true
results.each{|val|
    if first == false
        p val
        check = $sql.query("SELECT * FROM zip_codes WHERE zipcode = #{val[0]} LIMIT 1")
        if check.to_a.size == 0
            p val
            val[3] = 0.0 if val[3] == nil
            val[3] = 0.0 if val[3] == ""
            val[4] = 0.0 if val[4] == nil
            val[4] = 0.0 if val[4] == ""
            p "INSERT INTO zip_codes VALUES(#{val[0]} , '#{val[1]}', '#{val[2]}', #{val[3]},#{val[4]},NOW(),NOW())"
            $sql.query("INSERT INTO zip_codes (`zipcode`,`city`,`state`, `lat`, `long`, `created_at`, `updated_at` ) VALUES (#{val[0]} , '#{val[1]}', '#{val[2]}', #{val[3]},#{val[4]},NOW(),NOW())")
        end

    end

    first = false

}