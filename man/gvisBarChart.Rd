\name{gvisBarChart}
\alias{gvisBarChart}
\title{
Google Bar Chart with R
}
\description{
  The gvisBarChart function reads a data.frame and
  creates text output referring to the Google Visualisation API which can be
  included into a web page, or as a stand-alone page. The actual chart is
  rendered by the web browser using SVG or
  VML. 
}
\usage{
gvisBarChart(data, xvar = "", yvar = "", options = list(), chartid)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{data}{a \code{\link{data.frame}} to be displayed as a bar chart
  }
  \item{xvar}{
    name of the character column which contains the category labels for
    the x-axes.
  }
  \item{yvar}{a vector of column names of the numerical variables to be
    plotted. 
    Each column is displayed as a separate bar/column.
  }
  \item{options}{list of configuration options for Google Bar Chart.
    The possible components are, taken from
    \url{http://code.google.com/apis/visualization/documentation/gallery/barchart.html#Configuration_Options}:
    \describe{
      \item{axisTitlesPosition}{a string. Default 'out'. Where to place
	the axis titles, compared to the chart area. Supported values:
	\describe{      
	  \item{in}{Draw the axis titles inside the the chart area.}
	  \item{out}{Draw the axis titles outside the chart area.}
	  \item{none}{Omit the axis titles.}
	}
      }
      \item{\code{backgroundColor}}{a string or object. Default \code{'white'}. The
	background color for the main area of the chart. Can be either a
	simple HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}, or an
	object with the following properties.
      }
      \item{\code{backgroundColor.stroke}}{a string. Default \code{'#666'}. The color of
	the chart border, as an HTML color string.
      }
      \item{\code{backgroundColor.strokeWidth}}{a number. Default 0. The border
	width, in pixels.
      }
      \item{\code{backgroundColor.fill}}{a string. Default \code{'white'}. The chart
	fill color, as an HTML color string.
      }
      \item{\code{chartArea}}{a string. Default \code{'null'}. An object with members to configure the
	placement and size of the chart area (where the chart itself is drawn,
	excluding axis and legends). Two formats are supported: a number, or a
	number followed by \code{\%}. A simple number is a value in pixels; a number
	followed by \code{\%} is a percentage. Example:
	
	\code{\{left:20,top:0,width:\"50\%\",height:\"75\%\"\}}
      }
      \item{\code{chartArea.left}}{a number or string. Default auto. How far to draw
	the chart from the left border.
      }
      \item{\code{chartArea.top}}{a number or string. Default auto. How far to
	draw the chart from the top border.
      }
      \item{\code{chartArea.width}}{a number or string. Default auto.	Chart
	area width.
      }
      \item{\code{chartArea.height}}{a number or string. Default auto.	Chart
	area height.
      }
      \item{\code{colors}}{An array of strings. Default 'colors'. The colors to
	use for the chart elements. An array of strings, where each element is
	an HTML color string, for example: \code{colors:['red','#004411']}.
      }
      \item{\code{fontSize}}{a number. Default automatic. The default font
	size, in pixels, of all text in the chart. You can override this
	using properties for specific chart elements.
      }
      \item{\code{fontName}}{a string. Default \code{'Arial'}. The default font face for
	all text in the chart. You can override this using properties for
	specific chart elements.
      }
      \item{\code{gridlineColor}}{a string. Default \code{'#CCC'}. The color of the
	gridlines inside the chart area. Specify a valid HTML color
	string.
      }
      \item{\code{hAxis}}{a json object. Default \code{'null'}. An object with members to configure
	various horizontal axis elements. To specify properties of this
	object, you can use object literal notation, as shown here:
	%\describe{
	%\item{
	\code{\{title: 'Hello', titleTextStyle: \{color: '#FF0000'\}\}}
	%}
	%}
      }
      \item{\code{hAxis.baseline}}{a number. Default automatic.
	\code{hAxis} property that specifies the baseline for the
	horizontal axis. If the baseline is smaller than the highest grid
	line or smaller than the lowest grid line, it will be rounded to
	the closest gridline.
      }
      \item{\code{hAxis.baselineColor}}{a string. Default
	'black'. \code{hAxis} property that specifies the color of the
	baseline for the horizontal axis. Can be any HTML color string, for
	example: \code{'red'} or \code{'#00cc00'}.
      }
      \item{\code{hAxis.direction}}{1 or -1. Default 1. The direction in which the
	values along the horizontal axis grow. Specify -1 to reverse the
	order of the values.
      }
      \item{\code{hAxis.format}}{a string. Default auto. A format string for
	numeric axis labels. This is a subset of the ICU pattern set. For
	instance, \code{\{format:'#,###\%'\}} will display values 1,000\%, 750\%,
	and 50\% for values 10, 7.5, and 0.5.
      }
      \item{\code{hAxis.logScale}}{Boolean. Default \code{FALSE}. \code{vAxis} property that
	makes the vertical axis a logarithmic scale (requires all values to
	be positive). Set to \code{TRUE} for yes.
      }
      
      \item{\code{hAxis.textPosition}}{a string. Default \code{'out'} Position of the
	horizontal axis text, relative to the chart area. Supported values:
	\code{'out', 'in', 'none'}.
      }
      \item{\code{hAxis.textStyle}}{a json object. Default \code{\{color: 'black',
	fontName: <global-font-name>, fontSize: <global-font-size>\}}
	An object that specifies the horizontal axis text style. The object has this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{hAxis.title}}{a string. Default \code{'null'}. \code{hAxis} property that
	specifies the title of the horizontal axis.
      }
      \item{\code{hAxis.titleTextStyle}}{a json object. Default \code{\{color: 'black',
	fontName: <global-font-name>, fontSize: <global-font-size>\}}. An
	object that specifies the horizontal axis title text style. The object
	has this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{hAxis.maxValue}}{a number. Default automatic. \code{hAxis} property
	that specifies the highest vertical axis grid line. The actual grid
	line will be the greater of two values: the maxValue option value,
	or the highest data value, rounded up to the next higher grid mark.
      }
      \item{\code{hAxis.minValue}}{a number. Default automatic. \code{hAxis} property that
	specifies the lowest vertical axis grid line. The actual grid line
	will be the lower of two values: the minValue option value, or the
	lowest data value, rounded down to the next lower grid mark.
      }
      \item{\code{height}}{a number. Default height of the containing
	element. Height of the chart, in pixels.
      }
      \item{\code{isStacked}}{Boolean. Default \code{FALSE}. If set to
	\code{TRUE}, bar values are stacked (accumulated).
      }
      \item{\code{legend}}{a string. Default \code{'right'}. Position of the legend. Can
	be one of the following:
	\describe{
	  \item{\code{'right'}}{To the right of the chart.
	  }
	  \item{\code{'top'}}{Above the chart.
	  }
	  \item{\code{'bottom'}}{Below the chart.
	  }
	  \item{\code{'none'}}{No legend is displayed.
	  }
	}
      }
      \item{\code{legendTextStyle}}{a json object. Default \code{\{color: 'black',
	fontName: <global-font-name>, fontSize: <global-font-size>\}}
	An object that specifies the legend text style. The object has this format:
	  \code{\{color: <string>, fontName: <string>, fontSize:
	    <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{reverseCategories}}{Boolean. Default \code{FALSE}. If set to true, will
	draw series from right to left. The default is to draw
	left-to-right.
      }
      \item{\code{title}}{a string. Default no title. Text to display above the chart.
      }
      \item{\code{titlePosition}}{a string. Default \code{'out'}.
	Where to place the chart title, compared to the chart
	area. Supported values:
	\describe{
	  \item{\code{'in'}}{Draw the title inside the chart area.
	  }
	  \item{\code{'out'}}{Draw the title outside the chart area.
	  }
	  \item{\code{'none'}}{Omit the title.
	  }
	}
      }
      \item{\code{titleTextStyle}}{a json object. Default
	\code{\{color:'black',fontName:<global-font-name>,fontSize:<global-font-size>\}}. An
	object that specifies the title text
	style. The object has this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{tooltipTextStyle}}{a json object. Default \code{\{color: 'black',
	fontName: <global-font-name>, fontSize: <global-font-size>\}}
	An object that specifies the tooltip text style. The object has this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{vAxis}}{a json object. Default \code{'null'}.
	An object with members to configure various vertical axis
	elements. To specify properties of this object, you can use object
	literal notation, as shown here:
	\code{\{title: 'Hello', titleTextStyle: \{color: '#FF0000'\}\}}
	}
      \item{\code{vAxis.direction}}{1 or -1. Default 1. The direction in which the
	values along the vertical axis grow. Specify -1 to reverse the
	order of the values.
      }
      \item{\code{vAxis.textPosition}}{a string. Default \code{'out'}. Position of the
	vertical axis text, relative to the chart area. Supported values:
	\code{'out', 'in', 'none'}.
      }
      \item{\code{vAxis.textStyle}}{a json object. Default
	\code{\{color: 'black',fontName: <global-font-name>, fontSize: <global-font-size>\}}. An
	object that specifies the vertical axis text style. The object has
	this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{vAxis.title}}{a string. Default no title. \code{vAxis} property that
	specifies a title for the vertical axis.
      }
      \item{\code{vAxis.titleTextStyle}}{a json object. Default \code{\{color: 'black',
	fontName: <global-font-name>, fontSize: <global-font-size>\}}. An
	object that specifies the vertical axis title text style. The
	object has this format:
	\code{\{color: <string>, fontName: <string>, fontSize: <number>\}}
	The color can be any HTML color string, for example: \code{'red'} or
	\code{'#00cc00'}. Also see \code{fontName} and \code{fontSize}.
      }
      \item{\code{width}}{a number. Default width of the containing element. Width of the chart, in
	pixels.
      }

      
    }    
  }
  \item{chartid}{character. If missing (default) a random chart id will be generated based on
    chart type and \code{\link{tempfile}}
  }
}\value{
  \code{gvisBarChart} returns a list of \code{\link{class}}
  "\code{gvis}" and "\code{list}".   
  
  An object of class "\code{gvis}" is a list containing at least the
  following components:
  \item{\code{type}}{Google visualisation type, here 'BarChart'}
  \item{\code{chartid}}{character id of the chart object. Unique chart
    ids are required to place several charts on the same page.
  }
  \item{\code{html}}{a list with the building blocks for a page
    \describe{
      \item{\code{header}}{a character string of a html page header:
	\code{<html>...<body>},}
      \item{\code{chart}}{a named character vector of the chart's building blocks:
      	\describe{
	  \item{\code{jsHeader}}{Opening \code{<script>} tag and
	    reference to Google's JavaScript library.
	  }
	  \item{\code{jsData}}{JavaScript function defining the input
	    \code{data} as a JSON object.
	  } 
	  \item{\code{jsDrawChart}}{JavaScript function
	    combing the data with the visualisation API and user
	    options.
	  }
	  \item{\code{jsDisplayChart}}{JavaScript function calling the
	    handler to display the chart.
	  }
	  \item{\code{jsChart}}{Call of the \code{jsDisplayChart} 
	    function.
	  }
	  \item{\code{jsFooter}}{End tag \code{</script>}.
	  }
	  \item{\code{divChart}}{\code{<div>} container to embed the chart
	    into the page.
	  }
	}   
      }
      \item{\code{caption}}{character string of a standard caption,
	including data name and chart id.
      }	
      \item{\code{footer}}{character string of a html page footer:
	\code{</body>...</html>}, including the used R and googleVis version
	and link to Google's Terms of Use.}
    }
  }
}
\references{
  Google Bar Chart API:
  \url{http://code.google.com/apis/chart/interactive/docs/gallery/barchart.html} 

  Follow the link also for Google's Data Policy.

}
\author{
  Markus Gesmann \email{markus.gesmann@gmail.com},
  
  Diego de Castillo \email{decastillo@gmail.com}
}
\section{Warning}{
  Google Visualisation API: You cannot load both barchart/columnchart and corechart
  packages at the same time on the same page.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  See also \code{\link{print.gvis}}, \code{\link{plot.gvis}} for
  printing and plotting methods
}

\examples{
## Please note that by default the plot (better plot.gvis) command
## will open a browser window and requires an internet
## connection to display the visualisation.

df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Bar chart
Bar1 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Bar1)

## Stacked bar chart
Bar2 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
     options=list(isStacked=TRUE))
plot(Bar2)


## Add a customised title and smoothed curve
Bar3 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}",
                          curveType='function'))
plot(Bar3)

\dontrun{
## Change x-axis to percentages
Bar4 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
                       options=list(hAxis="{format:'#,###\%'}"))
plot(Bar4)
}

}
\keyword{ hplot }