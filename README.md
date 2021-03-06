MeCab Cookbook
==============

Installs MeCab (http://mecab.googlecode.com/svn/trunk/mecab/doc/index.html) from source code.

Requirements
------------

### platforms

Only tested on Ubuntu 13.04 for purpose of use with Chef Solo (which doesn't mean this cookbook doesn't work with other platforms though.) Your feedback is appreciated.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### mecab::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mecab']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### mecab::default

Just include `mecab` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mecab]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author(s): [@luvtechno](https://github.com/luvtechno)
