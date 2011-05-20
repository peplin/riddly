#!/usr/bin/env /media/disk-a/bzr/riddly/riddly-app/script/runner

FileUtils.mkdir_p("text-dump")
Dir.chdir("text-dump") do
    Tiddler.all.each do |tiddler|
        tiddler.tags.split.each do |tag|
            FileUtils.mkdir_p(tag)
            safe_title = tiddler.title.downcase.gsub!(/[^0-9A-Za-z.\-]/, '-')
            File.open(tag + "/" + safe_title + ".txt", 'w') do |file|
                file.write tiddler.body
            end if safe_title
        end
    end
end
