#
# Cookbook Name:: mecab
# Recipe:: default
#
# Copyright 2013, Wantedly, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

default['mecab']['version'] = '0.996'
default['mecab']['checksum'] = '15baca0983a61c1a49cffd4a919463a0a39ef127'
default['mecab']['url'] = 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE'

default['mecab']['ipadic']['version'] = '2.7.0-20070801'
default['mecab']['ipadic']['checksum'] = '0d9d021853ba4bb4adfa782ea450e55bfe1a229b'
default['mecab']['ipadic']['url'] = 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM'

default['mecab']['additonal_dictionary_path'] = nil

default['mecab']['ruby']['version'] = '0.996'
default['mecab']['ruby']['gem_version'] = '0.99'
default['mecab']['ruby']['checksum'] = '5730d9667118d79ad6f2c49f45476d0874718d10'
