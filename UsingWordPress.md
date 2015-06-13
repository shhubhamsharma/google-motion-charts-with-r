# Using googleVis output with WordPress #

[WordPress](http://wordpress.org/) is a popular web software for
creating websites and blogs. Here we give some tips about the
usage with googleVis output.

By default WordPress does not allow JavaScript code (and hence googleVis
output) to be inserted into a page. However, additional plugins
allow us to extend the functions of WordPress.

One option of embedding JavaScript code inside a WordPress post is to use
the ["custom fields shortcode"](http://wordpress.org/extend/plugins/custom-fields-shortcode)
plugin.
This plugin allows you to create a custom field for the googleVis
code, which can be referred to in your article.

Suppose you created a motion chart in R:
```
M <- gvisMotionChart(Fruits, "Fruit", "Year",
		     options=list(width=400, height=370))
```
Copy the chart code, e.g. from
```
print(M, 'chart')
```
and paste it into the value text area of a custom field in WordPress, e.g.
with instance name `Fruits`.  To include the motion chart into your article add
`[cf]Fruits[/cf]` into the post, see the figure below for
an illustration. For more details see also the [vignette](http://cran.r-project.org/web/packages/googleVis/vignettes/googleVis.pdf).

![http://google-motion-charts-with-r.googlecode.com/svn/trunk/vignettes/CreatePost.png](http://google-motion-charts-with-r.googlecode.com/svn/trunk/vignettes/CreatePost.png)