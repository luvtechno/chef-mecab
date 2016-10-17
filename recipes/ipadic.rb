#
# Cookbook Name:: mecab
# Recipe:: ipadic
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

ipadic_src_url = node['mecab']['ipadic']['url']
ipadic_src_filepath  = "#{Chef::Config['file_cache_path'] || '/tmp'}/mecab-ipadic-#{node['mecab']['ipadic']['version']}.tar.gz"

remote_file ipadic_src_filepath do
  source ipadic_src_url
  checksum node['mecab']['ipadic']['checksum']
  backup false
end

bash "unarchive_and_configure_ipadic" do
  cwd ::File.dirname(ipadic_src_filepath)
  code <<-EOH
    tar zxf #{::File.basename(ipadic_src_filepath)} -C #{::File.dirname(ipadic_src_filepath)} &&
    cd mecab-ipadic-#{node['mecab']['ipadic']['version']} &&
    ./configure --with-charset=utf-8
  EOH
end

additonal_dictionary_path = node['mecab']['additonal_dictionary_path']
if node['mecab']['additonal_dictionary_path']
  bash "copy_additional_dictionary_files" do
    cwd ::File.dirname(ipadic_src_filepath)
    code <<-EOH
      cd mecab-ipadic-#{node['mecab']['ipadic']['version']} &&
      cp #{additonal_dictionary_path}/*.csv . &&
      /usr/local/libexec/mecab/mecab-dict-index -f euc-jp -t utf8
    EOH
  end
end

bash "make_and_install_ipadic" do
  cwd ::File.dirname(ipadic_src_filepath)
  code <<-EOH
    cd mecab-ipadic-#{node['mecab']['ipadic']['version']} &&
    make &&
    make install
  EOH
end
