#!/bin/bash

date=`date '+%Y-%m-%d'`
time=`date '+%Y-%m-%d %H:%M:%S'`

touch $date-${1}.markdown
echo "---
layout: default
title:  "${1}"
date: ${time} +0800 
categories: main
---

" >> $date-${1}.markdown
