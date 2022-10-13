+++
title = "jQuery custom plugin skeleton with CoffeeScript"
date = 2013-02-27
author = "Andrea Pavoni"
description = "A basic example to show how to implement simple/clean jQuery plugin with CoffeeScript."
+++

This snippet might be used as a skeleton for simple jQuery plugins to be used inside your web apps:

```coffee
# jQuery custom plugin skeleton with CoffeeScript
class MyPlugin
  someMethod: (args) ->
    # do something

  constructor: (element, params) ->
    @someMethod(some_args)
    # do something

# install in the window namespace
window.MyPlugin = MyPlugin

# create jQuery plugin
$.fn.myPlugin = (params) ->
  new MyPlugin($(@), params)
  return $(@)

# Usage:
# $('#element').myPlugin(params)
```

**NOTE:** also check discussions on this [gist](https://gist.github.com/andreapavoni/5064928).
