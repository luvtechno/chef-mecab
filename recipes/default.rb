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

mecab_src_url = "https://mecab.googlecode.com/files/mecab-#{node['mecab']['version']}.tar.gz"
mecab_src_filepath  = "#{Chef::Config['file_cache_path'] || '/tmp'}/mecab-#{node['mecab']['version']}.tar.gz"

remote_file mecab_src_filepath do
  source mecab_src_url
  checksum node['mecab']['checksum']
  backup false
end

bash "compile_mecab_source" do
  cwd ::File.dirname(mecab_src_filepath)
  code <<-EOH
    tar zxf #{::File.basename(mecab_src_filepath)} -C #{::File.dirname(mecab_src_filepath)} &&
    cd mecab-#{node['mecab']['version']} &&
    ./configure &&
    make &&
    make check &&
    make install
  EOH
end
