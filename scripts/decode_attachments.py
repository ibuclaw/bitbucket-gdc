#!/usr/bin/python3
import json
import shutil

f = open('db-1.0.json', 'r')
js = json.load(f)

for att in js['attachments']:
    shutil.copyfile(att['path'], 'issues/' + str(att['issue']) + '_' + att['filename'])
